// IMPLEMENTACION DE LA PAGINA DE TRANSICION ENTRE PAGINAS PERSONALIZADAS

// ANIMACIONES DEL TIPO DE ENRUTADOR
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';


// TIPOS DE ANIMACIONES DE ENRUTADOR
enum RouterTypeAnimation {
  slide,
  fade,
  scale,
}

CustomTransitionPage<void> routerAnimation({
  required BuildContext context,
  required Widget page,
  required RouterTypeAnimation typeAnimation,
}) {
  return CustomTransitionPage(
    child: page,
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (typeAnimation) {
        case RouterTypeAnimation.fade:
          return FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          );
        case RouterTypeAnimation.slide:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),  // desde la derecha
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          );
        case RouterTypeAnimation.scale:
          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          );
      }
    },
  );
}
