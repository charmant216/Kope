import 'package:flutter/material.dart';

void main() {
  runApp(MentorshipApp());
}

class MentorshipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Les données des groupes et membres
  final Map<String, List<String>> groups = {
    'Organiser': ['Tacite', 'Amani'],
    'Mentor': ['Georges', 'Bénédict', 'Kevin'],
    'Leaner': ['Charmant', 'Israël', 'Jacques'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programme de mentora année 2024-2025'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: groups.entries.map((entry) {
          return GroupCard(groupName: entry.key, members: entry.value);
        }).toList(),
      ),
    );
  }
}

// Widget pour afficher un groupe
class GroupCard extends StatelessWidget {
  final String groupName;
  final List<String> members;

  GroupCard({required this.groupName, required this.members});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 5.0,
      child: ExpansionTile(
        title: Text(
          groupName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        children: members.map((member) {
          return ListTile(
            leading: Icon(Icons.person, color: Colors.purple),
            title: Text(
              member,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Contact téléphonique'),
            trailing: Icon(Icons.phone, color: Colors.green),
            onTap: () {
              // Action pour simuler un appel (ou autre action)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Appel en cour à $member...')),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
