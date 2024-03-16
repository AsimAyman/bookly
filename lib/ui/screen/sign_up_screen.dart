import 'package:book_extchange/style/measures.dart';
import 'package:book_extchange/ui/widget/email_text_form_field.dart';
import 'package:flutter/material.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: deviceHeight * .08,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Sign Up",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const CircleAvatar(
            maxRadius: 45,
          ),
          Form(
              child: Column(
            children: [
              const EmailTextFormField(),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: borderRadius),
                    labelText: 'Name'),
                keyboardType: TextInputType.name,
              )
            ],
          ))
        ],
      ),
    );
  }
}
