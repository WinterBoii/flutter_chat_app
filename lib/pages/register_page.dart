import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // email, pw controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void register() {
    // TODO: implement onTap
  }

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
              'Lets create an account!',
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
              height: 10,
            ),

            // password text field
            MyTextField(
              controller: _confirmPasswordController,
              hintText: 'Confirm Password',
              hide: true,
            ),

            const SizedBox(
              height: 25,
            ),

            // login button
            MyButton(
              text: 'Register',
              onTap: register,
            ),

            const SizedBox(
              height: 15,
            ),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
