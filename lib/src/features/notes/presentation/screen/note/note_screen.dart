
// CONSTRUCCION DE LA PANTALLA DE INICIO DE LAS NOTAS

import 'package:flutter/material.dart';
import 'package:note_app/src/features/notes/presentation/screen/note/components/note_app_bar_component.dart';
import 'package:note_app/src/features/notes/presentation/screen/note/components/note_body_component.dart';
import 'package:note_app/src/features/notes/presentation/screen/note/components/note_floating_action_button_component.dart';

class NoteHomeScreen extends StatelessWidget {
  const NoteHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      // SE LLAMA AL COMPONENTE NoteAppBarComponent 
      appBar: NoteAppBarComponent(),

      // SE LLAMA AL COMPONENTE NoteBodyComponent
      body: NoteBodyComponent(),

      // SE LLAMA AL COMPONENTE NoteFloatingActionButtonComponent 
      floatingActionButton: NoteFloatingActionButtonComponent(),
    );
  }
}
