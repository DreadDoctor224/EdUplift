import 'package:flutter/material.dart';

// *** the details for this are manually put when we run it in the main
//because its not connected to firebase as of yet***
class ResourceViewScreen extends StatelessWidget {
  final String title;
  final String description;
  final String tag;

  const ResourceViewScreen({
    super.key,
    required this.title,
    required this.description,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Resource Details"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.insert_drive_file,
                size: 60, color: Colors.tealAccent),
            const SizedBox(height: 20),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              "📎 $tag",
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),

            const Text("Description",
                style: TextStyle(color: Colors.tealAccent, fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 40),

            // Placeholder for View/Download button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Hook this to actual file view/download logic
                },
                icon: const Icon(Icons.download),
                label: const Text("Download / View"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
