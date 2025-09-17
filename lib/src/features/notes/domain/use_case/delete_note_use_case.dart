// IMPLEMENTACON DEL CASO DE USO PARA ELIMINAR LAS NOTAS

import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/core/use_cases/use_cases.dart';
import 'package:note_app/src/features/notes/domain/respository/note_repository_interface.dart';

class DeleteNoteUseCase implements UseCaseInterface<bool, int> {
  DeleteNoteUseCase({required this.noteRepositoryInterface});

  final NoteRepositoryInterface noteRepositoryInterface;

  @override
  FutureEither<bool> call(int paramsType) async {
    final result = await noteRepositoryInterface.deleteNote(noteId: paramsType);
    return result;
  }
}
