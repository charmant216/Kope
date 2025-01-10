import 'package:flutter/material.dart';
import 'parametre.dart';

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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Les données des groupes et des membres
  final Map<String, List<String>> groups = {
    'Organiser': ['Tacite', 'Amani'],
    'Mentor': ['Georges', 'Bénédict', 'Kevin'],
    'Leaner': ['Charmant', 'Israël', 'Jacques'],
    'Other': ['Sam', 'Hermès', 'Christian', 'Destin', 'Bienv', 'Salufa']
  };
  //initialisation de la première page par defaut
  int _currentIndex = 0;
  List <String> listUser = [];

getAllUser(){
  //cette boucle affiche tous les utilisateurs ce trouvant dans acceuil dans la page all user.
  for (int i = 0; i < groups.length; i++) {
    List<String> value= groups.values.toList()[i];
    print(value);
    for (int j=0; j< value.length;j++){
      print(value[j]);
      listUser.add(value[j]);
    }
  }
}
@override
  void initState() {
   getAllUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    // Liste des widgets pour chaque page
    final List<Widget> _pages = [
      Center(
        child: ListView(
          children: groups.entries.map((entry) {
            return GroupCard(groupName: entry.key, members: entry.value);
          }).toList(),
        ),
      ),
      SingleChildScrollView(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ...List.generate(listUser.length, (index) {
                    return Card(child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(listUser[index]),
                        ),
                      ],
                    ));
                  })
                ],
              ),
            )),
      ),
      Center(child: Text('Paramètres', style: TextStyle(fontSize: 24))),
      Center(child: Text('À propos', style: TextStyle(fontSize: 24))),
    ];
    return Scaffold(

      //bottomNavigationBar
        body: _pages[_currentIndex], // Affiche la page sélectionnée
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xfffdf3cd), //Cette coloration nous permet de changer différantes variétés des couleurs
          elevation: 0,
          currentIndex: _currentIndex,
          // Indique l'onglet sélectionné
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          //Le BottomNavigationBar du bas de l'appli
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'All user',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'À propos',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type:
          BottomNavigationBarType.fixed, // Permet d'ajouter plus de 3 items
        ),
        appBar: AppBar(
          title: Text('Programme de mentora année 2024-2025'),
          backgroundColor: Color(0xb0fdf3cd),
          elevation: 0,
        ));
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
                SnackBar(content: Text('Appel en cour à : $member...')),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
