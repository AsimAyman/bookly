import 'package:flutter/material.dart';

import '../../style/measures.dart';
import '../widget/email_text_form_field.dart';
import '../widget/password_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: deviceHeight * .1,
          ),
          Image.asset('assets/images/logo.png',
              width: deviceWidth * .3, height: deviceHeight * .1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "LOGIN",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              child: Column(
                children: [
                  const EmailTextFormField(),
                  SizedBox(
                    height: deviceHeight * .02,
                  ),
                  const PasswordTextFormField(),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot your password?'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: deviceHeight * .30,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(deviceWidth * .9, 50),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account yet?"),
                TextButton(
                  onPressed: () {},
                  child:  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
