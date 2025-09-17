// IMPLEMENTACION DEL CASO DE USO PARA ACTUALIZAR LAS NOTAS

import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/core/use_cases/use_cases.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/src/features/notes/domain/respository/note_repository_interface.dart';

class UpdateNoteUseCase implements UseCaseInterface<bool, NoteEntity> {
  UpdateNoteUseCase({required this.noteRepositoryInterface});

  final NoteRepositoryInterface noteRepositoryInterface;

  @override
  FutureEither<bool> call(NoteEntity paramsType) async {
    final result = await noteRepositoryInterface.udpateNote(
      noteEntity: paramsType,
    );
    return result;
  }
}
