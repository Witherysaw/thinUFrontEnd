import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:innovationfinale/articles_controller.dart';
import 'colors.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:innovationfinale/premiumbanner.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  HomePageState getHomePageState() => HomePageState();

  @override
  HomePageState createState() => HomePageState();

}

class HomePageState extends State<HomePage> {
  final PremiumMembershipController premiumMembershipController =
  Get.find<PremiumMembershipController>();

  String username = "Khant Si Thu";

  // All journals
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;

  Widget _buildImageCard() {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: pickImage, // Trigger the image picker when tapped
        child: Container(
          height: 150,
          width: 300,
          child: Center(
            child: _selectedImage != null
                ? Image.memory(
              _selectedImage!,
              fit: BoxFit.cover,
            )
                : Icon(
              Icons.add_a_photo,
              size: 40,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Uint8List? _selectedImage;

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void showForm(int? id) async {
    if (id != null) {
      final existingJournal = _journals.firstWhere((element) => element['id'] == id, orElse: () => {});
      _titleController.text = existingJournal['title'] ?? '';
      _descriptionController.text = existingJournal['content'] ?? '';
    } else {
      // Set default values when creating a new item
      _titleController.text = '';
      _descriptionController.text = '';
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          // Clear the selected image when back button is pressed
          setState(() {
            _selectedImage = null;
          });
          return true; // Allow the back action to proceed
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: tuDarkBlue,
            title: Text('Create An Article'),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: tuLightBlue,
                    minimumSize: Size(100, 40),// Change to your desired color
                  ),
                  onPressed: () async {
                    // Save new journal
                    if (id == null) {
                      await _addItem();
                    }

                    if (id != null) {
                      await _updateItem(id);
                    }

                    // Clear the text fields
                    _titleController.text = '';
                    _descriptionController.text = '';
                    _selectedImage = null;

                    // Close the bottom sheet
                    Navigator.of(context).pop();
                  },
                  child: Text(id == null ? 'Post' : 'Update'),
                ),
              ),
            ],
          ),
          body:
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 20,
                right: 25,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.lightBlue,
                            width: 2,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),

                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username, // Always set username as poster
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Content'),
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: _buildImageCard(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }));
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final selectedImage = await imageFile.readAsBytes();

      setState(() {
        _selectedImage = selectedImage;
      });
    }
  }


  // Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        username, _titleController.text, _descriptionController.text, _selectedImage);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, username, _titleController.text, _descriptionController.text, _selectedImage);
    _refreshJournals();
  }


  // Delete an item
  void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Opacity
          Opacity(
            opacity: 0.5, // Adjust the opacity as needed
            child: Image.asset(
              'your_background_image.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              PremiumMembershipAd(), // Display the premium membership ad
              _isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: _journals.length,
                  itemBuilder: (context, index) {
                    final journal = _journals[index];
                    return ArticleCard(
                      journal: journal,
                      showFormCallback: showForm, // Pass the callback function
                      deleteItemCallback: deleteItem,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showForm(null),
      ),
    );
  }


}

class ArticleImage extends StatelessWidget {
  final Uint8List imageData;

  const ArticleImage({super.key, required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Image.memory(imageData); // Display the image from bytes
  }
}



class ArticleCard extends StatefulWidget {
  final Map<String, dynamic> journal;
  final void Function(int?) showFormCallback; // Callback function for showing the form
  final void Function(int) deleteItemCallback; // Callback function for deleting an item

  const ArticleCard({super.key,
    required this.journal,
    required this.showFormCallback,
    required this.deleteItemCallback,
  });

  @override
  ArticleCardState createState() => ArticleCardState();
}

class ArticleCardState extends State<ArticleCard> {
  bool showFullContent = false;
  bool isLiked = false;
  bool isSaved = false;



  @override
  void initState() {
    super.initState();
    // Initialize isLiked and isSaved based on the values in the database
    fetchLikedStatus();
    fetchSavedStatus();
  }

  // Function to fetch the liked status from the database
  void fetchLikedStatus() async {
    final journal = widget.journal;
    final likedStatus = await SQLHelper.getItem(journal['id']);
    setState(() {
      isLiked = likedStatus[0]['liked'] == 'TRUE';
    });
  }

  // Function to fetch the saved status from the database
  void fetchSavedStatus() async {
    final journal = widget.journal;
    final savedStatus = await SQLHelper.getItem(journal['id']);
    setState(() {
      isSaved = savedStatus[0]['saved'] == 'TRUE';
    });
  }

  @override
  Widget build(BuildContext context) {
    final journal = widget.journal;



    return Card(
      color: Colors.white, // Make the card background transparent
      margin: const EdgeInsets.all(15),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
        side: BorderSide(
          color: tuDarkBlue, // Border color
          width: 1.5, // Border width
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left : 0,
            child: Image.asset(
              'images/uc.png',
              width: 75,
              height: 75,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'images/articlebg.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.lightBlue, // Border color
                        width: 2, // Border width
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 20, // Adjust the radius to increase the size
                      backgroundColor: Colors.grey, // Background color for the CircleAvatar
                      child: Icon(
                        Icons.person, // You can replace this with your profile picture
                        color: Colors.white, // Icon color
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ // Add spacing between the CircleAvatar and title
                      Text(
                        journal['poster'], // Title text
                        style: const TextStyle(
                          fontSize: 18, // Adjust the font size as needed
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                      ),
                      Text(
                        DateFormat('MMM y').format(DateTime.parse(journal['createdAt'])), // Subtitle text
                        style: const TextStyle(
                          fontSize: 16, // Adjust the font size as needed
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  journal['title'], // Title text
                  style: const TextStyle(
                    fontSize: 20, // Adjust the font size as needed
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: ReadMoreText(
                  '${journal['content']}  ',
                  colorClickableText: Colors.blueGrey,
                  trimLength: 200,
                  trimMode: TrimMode.Length,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Read less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              // if (journal['content'].length > 100) // Display the button conditionally
              //   Align(
              //     alignment: Alignment.center, // Align the button to the right
              //     child: TextButton(
              //       onPressed: () {
              //         setState(() {
              //           showFullContent = !showFullContent;
              //         });
              //       },
              //       child: Text(
              //         showFullContent ? 'See Less' : 'See More',
              //         style: const TextStyle(
              //           color: Colors.blue,
              //         ),
              //       ),
              //     ),
              //   ),

              if (journal['img'] != null && journal['img'].isNotEmpty)
                ArticleImage(imageData: journal['img']),

                // Check for a valid image URL// Display image if it's available
              // Row(
              //   children: [
              //     IconButton(
              //       icon: const Icon(Icons.edit),
              //       onPressed: () => widget.showFormCallback(journal['id']),
              //     ),
              //     IconButton(
              //       icon: const Icon(Icons.delete),
              //       onPressed: () => widget.deleteItemCallback(journal['id']),
              //     ),
              //   ],
              // ),

              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        // Update the 'liked' column in the database
                        SQLHelper.updateLike(journal['id'], isLiked ? 'TRUE' : 'FALSE');
                        fetchLikedStatus();
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark_added : Icons.bookmark_border,
                    ),
                    onPressed: () {
                      setState(() {
                        isSaved = !isSaved;
                        // Update the 'saved' column in the database
                        SQLHelper.updateSaved(journal['id'], isSaved ? 'TRUE' : 'FALSE');
                        fetchSavedStatus();
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SavedArticlesPage1 extends HomePage {
  const SavedArticlesPage1({Key? key}) : super(key: key);

  @override
  SavedArticlesPageState createState() => SavedArticlesPageState();
}

class SavedArticlesPageState extends HomePageState {
  @override
  void _refreshJournals() async {
    final data = await SQLHelper.getSavedArticles();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _journals.length,
        itemBuilder: (context, index) {
          final journal = _journals[index];
          return ArticleCard(
            journal: journal,
            showFormCallback: showForm, // Pass the callback function
            deleteItemCallback: deleteItem,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showForm(null),
      ),
    );
  }
}



