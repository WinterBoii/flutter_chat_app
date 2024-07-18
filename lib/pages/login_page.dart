import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/my_button.dart';
import 'package:flutter_chat_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  // email controller
  final TextEditingController _emailController = TextEditingController();

  // password controller
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // login
            Icon(
              Icons.message,
              size: 70,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 50,
            ),

            // welcome back text
            Text(
              'Welcome Back. You are Missed',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // email text field
            MyTextField(
              controller: _emailController,
              hintText: 'Enter Email',
            ),

            const SizedBox(
              height: 10,
            ),

            // password text field
            MyTextField(
              controller: _passwordController,
              hintText: 'Enter Password',
              hide: true,
            ),

            const SizedBox(
              height: 25,
            ),

            // login button
            const MyButton(
              text: 'Login',
            )

            // register now
          ],
        ),
      ),
    );
  }
}
