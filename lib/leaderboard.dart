import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Leaderboard'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ProfileWidget(
                      photoUrl: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp', // Replace with your photo URL
                      name: 'John', // Replace with your name
                      points: 90, // Replace with your points or score
                    ),
                  ),

                  ProfileWidget(
                    photoUrl: 'https://imgv3.fotor.com/images/gallery/a-man-profile-picture-with-blue-and-green-background-made-by-LinkedIn-Profile-Picture-Maker.jpg', // Replace with your photo URL
                    name: 'John Doe', // Replace with your name
                    points: 110, // Replace with your points or score
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: ProfileWidget(
                      photoUrl: 'https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg', // Replace with your photo URL
                      name: 'Mary', // Replace with your name
                      points: 70, // Replace with your points or score
                    ),
                  ),
                ],

              ),
              Stack(
                children: [
                  Container(
                    width: 400.0, // Set the width as needed
                    height: 540.7, // Set the height as needed

                    decoration: const BoxDecoration(
                      color: Colors.blue, // Set the background color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0), // Radius for the top-left corner
                        topRight: Radius.circular(20.0), // Radius for the top-right corner
                      ), // Set the border radius
                    ),
                  ),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: ProfileRow(
                          number: '4',
                          photoUrl: 'https://example.com/your_photo.jpg', // Replace with your photo URL
                          name: 'John Doe', // Replace with your name
                          points: 100, // Replace with your points or score
                        ),
                      ),
                      ProfileRow(
                        number: '5',
                        photoUrl: 'https://example.com/your_photo.jpg', // Replace with your photo URL
                        name: 'John Doe', // Replace with your name
                        points: 100, // Replace with your points or score
                      ),
                      ProfileRow(
                        number: '6',
                        photoUrl: 'https://example.com/your_photo.jpg', // Replace with your photo URL
                        name: 'John Doe', // Replace with your name
                        points: 100, // Replace with your points or score
                      ),
                      ProfileRow(
                        number: '6',
                        photoUrl: 'https://example.com/your_photo.jpg', // Replace with your photo URL
                        name: 'John Doe', // Replace with your name
                        points: 100, // Replace with your points or score
                      ),
                      ProfileRow(
                        number: '6',
                        photoUrl: 'https://example.com/your_photo.jpg', // Replace with your photo URL
                        name: 'John Doe', // Replace with your name
                        points: 100, // Replace with your points or score
                      ),
                      ProfileRow(
                        number: '6',
                        photoUrl: 'https://example.com/your_photo.jpg', // Replace with your photo URL
                        name: 'John Doe', // Replace with your name
                        points: 100, // Replace with your points or score
                      ),
                      ProfileRow(
                        number: '6',
                        photoUrl: 'https://example.com/your_photo.jpg', // Replace with your photo URL
                        name: 'John Doe', // Replace with your name
                        points: 100, // Replace with your points or score
                      ),
                    ],
                  )
                ],
              ),

            ],

          ),

        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String photoUrl;
  final String name;
  final int points;

  const ProfileWidget({super.key,
    required this.photoUrl,
    required this.name,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16.0),
        CircleAvatar(
          backgroundImage: NetworkImage(photoUrl),
          radius: 30.0, // Adjust the radius as needed
        ),
        const SizedBox(height: 16.0),
        Text(
          name,
          style: const TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          '$points Pts',
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String number;
  final String photoUrl;
  final String name;
  final int points;

  const ProfileRow({super.key,
    required this.number,
    required this.photoUrl,
    required this.name,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        padding: const EdgeInsets.all(8.0),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white// Set the border radius
        ),
        child: Row(
          children: [
            Text(
              number,
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10.0), // Add space between number and photo
            CircleAvatar(
              backgroundImage: NetworkImage(photoUrl),
              radius: 20.0, // Adjust the radius as needed
            ),
            const SizedBox(width: 16.0), // Add space between photo and name/points
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 130),
                Text(
                  '$points Pts',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}