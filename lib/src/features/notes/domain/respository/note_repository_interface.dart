
// DEFINICION DEL CONTRATO DEL REPOSITORIO DE DOMINIO PARA LAS NOTAS

import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';

abstract class NoteRepositoryInterface {
  // DEFINICION DEL METODO PARA CREAR LA NOTA
  FutureEither<bool> createNote({required NoteEntity noteEntity});

  // DEFINICION DEL METODO ACTUALIZAR LA NOTA
  FutureEither<bool> udpateNote({required NoteEntity noteEntity});

  // DEFINICION DEL METODO PARA ELIMINAR LA NOTA
  FutureEither<bool> deleteNote({required int noteId});

  // DEFINICION DEL METODO PARA OBTENER LAS NOTAS
  FutureEither<List<NoteEntity>> getNotes({
    required int userId,
    String? query,
  });
} 
