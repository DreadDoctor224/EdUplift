import 'package:eduplift/screens/educator_dashboard.dart';
import 'package:eduplift/screens/learner_dashboard.dart';
import 'package:eduplift/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
// Ensure this file exists in lib/screens/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EduLift",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const EducatorDashboard(), // ✅ Ensures app starts with Login Screen
    );
  }
}
