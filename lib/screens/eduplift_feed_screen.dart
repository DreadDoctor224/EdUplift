//****current file is static for now but it is structured so that we can plug it later into firebase */
import 'package:eduplift/screens/resource_view_screen.dart';
import 'package:flutter/material.dart';

class EdupliftFeedScreen extends StatelessWidget {
  const EdupliftFeedScreen({super.key});

  final List<Map<String, String>> mockUploads = const [
    {
      'title': 'Introduction to Python',
      'description': 'A beginner-friendly PDF on Python basics.',
      'tag': 'Computer Science',
    },
    {
      'title': 'Human Anatomy - Lecture 1',
      'description': 'Video lecture with labeled diagrams.',
      'tag': 'Health',
    },
    {
      'title': 'Business Model Canvas',
      'description': 'Framework to design and test business ideas.',
      'tag': 'Business',
    },
    {
      'title': 'Modern Art Trends 2024',
      'description': 'Slides from an art theory course.',
      'tag': 'Arts',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EduLift Resource Feed"),
        backgroundColor: Colors.amberAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // TODO: Refresh the list (if connected to backend)
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockUploads.length,
        itemBuilder: (context, index) {
          final upload = mockUploads[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: const Icon(Icons.folder_open, color: Colors.redAccent),
              title: Text(
                upload['title'] ?? '',
                style: const TextStyle(color: Colors.redAccent),
              ),
              subtitle: Text(
                "${upload['description']}\n📎 ${upload['tag']}",
                style: const TextStyle(color: Colors.white70),
              ),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.white38),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResourceViewScreen(
                      title: upload['title']!,
                      description: upload['description']!,
                      tag: upload['tag']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
