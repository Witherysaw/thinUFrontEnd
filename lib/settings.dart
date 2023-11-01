import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Change Password'),
              leading: const Icon(Icons.lock),
              onTap: () {
                // Handle change password action

              },
            ),
            ListTile(
              title: const Text('Privacy Settings'),
              leading: const Icon(Icons.security),
              onTap: () {
                // Handle privacy settings action

              },
            ),
            const SizedBox(height: 24),
            const Text(
              'App Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Notifications'),
              leading: const Icon(Icons.notifications),
              onTap: () {
                // Handle notifications action
              },
            ),
            ListTile(
              title: const Text('Language'),
              leading: const Icon(Icons.language),
              onTap: () {
                // Handle language settings action

              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle logout action

              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Thin U',
    home: SettingsPage(),
  ));
}
