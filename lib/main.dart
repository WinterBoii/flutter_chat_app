import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/login_or_register.dart';
import 'package:flutter_chat_app/themes/light_mode.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: LoginOrRegister()),
    );
  }
}
