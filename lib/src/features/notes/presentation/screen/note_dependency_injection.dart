// IMPLEMENTACION DELA INYECCION DE DEPENDENCIAS PARA LAS NOTAS

import 'package:note_app/src/core/config/dependency_injection.dart';
import 'package:note_app/src/features/notes/data/data_source/local/local_data_source_impl.dart';
import 'package:note_app/src/features/notes/data/data_source/local/local_data_source_interface.dart';
import 'package:note_app/src/features/notes/data/repository/note_repository_impl.dart';
import 'package:note_app/src/features/notes/domain/respository/note_repository_interface.dart';
import 'package:note_app/src/features/notes/domain/use_case/create_note_use_case.dart';
import 'package:note_app/src/features/notes/domain/use_case/delete_note_use_case.dart';
import 'package:note_app/src/features/notes/domain/use_case/get_notes_use_case.dart';
import 'package:note_app/src/features/notes/domain/use_case/update_note_use_case.dart';
import 'package:note_app/src/features/notes/presentation/bloc/note_managenent/note_management_bloc.dart';

class NoteDependencyInjection {
  static Future<void> init() async {
    //------------------------ BLOC-PROVIDERS STATE MANAGEMENT ---------------
    di
      ..registerFactory<NoteManagementBloc>(
        () => NoteManagementBloc(
          getNotesUseCase: di(),
          createNoteUseCase: di(),
          updateNoteUseCase: di(),
          deleteNoteUseCase: di(),
        ),
      )
      //--------------------------- USE CASES ----------------------------------
      ..registerLazySingleton<CreateNoteUseCase>(
        () => CreateNoteUseCase(noteRepositoryInterface: di()),
      )
      ..registerLazySingleton<DeleteNoteUseCase>(
        () => DeleteNoteUseCase(noteRepositoryInterface: di()),
      )
      ..registerLazySingleton<GetNotesUseCase>(
        () => GetNotesUseCase(noteRepositoryInterface: di()),
      )
      ..registerLazySingleton<UpdateNoteUseCase>(
        () => UpdateNoteUseCase(noteRepositoryInterface: di()),
      )
      //------------------------------ REPOSITORIES ---------------------------
      ..registerLazySingleton<NoteRepositoryInterface>(
        () => NoteRepositoryImpl(
          localDataSourceInterface: di(),
        ),
      )
      //------------------------------- DATA SOURCES ---------------------------
      ..registerLazySingleton<LocalDataSourceInterface>(
        () => LocalDataSourceImpl(db: di()),
      );
  }
}
