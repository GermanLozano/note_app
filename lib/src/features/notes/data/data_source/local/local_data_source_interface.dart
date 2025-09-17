// DEFINICION DEL CONTRATO DEL REPOSITORIO LOCAL

import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';

abstract class LocalDataSourceInterface {
  
   // DEFINICION DEL METODO PARA CREAR LA NOTA
  Future<bool> createNote({required NoteEntity noteEntity});

  // DEFINICION DEL METODO ACTUALIZAR LA NOTA
  Future<bool> udpateNote({required NoteEntity noteEntity});

  // DEFINICION DEL METODO PARA ELIMINAR LA NOTA
  Future<bool> deleteNote({required int noteId});

  // DEFINICION DEL METODO PARA OBTENER LAS NOTAS
  Future<List<NoteEntity>> getNotes({
    required int userId,
    String? query,
  });
  
}
