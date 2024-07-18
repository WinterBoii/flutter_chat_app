import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // logout
  void logout() async {
    // Implement logout logic here
    final auth = AuthService();

    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () async {
              logout();
            },
          ),
        ],
      ),
    );
  }
}
