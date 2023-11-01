import 'package:flutter/material.dart';
import 'colors.dart';

class CourseListScreen extends StatelessWidget {
  final List<String> categories = [
    "All Topics",
    "Technology",
    "Arts",
    "Engineering",
    "Marketing",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),

            Container(
              height: 125.0,
              width: 400.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('images/CourseIntro.jpg'))),
            ),
            //  TextField(
            //  decoration: InputDecoration(
            //   hintText: 'Search courses',
            // /    prefixIcon: Icon(Icons.search),
            //     border: OutlineInputBorder(),
            //    ),
            //  ),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle category selection
                      },
                      child: Text(category),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(tuLightBlue), // Set your desired color
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  'Recommendation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle "See All" button tap
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 5),
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Replace with the actual number of courses
                itemBuilder: (BuildContext context, int index) {
                  return CourseCard(
                    courseTitle: 'Course $index',
                    authorName: 'Author Name',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseTitle;
  final String authorName;

  CourseCard({
    required this.courseTitle,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 180,
        margin: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage(
                    'images/CourseIntro.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              courseTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              authorName,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 3),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailScreen(
                      courseTitle: courseTitle,
                    ),
                  ),
                );
              },
              child: Text('View Course'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(tuLightBlue), // Set your desired color
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CourseDetailScreen extends StatelessWidget {
  final String courseTitle;

  CourseDetailScreen({
    required this.courseTitle,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Preview'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Preview
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.grey, // Placeholder for video preview
              ),
            ),
            // Title and Info
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Building Web Applications - Intermediate Level',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Text('Learn how to build a secure ecommerce application'),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_border),
                    ],
                  ),
                  const Row(
                    children: [
                      Text('344 ratings, 100 students'),
                    ],
                  ),
                  SizedBox(height: 16),
                  const Text(
                    'Created by TS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.purple),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Colors.black,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Myanmar'),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.subtitles, color: Colors.black, size: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Myanmar'),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.warning, color: Colors.black, size: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Last updated 3/2023'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  const Text(
                    '\$79.99',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: SizedBox(
                      width: 200.0, // Set the desired width
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: SizedBox(
                      width: 200.0, // Set the desired width
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(),
                        child: Text('Add to Wishlist'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.black12, // Grey background color
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'What You\'ll Learn',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        // List of sentences with "right" icons
                        _buildLearnListItem('How to build a back end API'),
                        _buildLearnListItem('How to build a front end website'),
                        _buildLearnListItem('How to build microservices'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Lessons Section
                  const Row(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Curriculum',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('10 Lessons | 100m total length',style: TextStyle(color: Colors.grey,fontSize: 13),),
                      ),
                    ],
                  ),

                  // -------------------------------------Lesson Details
                  // ------------------------------------------
                  // -----------------------------------------
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: ListView.builder(

                      shrinkWrap: true,
                      itemCount: 5, // Replace with the actual number of lessons
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(

                          title: Text('Lesson ${index + 1}'),
                          subtitle: Text(
                              'Video duration: 20 minutes'), // Replace with actual video information
                          onTap: () {
                            // Handle lesson tap (e.g., navigate to video player)
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 30),

//---------------------------------- This course includes
                  // -------------------------------------
                  // ------------------------------------------
                  Container(
                    color: Colors.black12, // Grey background color
                    padding: EdgeInsets.all(20.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This course includes',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),

                        Row(
                          children: [
                            Icon(Icons.video_library_rounded, color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('100 minutes on-demand video'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.quiz_outlined, color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('1 Quiz'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.file_open, color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('25 Support files'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.mobile_friendly, color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('Access on mobile and desktop'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.price_change, color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('Certificate of completion'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  //---------------------------------- Requirements
                  // -------------------------------------
                  // ------------------------------------------

                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Requirements',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Icon(Icons.arrow_right, color: Colors.black, size: 17),
                            Expanded( // Wrap the text in an Expanded widget
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('A basic understanding of the programming language'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.arrow_right, color: Colors.black, size: 17),
                            Expanded( // Wrap the text in an Expanded widget
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('A basic understanding of HTML, CSS and JavaScript'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.arrow_right, color: Colors.black, size: 17),
                            Expanded( // Wrap the text in an Expanded widget
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('A basic understanding of SQL Syntax'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 30),

                  //---------------------------------- Description
                  // -------------------------------------
                  // ------------------------------------------
                  Container(
                    color: Colors.black12, // Grey background color
                    padding: EdgeInsets.all(20.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'This course is the followup to Building Modern Web Applications in here. In this course, we go further than we did the first time around. We will build a sample E-Commerce application that consists of multiple, separate applications: ... ',
                          style: TextStyle(
                              fontSize: 15.0,
                              height: 1.5
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Show more ...', style: TextStyle(color: Colors.purple),)



                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  //---------------------------------- Instructor
                  // -------------------------------------
                  // ------------------------------------------
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Instructor Title
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Instructor',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Instructor Info
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Ph.D.'),
                              SizedBox(height: 8.0),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: AssetImage('images/CourseIntro.jpg'), // Replace with instructor's image
                                  ),
                                  SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Instructor Rating: 4.7'),
                                      SizedBox(height: 5,),
                                      Text('Reviews: 863'),
                                      SizedBox(height: 5,),
                                      Text('Students: 2,345'),
                                      SizedBox(height: 5,),
                                      Text('Courses: 12'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'I have twenty years of experience in professional software development, and twenty years of experience as a University professor. As an entrepreneur, I have worked with a broad range of clients, including Thomson...',
                                style: TextStyle(height: 1.5),
                              ),
                              SizedBox(height: 5,),
                              Text('Show more', style: TextStyle(color: Colors.purple),)
                            ],
                          ),
                        ),

                        // View Profile Button
                        Center(
                          child: SizedBox(
                            width: 200.0, // Set the desired width
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                              ),
                              child: const Text('View Profile'),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30,),
                        // Student Feedback Title

                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Rating',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              _buildRatingBar('5 Stars', 4.5), // 95% rating
                              _buildRatingBar('4 Stars', 4), // 80% rating
                              _buildRatingBar('3 Stars', 3.5), // 60% rating
                              _buildRatingBar('2 Stars', 1), // 40% rating
                              _buildRatingBar('1 Star', 0),  // 20% rating
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),





                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildLearnListItem(String text) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: Colors.black,
          size: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(text),
        ),
      ],
    );
  }
  Widget _buildRatingBar(String label, double rating) {
    final int filledStars = rating.floor();
    final bool hasHalfStar = (rating - filledStars) >= 0.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8.0),
        Row(
          children: [
            // Filled stars
            for (int i = 0; i < filledStars; i++)
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),

            // Half star if necessary
            if (hasHalfStar)
              Icon(
                Icons.star_half,
                color: Colors.yellow,
                size: 20,
              ),

            // Empty stars to complete 5 stars
            for (int i = 0; i < (5 - filledStars - (hasHalfStar ? 1 : 0)); i++)
              Icon(
                Icons.star_border,
                color: Colors.black,
                size: 20,
              ),

            SizedBox(width: 16.0),
            Text('$rating / 5.0'), // Display rating out of 5
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}