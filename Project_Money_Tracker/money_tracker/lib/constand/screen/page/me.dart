import 'package:flutter/material.dart';

class Me extends StatelessWidget {
  const Me({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.person,
                  size: 150,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('User Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person,
                          ),
                          title: Text('Profile detail'),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.notifications,
                          ),
                          title: Text('Notification'),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                          ),
                          title: Text('Setting'),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                          ),
                          title: Text('Logout'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
