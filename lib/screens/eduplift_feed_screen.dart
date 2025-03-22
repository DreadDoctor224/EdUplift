import 'package:flutter/material.dart';
import 'resource_view_screen.dart';

class EdupliftFeedScreen extends StatefulWidget {
  const EdupliftFeedScreen({super.key});

  @override
  State<EdupliftFeedScreen> createState() => EdupliftFeedScreenState();
}

class EdupliftFeedScreenState extends State<EdupliftFeedScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedTag = 'All';

  final List<Map<String, String>> allResources = [
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

  List<String> get tags {
    final uniqueTags = allResources.map((e) => e['tag']!).toSet().toList();
    uniqueTags.sort();
    return ['All', ...uniqueTags];
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filtered = allResources.where((resource) {
      final searchText = _searchController.text.toLowerCase();
      final titleMatch = resource['title']!.toLowerCase().contains(searchText);
      final tagMatch = selectedTag == 'All' || resource['tag'] == selectedTag;
      return titleMatch && tagMatch;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("EduLift Resource Feed"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search resources...',
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 12),

            // 🔽 Filter Dropdown
            DropdownButtonFormField<String>(
              value: selectedTag,
              onChanged: (value) {
                setState(() {
                  selectedTag = value!;
                });
              },
              dropdownColor: Colors.grey[900],
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Filter by Tag",
                filled: true,
                fillColor: Colors.grey[850],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items: tags.map((tag) {
                return DropdownMenuItem(
                  value: tag,
                  child: Text(tag),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // 🧾 Filtered Feed
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final upload = filtered[index];
                  return Card(
                    color: Colors.grey[900],
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: const Icon(Icons.folder_open,
                          color: Colors.tealAccent),
                      title: Text(upload['title']!,
                          style: const TextStyle(color: Colors.white)),
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
            ),
          ],
        ),
      ),
    );
  }
}
