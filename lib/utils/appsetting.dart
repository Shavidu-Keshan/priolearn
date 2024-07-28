import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding:
              const EdgeInsets.only(left: 80.0), // Add left padding of 80.0
          child: Text(
            'App Settings',
            style: TextStyle(
              fontSize: 32,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(80.0), // Set padding around the ListView
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Profile Settings',
                style: TextStyle(fontSize: 25), // Adjust the fontSize as needed
              ),
              onTap: () {
                // Navigate to Profile Settings
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                'Privacy & Security',
                style: TextStyle(fontSize: 25), // Adjust the fontSize as needed
              ),
              onTap: () {
                // Navigate to Privacy & Security
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                'Notifications',
                style: TextStyle(fontSize: 25), // Adjust the fontSize as needed
              ),
              onTap: () {
                // Navigate to Notifications
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                'Account Settings',
                style: TextStyle(fontSize: 25), // Adjust the fontSize as needed
              ),
              onTap: () {
                // Navigate to Account Settings
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                'Help',
                style: TextStyle(fontSize: 25), // Adjust the fontSize as needed
              ),
              onTap: () {
                // Navigate to Help
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(fontSize: 25), // Adjust the fontSize as needed
              ),
              onTap: () {
                // Navigate to About
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
