import 'package:flutter/material.dart';
import 'package:innovationfinale/profile.dart';
import 'package:innovationfinale/search.dart';
import 'package:innovationfinale/article_view.dart';
import 'package:innovationfinale/courses.dart';
import 'package:innovationfinale/notifications.dart';
import 'colors.dart';
import 'subscription.dart';
// import 'package:innovationfinale/SavedArticlesPage.dart';
// import 'package:innovationtest/articles.dart';
// import 'package:innovationtest/leader_board.dart';

// import 'package:innovationtest/profile.dart';
// import 'package:innovationtest/home.dart';
// import 'package:innovationtest/article_view.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CourseListScreen(),
    SearchPage(),
    SavedArticlesPage1(),
    ProfilePage(),
  ];
  String username = 'Richard';
  String email = 'thureinrichard3@gmail.com';
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            // Add your logo image here
            Image.asset(
              'images/logo.png', // Replace with the path to your logo image
              width: 40, // Adjust the width as needed
              height: 40, // Adjust the height as needed
            ),
            const SizedBox(width: 8), // Add some spacing between the logo and title
            const Text(
              'Thin U', // Title text
              style: TextStyle(
                fontSize: 18, // Adjust the font size as needed
                color: Colors.black
              ),
            ),
          ],
        ),
        actions: [
          // Add a notification icon button here
          IconButton(
            icon: Icon(Icons.notifications),
            color: tuDarkBlue,
            iconSize: 32,
            onPressed: () {
              // Navigate to the notifications.dart page when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.diamond_outlined),
            color: tuDarkBlue,
            iconSize: 32,
            onPressed: () {
              // Navigate to the notifications.dart page when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubscriptionPlans(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: 'Watched List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}



// class DiamondButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: InkResponse(
//         onTap: () {
//           // Handle button press here
//         },
//         child: CustomPaint(
//           size: Size(100, 100), // Adjust the size as needed
//           painter: DiamondPainter(),
//         ),
//       ),
//     );
//   }
// }
//
// class DiamondPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue // Diamond color
//       ..style = PaintingStyle.fill;
//
//     final double width = size.width;
//     final double height = size.height;
//
//     Path path = Path()
//       ..moveTo(0, height / 2)
//       ..lineTo(width / 2, 0)
//       ..lineTo(width, height / 2)
//       ..lineTo(width / 2, height)
//       ..close();
//
//     canvas.drawPath(path, paint);
//
//     // Shining effect
//     Paint shiningPaint = Paint()
//       ..color = Colors.white // Glint color
//       ..style = PaintingStyle.fill;
//
//     final double glintWidth = width / 3;
//     final double glintHeight = height / 3;
//
//     Rect glintRect = Rect.fromLTWH(width / 2 - glintWidth / 2, height / 2 - glintHeight / 2, glintWidth, glintHeight);
//     canvas.drawOval(glintRect, shiningPaint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
