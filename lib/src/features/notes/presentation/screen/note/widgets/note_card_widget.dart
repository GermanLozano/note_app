// CONTRUCCION DEL WIDGET TARJETA DE LAS NOTAS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/core/utils/parse_relative_time.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/src/features/notes/presentation/bloc/note_managenent/note_management_bloc.dart';
import 'package:note_app/src/features/notes/presentation/screen/note/widgets/show_note_dialog.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/presentation/bloc/user_management/user_management_bloc.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({required this.noteEntity, super.key});

  // INSTANCIA A LA ENTIDAD DE LAS NOTAS
  final NoteEntity noteEntity;

  @override
  Widget build(BuildContext context) {

    // TARJETA LAS NOTAS
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // FILA PARA EL TITULO DE LA NOTA Y LOS BOTONES DE ACTUALIZAR Y ELIMINAR
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                // TITULO DE LA NOTA
                Text(
                  noteEntity.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocSelector<
                  UserManagementBloc,
                  UserManagementState,
                  UserEntity?
                >(
                  selector: (state) {
                    // SI EL ESTADO ES AUTENTICADO, ENTONCES
                    if (state is UserAuthenticated) {
                      return state.userEntity;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    return Row(
                      children: [

                        // BOTON DE EDITAR
                        IconButton(
                          onPressed: () async {
                            await showNoteDialog(
                              context: context,
                              initialTitle: noteEntity.title,
                              initialContent: noteEntity.content,
                              onSubmi: (title, content) {
                                context.read<NoteManagementBloc>().add(
                                  UpdateNoteRequested(
                                    noteEntity: NoteEntity(
                                      title: title,
                                      content: content,
                                      userId: state!.id!,
                                      id: noteEntity.id,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.edit_rounded),
                        ),

                        // BOTON DE ELIMINAR 
                        IconButton(
                          onPressed: () {
                            context.read<NoteManagementBloc>().add(
                              DeleteNoteRequested(
                                id: noteEntity.id!, 
                                userId: state!.id!
                              )
                            );
                          },
                          icon: const Icon(Icons.delete_outline, size: 25),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 4),

            // CONTENIDO DE LA NOTA 
            Text(noteEntity.content),
            const SizedBox(height: 8),

            // FILA PARA EL ICONO DE CALENDARIO Y TIEMPO
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  formatRelativeTime(noteEntity.updatedAt!),
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
