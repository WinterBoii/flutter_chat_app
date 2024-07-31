import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/chat_bubble.dart';
import 'package:flutter_chat_app/components/my_appbar.dart';
import 'package:flutter_chat_app/components/my_textfield.dart';
import 'package:flutter_chat_app/services/auth/auth_service.dart';
import 'package:flutter_chat_app/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  // chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // text controller
  final TextEditingController messageController = TextEditingController();

  // local variables
  final hintText = 'Message...';

  // send message
  void sendMessage() async {
    // send if there is something inside the textfield
    if (messageController.text.isNotEmpty) {
      // send the message
      await _chatService.sendMessage(receiverID, messageController.text);

      // clear the text controller
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: receiverEmail,
        isCenter: true,
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(
            flex: 5,
            child: _buildMessageList(),
          ),

          // user input
          _buildUserInput(),
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;

    return StreamBuilder(
      stream: _chatService.getMessages(senderID, receiverID),
      builder: (context, snapshot) {
        // errors
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // return list view
        return ListView(
          padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc, context)).toList(),
        );
      },
    );
  }

  /// Builds a message item widget for a single message in the chat.
  ///
  /// The message item is displayed in the chat list, with the message text
  /// contained within a container. The container's appearance and alignment
  /// is determined by whether the message was sent by the current user or
  /// the receiver.
  ///
  /// [doc] is the Firestore document snapshot containing the message data.
  /// [context] is the BuildContext of the parent widget.
  ///
  /// Returns a [Row] widget containing the message item.
  Widget _buildMessageItem(DocumentSnapshot doc, BuildContext context) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    return ChatBubble(
      text: data['message'],
      isMe: isCurrentUser,
    );
  }

  // build message input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(hintText: hintText, controller: messageController),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                color: Colors.white,
                Icons.send,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
