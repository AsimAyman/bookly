import 'package:book_extchange/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> customSignupSuccessfulDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Congratulations'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You Created New Account Successfully .'),
              Text('Go to Login Now'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Login'),
            onPressed: () {
              GoRouter.of(context).pop();
              GoRouter.of(context).pop();

            },
          ),
        ],
      );
    },
  );
}