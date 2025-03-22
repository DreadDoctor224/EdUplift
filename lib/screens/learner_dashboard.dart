import 'package:flutter/material.dart';

class LearnerDashboard extends StatelessWidget {
  const LearnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Welcome, Learner"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/profile.png'), // for the user profile pic
            ),
          ),
        ],
        backgroundColor: Colors.black,
        foregroundColor: Colors.amberAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search courses...",
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),

            // 🤖 AI Recommendations Section
            Text("AI Recommended Courses",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(4, (index) {
                  return Container(
                    width: 220,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course Title ${index + 1}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text("Short description goes here...",
                            style: TextStyle(fontSize: 13)),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("View More",
                                style: TextStyle(color: Colors.blue)),
                            Icon(Icons.arrow_forward_ios,
                                size: 14, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),

            // 📂 Recently Viewed
            Text("Recently Viewed",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.book, color: Colors.blue),
                  title: Text("Course ${index + 1}"),
                  subtitle: Text("Last accessed 2 days ago"),
                  trailing: Icon(Icons.download_rounded),
                  onTap: () {
                    // TODO: Navigate to course details
                  },
                );
              },
            ),

            const SizedBox(height: 30),

            // 🌐 Forum Access
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Navigate to community/forum
              },
              icon: Icon(Icons.forum),
              label: Text("Go to Community Forum"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.amberAccent,
                minimumSize: Size(double.infinity, 50),
              ),
            ),

            const SizedBox(height: 20),

            // 🏆 Gamification
            TextButton.icon(
              onPressed: () {
                // TODO: Navigate to gamification/achievements
              },
              icon: Icon(Icons.emoji_events_outlined),
              label: Text("View Achievements"),
            ),
          ],
        ),
      ),
    );
  }
}
