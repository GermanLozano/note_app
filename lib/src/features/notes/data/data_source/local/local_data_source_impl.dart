// IMPLEMENTACION DEL CONTRATO DE ORIGEN DE DATOS LOCAL

import 'package:note_app/src/core/database/operatons.dart';
import 'package:note_app/src/core/error/exceptions.dart';
import 'package:note_app/src/features/notes/data/data_source/local/local_data_source_interface.dart';
import 'package:note_app/src/features/notes/data/models/note_model.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';
import 'package:sqlite3/sqlite3.dart';

class LocalDataSourceImpl implements LocalDataSourceInterface {
  LocalDataSourceImpl({required this.db});

  // INSTANCIA A LA BASE DE DATOS SQLITE3
  final Database db;

  // METODO PARA CREAR LA NOTA
  @override
  Future<bool> createNote({required NoteEntity noteEntity}) async {
    try {
      // FECHA Y HORA ACTUAL
      final currendateTime = DateTime.now();

      // SE OBTIENE EL MODELO DESDE LA ENTIDAD
      final noteModel = NoteModel.fromEntity(
        noteEntity,
      ).copyWith(updatedAt: currendateTime, createdAt: currendateTime);

      // SE INSERTA LA NUEVA NOTA
      await TableNote.insertNote(db: db, note: noteModel);
      return true;
    } catch (error) {
      throw LocalException(message: 'Error create note: $error');
    }
  }

  // METODO PARA ACTUALIZAR LA NOTA
  @override
  Future<bool> udpateNote({required NoteEntity noteEntity}) async {
    try {
      // FECHA Y HORA ACTUAL
      final currendateTime = DateTime.now();
      // SE OBTIENE EL MODELO DESDE LA ENTIDAD
      final noteModel = NoteModel.fromEntity(
        noteEntity,
      ).copyWith(updatedAt: currendateTime);

      // SE ACTUALIZA LA NOTA
      await TableNote.updateNote(db: db, note: noteModel);
      return true;
    } catch (error) {
      throw LocalException(message: 'Error updating note: $error');
    }
  }

  // METODO PARA ELIMINAR LA NOTA
  @override
  Future<bool> deleteNote({required int noteId}) async {
    try {
      // SE ELIMINA LA NOTA
      await TableNote.deleteNote(db: db, noteId: noteId);
      return true;
    } catch (error) {
      throw LocalException(message: 'Error deleting note: $error');
    }
  }

  // METODO PARA OBTENER LAS NOTAS
  @override
  Future<List<NoteEntity>> getNotes({
    required int userId,
    String? query,
  }) async {

    try {

      // SE OBTIENEN LAS NOTAS DISPONIBLES
      final notes = await TableNote.getNotes(
        db: db,
        userId: userId,
        query: query ?? '',
      );

      // SE RETORNA LA LISTA DE NOTAS DESDE EL MAPA
      return notes.map(NoteModel.fromMap).toList();
    } catch (error) {
      throw LocalException(message: 'Error fetching notes $error');
    }
  }
}
