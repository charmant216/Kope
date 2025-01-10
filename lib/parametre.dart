import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Changer le thème'),
            trailing: Switch(
              value: false,
              onChanged: (value) {
                // Logique pour changer le thème (ajoutez votre gestion ici)
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Logique pour activer/désactiver les notifications
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('À propos'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Programme de Mentora',
                applicationVersion: '1.0.0',
                applicationIcon: Icon(Icons.school, size: 50),
                children: [
                  Text('Application pour le programme de mentorat 2024-2025.'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
