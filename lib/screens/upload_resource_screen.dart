import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadResourceScreen extends StatefulWidget {
  const UploadResourceScreen({super.key});

  @override
  State<UploadResourceScreen> createState() => UploadResourceScreenState();
}

class UploadResourceScreenState extends State<UploadResourceScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? selectedTag;
  PlatformFile? selectedFile;

  List<String> tags = [
    'Mathematics',
    'Computer Science',
    'Engineering',
    'Arts',
    'Health',
    'Business',
    'Other',
  ];

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'mp4', 'pptx', 'docx'],
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.first;
      });
    }
  }

  void upload() {
    if (_formKey.currentState!.validate() && selectedFile != null) {
      // TODO: Upload file to Firebase/Server
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Uploading...")),
      );
      // clear after upload
      setState(() {
        titleController.clear();
        descriptionController.clear();
        selectedFile = null;
        selectedTag = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields & select a file")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload a Resource"),
        backgroundColor: Colors.amberAccent,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Help others by sharing educational content 🌍",
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 20),

              // Title
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) =>
                    value!.isEmpty ? "Title is required" : null,
              ),
              const SizedBox(height: 16),

              // Description
              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Description",
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) =>
                    value!.isEmpty ? "Description is required" : null,
              ),
              const SizedBox(height: 16),

              // Tags
              DropdownButtonFormField<String>(
                value: selectedTag,
                onChanged: (value) {
                  setState(() {
                    selectedTag = value;
                  });
                },
                items: tags.map((tag) {
                  return DropdownMenuItem(
                    value: tag,
                    child: Text(tag),
                  );
                }).toList(),
                dropdownColor: Colors.grey[900],
                decoration: const InputDecoration(
                  labelText: "Select Tag",
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) =>
                    value == null ? "Please select a tag" : null,
              ),
              const SizedBox(height: 16),

              // File Picker
              ElevatedButton.icon(
                onPressed: pickFile,
                icon: const Icon(Icons.attach_file),
                label: Text(selectedFile != null
                    ? "Selected: ${selectedFile!.name}"
                    : "Pick a File"),
              ),
              const SizedBox(height: 30),

              // Upload Button
              ElevatedButton.icon(
                onPressed: upload,
                icon: const Icon(Icons.upload),
                label: const Text("Upload"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
