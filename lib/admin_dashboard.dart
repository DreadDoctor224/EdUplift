import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => AdminDashboardState();
}

class AdminDashboardState extends State<AdminDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Admin Panel"),
        backgroundColor: Colors.redAccent,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Users"),
            Tab(text: "Resources"),
            Tab(text: "Approvals"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUsersTab(),
          _buildResourcesTab(),
          _buildApprovalsTab(),
        ],
      ),
    );
  }

  Widget _buildUsersTab() {
    final List<String> mockUsers = ["John", "Sarah", "Mike", "Fatima"];

    return ListView.builder(
      itemCount: mockUsers.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.person, color: Colors.tealAccent),
          title: Text(mockUsers[index],
              style: const TextStyle(color: Colors.white)),
          subtitle: const Text("Role: Learner",
              style: TextStyle(color: Colors.white70)),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () {
              // TODO: Delete user
            },
          ),
        );
      },
    );
  }

  Widget _buildResourcesTab() {
    final List<String> mockResources = [
      "Intro to AI",
      "Design Theory",
      "Financial Basics"
    ];

    return ListView.builder(
      itemCount: mockResources.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading:
              const Icon(Icons.insert_drive_file, color: Colors.amberAccent),
          title: Text(mockResources[index],
              style: const TextStyle(color: Colors.white)),
          subtitle: const Text("Uploaded by: Educator",
              style: TextStyle(color: Colors.white70)),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () {
              // TODO: Delete resource
            },
          ),
        );
      },
    );
  }

  Widget _buildApprovalsTab() {
    final List<String> pendingResources = [
      "Machine Learning Notes",
      "World History Slides"
    ];

    return ListView.builder(
      itemCount: pendingResources.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[850],
          child: ListTile(
            title: Text(pendingResources[index],
                style: const TextStyle(color: Colors.white)),
            subtitle: const Text("Pending approval",
                style: TextStyle(color: Colors.white70)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.check_circle, color: Colors.greenAccent),
                  onPressed: () {
                    // TODO: Approve
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.cancel, color: Colors.redAccent),
                  onPressed: () {
                    // TODO: Reject
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
