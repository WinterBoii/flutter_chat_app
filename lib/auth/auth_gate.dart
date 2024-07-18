import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/login_or_register.dart';

import '../pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            // User is logged in
            return const HomePage();
          } else if (snapshot.hasError) {
            // Error occurred
            return const Center(
              child: Text('Error occurred'),
            );
          } else {
            // User is NOT logged in
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
