import 'package:flutter/material.dart';

class GraduateDashboard extends StatelessWidget {
  const GraduateDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Welcome, Graduate 🎓"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Handle logout
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 📚 Short Courses
          _sectionTitle("Recommended Short Courses"),
          _horizontalCardScroll([
            "Flutter Basics",
            "Data Structures in Python",
            "SQL for Beginners",
          ]),

          const SizedBox(height: 20),

          // 💼 Internships
          _sectionTitle("Internship Opportunities"),
          _jobTile("UI/UX Intern", "FigmaLab - Remote"),
          _jobTile("Junior Flutter Dev", "CodeNest - Onsite"),
          _jobTile("AI Research Intern", "NeuroSoft - Hybrid"),

          const SizedBox(height: 20),

          // 🧠 Interview Prep
          _sectionTitle("Interview Prep Material"),
          _simpleTile("Top 50 Flutter Questions"),
          _simpleTile("System Design Basics"),
          _simpleTile("Behavioral Interview Tips"),

          const SizedBox(height: 20),

          // 🚀 Upskilling
          _sectionTitle("Upskilling Resources"),
          _simpleTile("FreeCodeCamp Mobile Dev Track"),
          _simpleTile("LinkedIn Learning for Tech"),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _horizontalCardScroll(List<String> courseTitles) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courseTitles.length,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            margin: const EdgeInsets.only(right: 12, top: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              courseTitles[index],
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  Widget _jobTile(String title, String company) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        leading: const Icon(Icons.work, color: Colors.tealAccent),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(company, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: Colors.white38),
        onTap: () {
          // TODO: Navigate to job details
        },
      ),
    );
  }

  Widget _simpleTile(String title) {
    return Card(
      color: Colors.grey[850],
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.open_in_new, color: Colors.white54),
        onTap: () {
          // TODO: Open resource link or page
        },
      ),
    );
  }
}
