// IMPLEMENYACION DEL CASO DE USO PARA CREAR LAS NOTAS

import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/core/use_cases/use_cases.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/src/features/notes/domain/respository/note_repository_interface.dart';

class CreateNoteUseCase implements UseCaseInterface<bool, NoteEntity> {
  CreateNoteUseCase({required this.noteRepositoryInterface});

  final NoteRepositoryInterface noteRepositoryInterface;

  @override
  FutureEither<bool> call(NoteEntity paramsType) async {
    final result = await noteRepositoryInterface.createNote(
      noteEntity: paramsType,
    );
    return result;
  }
}
