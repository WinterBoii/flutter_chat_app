import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/my_appbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Settings'),
    );
  }
}
