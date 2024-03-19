import 'package:book_extchange/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("have an account ? "),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            '  Login',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
