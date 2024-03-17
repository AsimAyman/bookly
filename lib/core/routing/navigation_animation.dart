import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage(
      {required BuildContext context,
        required GoRouterState state,
        required Widget child,
        required String type}) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case 'fade':
              return FadeTransition(opacity: animation, child: child,);
            case 'rotation':
              return RotationTransition(turns: animation, child: child,);
            case 'size':
              return SizeTransition(sizeFactor: animation, child: child);
            case 'scale':
              return ScaleTransition(scale: animation, child: child,);
            case 'slide':
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child,);
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}