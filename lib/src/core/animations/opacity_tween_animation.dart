// CONSTRUCCION DE ANIMACIONES DE INTERPOLACION DE OPACIDAD

import 'package:flutter/widgets.dart';

class OpacityTweenAnimation extends StatelessWidget {

  // CONSTRUCTOR
  const OpacityTweenAnimation({
    required this.child,
    super.key,
    this.duration = const Duration(milliseconds: 700),
    this.curve = Curves.easeInToLinear,
    this.begin = 0.0,
  });

  // VARIABLES REQUERIDAS
  final Widget child;
  final Duration? duration;
  final Curve? curve;
  final double? begin;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder <double>(
      duration: duration!,
      tween: Tween(
        begin: begin,
        end: 1,
      ),
      curve: curve!,
      builder: (_, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
