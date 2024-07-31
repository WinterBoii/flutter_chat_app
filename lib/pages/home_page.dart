import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/my_appbar.dart';
import 'package:flutter_chat_app/services/auth/auth_service.dart';
import 'package:flutter_chat_app/services/chat/chat_service.dart';

import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // logout
  void logout() async {
    // Implement logout logic here
    final auth = AuthService();

    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Home'),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text('Error');
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // display all users except current user
    if (_authService.getCurrentUser()!.email != userData['email']) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: UserTile(
          email: userData['email'],
          onTap: () {
            // tapped on user -> go to chat page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatPage(receiverID: userData['uid'], receiverEmail: userData['email']),
              ),
            );
          },
        ),
      );
    }
    return Container();
  }
}
