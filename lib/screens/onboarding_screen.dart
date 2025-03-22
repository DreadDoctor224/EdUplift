import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Add animations

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo Image
            Image.asset(
              "assets/logo.png", // Replace with your logo path
              height: 150,
            ).animate().fade(duration: 800.ms).slideY(), // Smooth animation

            SizedBox(height: 20),

            // App Name
            Text(
              "Welcome to EdUpLift",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ).animate().fade(duration: 1000.ms).slideY(),

            SizedBox(height: 10),

            // App Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "A smarter way to learn and teach. a pirate bay for education",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ).animate().fade(duration: 1200.ms).slideY(),

            SizedBox(height: 40),

            // Get Started Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 18, color: Colors.blueAccent),
              ),
            ).animate().fade(duration: 1400.ms).scale(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
