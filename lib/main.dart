import 'package:eduplift/admin_dashboard.dart';
import 'package:eduplift/screens/educator_dashboard.dart';
import 'package:eduplift/screens/graduate_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:eduplift/screens/login_screen.dart';
import 'package:eduplift/screens/signup_screen.dart';
import 'package:eduplift/screens/educator_dashboard.dart';
import 'package:eduplift/screens/learner_dashboard.dart';
import 'package:eduplift/screens/graduate_dashboard.dart';
import 'package:eduplift/screens/upload_resource_screen.dart';
import 'package:eduplift/screens/eduplift_feed_screen.dart';
import 'package:eduplift/screens/profile_screen.dart';
import 'package:eduplift/screens/resource_view_screen.dart';
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
      home:
          const EdupliftFeedScreen(), // ✅ Ensures app starts with Login Screen
    );
  }
}
