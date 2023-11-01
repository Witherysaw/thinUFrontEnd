import 'package:flutter/material.dart';
import 'package:innovationfinale/colors.dart';
import 'package:innovationfinale/quiz.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../login.dart';
import '../settings.dart';
import '../subscription.dart';
import 'quiz.dart';
import 'quiz_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              _buildProfile(),
              const SizedBox(height: 16),
              _buildFollowingStats(),
              const SizedBox(height: 8),
              _buildSection('Payment History', Icons.history),
              _buildSubscriptionSection(context),
              _buildEditProfileSection(),
              _buildSettingSection(context),
              _buildHelpandSupportSection('Help and Support', Icons.help,context),
              const SizedBox(height: 16),
              _buildSignOutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return SizedBox(
      height: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfilePicture(),
          const SizedBox(width: 20),
          Expanded(
            child: _buildProfileDetails(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Khant Si Thu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 24,
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          '@khant_12',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Account Type: Premium',
          style: TextStyle(
            fontSize: 16,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),
        _buildAccountLevel(),
      ],
    );
  }

  Widget _buildFollowingStats() {
    return Row(
      children: [
        _buildFollowingBox('Courses', '10', Colors.white, tuDarkBlue),
        const SizedBox(width: 16),
        _buildFollowingBox('Following', '100', Colors.white, tuDarkBlue),
      ],
    );
  }

  Widget _buildProfilePicture() {
    return const SizedBox(
      height: 120,
      width: 120,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://example.com/your_profile_image.jpg',
        ),
      ),
    );
  }

  Widget _buildAccountLevel() {
    return const Row(
      children: [
        Text(
          'Account Level: ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '6',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildFollowingBox(String title, String count, Color textColor, Color backgroundColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: () {


        },
      ),
    );
  }

  Widget _buildHelpandSupportSection(String title, IconData icon, BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizScreen()),
          );
        },
      ),
    );
  }

  Widget _buildEditProfileSection() {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.edit),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: () {


        },
      ),
    );
  }

  Widget _buildSubscriptionSection(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.payment),
        title: const Text(
          'Subscription',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SubscriptionPlans()),
          );
        },
      ),
    );
  }

  Widget _buildSettingSection(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.settings),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
        },
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(
          Icons.exit_to_app,
          color: Colors.red,
          size: 30,
        ),
        title: const Text(
          'Sign Out',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
        onTap: () {
          _showSignOutConfirmationDialog(context);
        },
      ),
    );
  }

  void _showSignOutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Are you sure you want to sign out?',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.success(
                            message:
                            "Sign Out Successful!",
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}