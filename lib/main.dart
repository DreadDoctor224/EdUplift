import 'package:eduplift/screens/educator_dashboard.dart';
import 'package:eduplift/screens/graduate_dashboard.dart';
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
      title: "EdupLift",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GraduateDashboard(), // ✅ Ensures app starts with Login Screen
    );
  }
}
