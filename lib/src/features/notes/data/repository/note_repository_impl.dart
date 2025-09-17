
// IMPLEMENTACION DEL CONTRATo DE REPOSITORIO DE DEFINIDO EN EL DOMAIN

import 'package:dartz/dartz.dart';
import 'package:note_app/src/core/error/error.dart';
import 'package:note_app/src/core/error/exceptions.dart';
import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/features/notes/data/data_source/local/local_data_source_interface.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/src/features/notes/domain/respository/note_repository_interface.dart';

class NoteRepositoryImpl implements NoteRepositoryInterface {
  NoteRepositoryImpl({required this.localDataSourceInterface});

  // INTANCIA AL REPOSITORIO LOCAL
  final LocalDataSourceInterface localDataSourceInterface;

  // IMPLEMENTACION DEL METODO PARA CREAR LA NOTA
  @override
  FutureEither<bool> createNote({required NoteEntity noteEntity}) async {
    try {
      final result = await localDataSourceInterface.createNote(
        noteEntity: noteEntity,
      );
      return Right(result);
    } on LocalException catch (error) {
      return Left(LocalFailure(error.message));
    }
  }

  // IMPLEMENTACION DEL METODO PARA CREAR LA NOTA
  @override
  FutureEither<bool> deleteNote({required int noteId}) async {
    try {
      final result = await localDataSourceInterface.deleteNote(noteId: noteId);
      return Right(result);
    } on LocalException catch (error) {
      return Left(LocalFailure(error.message));
    }
  }

  @override
  FutureEither<List<NoteEntity>> getNotes({
    required int userId,
    String? query,
  }) async {
    try {
      final notes = await localDataSourceInterface.getNotes(
        userId: userId,
        query: query,
      );
      return Right(notes);
    } on LocalException catch (error) {
      return Left(LocalFailure(error.message));
    }
  }

  @override
  FutureEither<bool> udpateNote({required NoteEntity noteEntity}) async {
    try {
      final result = await localDataSourceInterface.udpateNote(
        noteEntity: noteEntity,
      );
      return Right(result);
    } on LocalException catch (error) {
      return Left(LocalFailure(error.message));
    }
  }
}
