import 'package:flutter/material.dart';

class EducatorDashboard extends StatelessWidget {
  const EducatorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Welcome, Educator"),
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            onSelected: (value) {
              if (value == 'logout') {
                // TODO: Add logout functionality
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // 📘 My Courses Section
            Text("My Courses",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white)),
            const SizedBox(height: 10),
            ...List.generate(3, (index) {
              return Card(
                color: Colors.grey[900],
                margin: const EdgeInsets.only(bottom: 10),
                elevation: 1,
                child: ListTile(
                  leading: const Icon(Icons.menu_book,
                      color: Color.fromARGB(255, 183, 77, 58)),
                  title: Text("Course ${index + 1}",
                      style: const TextStyle(color: Colors.white)),
                  subtitle: Text(
                    "Enrolled: ${30 + index * 10} | Downloads: ${50 + index * 5}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      // TODO: Edit/Delete
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'edit', child: Text('Edit')),
                      PopupMenuItem(value: 'delete', child: Text('Delete')),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            // 📊 Analytics
            Text("Student Engagement",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildStatRow("Total Views", 320, Icons.visibility),
                  _buildStatRow("Downloads", 178, Icons.download),
                  _buildStatRow("Comments", 65, Icons.comment),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🤖 Launch AI Quiz
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Navigate to AI Quiz Generator
              },
              icon: const Icon(Icons.smart_toy_outlined),
              label: const Text("Launch AI Quiz Generator"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),

            const SizedBox(height: 15),

            // 📤 Upload Course
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Navigate to Upload Course Page
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Course"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, int value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 183, 77, 58)),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text(value.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
