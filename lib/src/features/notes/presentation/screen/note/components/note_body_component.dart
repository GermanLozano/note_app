// COSNTRUCCIOND DEL COMPONENTE PARA EL CUERPO DE LAS NOTAS, Note_Body_Componet

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/src/features/notes/presentation/bloc/note_managenent/note_management_bloc.dart';
import 'package:note_app/src/features/notes/presentation/screen/note/widgets/note_card_widget.dart';

class NoteBodyComponent extends StatelessWidget {
  const NoteBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteManagementBloc, NoteManagementState>(
      builder: (context, state) {
        return switch (state) {
          // ESTADO: UNICIAL
          NoteInitial() => const SizedBox.shrink(),
          // ESTADO: CARGANDO LAS NOTAS
          NoteLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          // ESTADO: NOTAS CARGADAS EXITOSAMENTE
          NoteLoadSuccess(:final notes) => NoteListView(notes: notes),
          // ESTADP: FALLO EN LAS NOTAS
          NoteFailure(:final message) => Center(
            child: Text(message),
          ),
        };
      },
    );
  }
}

// CLASE PARA LA LISTA DE NOTAS
class NoteListView extends StatelessWidget {
  const NoteListView({required this.notes, super.key});

  final List<NoteEntity> notes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

          // FILA SUPERIOR DEL BODY
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // ICONO DE LISTA DE NOTAS
              Row(
                children: [
                  const Icon(Icons.notes, size: 20, color: Colors.black87),
                  const SizedBox(width: 8),
                  Text(
                    '${notes.length} nota${notes.length == 1 ? '' : 's'}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // CONTAINER PARA LEYENDA "Offline"
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9D8FD),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Offline',
                  style: TextStyle(color: Color(0xFF7E49FF)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // CONTENIDO VERTICAL
        Expanded(
          child: notes.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.note_alt_outlined,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'No hay Notas',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NoteCardWidget(noteEntity: notes[index]);
                  },
                ),
        ),
      ],
    );
  }
}
