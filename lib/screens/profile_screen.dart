import 'package:eduplift/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Avatar
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.tealAccent,
              child: Icon(Icons.person, size: 60, color: Colors.black),
            ),
            const SizedBox(height: 20),

            // Username Placeholder
            const Text(
              "John Doe",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "johndoe@email.com",
              style: TextStyle(color: Colors.white54, fontSize: 16),
              // *the username and password are hard coded because firebase is not connected yet**
            ),

            const SizedBox(height: 30),

            // Profile Options
            _buildOptionTile(Icons.edit, "Edit Profile", onTap: () {
              // TODO: Navigate to Edit Profile
            }),
            _buildOptionTile(Icons.download, "My Downloads", onTap: () {
              // TODO: Show downloads
            }),
            _buildOptionTile(Icons.star, "My Contributions", onTap: () {
              // TODO: Show uploaded resources
            }),
            _buildOptionTile(Icons.settings, "Settings", onTap: () {
              // Optional: Navigate to settings screen
              // edit profile password username etc
            }),
            const Spacer(),

            // Logout Button
            ElevatedButton.icon(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String label,
      {required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.tealAccent),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 16),
      onTap: onTap,
    );
  }
}
