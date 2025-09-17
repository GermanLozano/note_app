// CONSTRUCCION DEL COMPONENTE PARA EL BODY DE LA SCREEN MAIN

import 'package:flutter/material.dart';
import 'package:note_app/src/features/notes/presentation/screen/note/note_screen.dart';
import 'package:note_app/src/features/user/presentation/screens/profile/profile_screen.dart';

class MainBodyComponent extends StatelessWidget {
  const MainBodyComponent({required this.currentIndex, super.key});

  // INDICE ACTUAL DE LA SCREEN
  final int currentIndex;

  @override
  Widget build(BuildContext context) {

    // LISTA DE SCREEN 
    const page = <Widget>[
      NoteHomeScreen(),
      ProfileScreen(),
    ];

    // RETORNA UNA ANIMACION AL CAMBIAR DE SCREEN
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child, 
        );
      },
      child: KeyedSubtree(
        key: ValueKey<int>(currentIndex),
        child: page[currentIndex],
      ),
    );
  }
}
