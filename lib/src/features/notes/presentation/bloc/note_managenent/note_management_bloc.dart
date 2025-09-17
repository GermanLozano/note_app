// IMPLEMENTACION DEL BLOC PARA LAS NOTAS

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/src/features/notes/domain/use_case/create_note_use_case.dart';
import 'package:note_app/src/features/notes/domain/use_case/delete_note_use_case.dart';
import 'package:note_app/src/features/notes/domain/use_case/get_notes_use_case.dart';
import 'package:note_app/src/features/notes/domain/use_case/update_note_use_case.dart';

part 'note_management_event.dart';
part 'note_management_state.dart';

class NoteManagementBloc
    extends Bloc<NoteManagementEvent, NoteManagementState> {
  // CONSTRUCTOR PARA LOS CASOS DE USO REQUERIDOS Y REGISTRA LOS MANEJADORES DE EVENTOS
  NoteManagementBloc({
    required this.getNotesUseCase,
    required this.createNoteUseCase,
    required this.updateNoteUseCase,
    required this.deleteNoteUseCase,
  }) : super(NoteInitial()) {
    on<LoadNotesRequested>(_onLoadNotesRequested);
    on<CreateNoteRequested>(_onCreateNoteRequested);
    on<UpdateNoteRequested>(_onUpdateNoteRequested);
    on<DeleteNoteRequested>(_onDeleteNoteRequested);
  }

  // DEFINICION DE PROPIEDADES FINALES PARA LOS CASOS DE USO
  final GetNotesUseCase getNotesUseCase;
  final CreateNoteUseCase createNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;

  // AL CARGAR LAS NOTAS SOLICITADAS
  FutureOr<void> _onLoadNotesRequested(
    LoadNotesRequested event,
    Emitter<NoteManagementState> emit,
  ) async {
    // EMITE UN ESTADO DE CARGA
    emit(NoteLoading());

    // SE VALIDA SI EL PROCESO DEL EVENTO ES IGUAL PROCESO EUNUMERADO DE CARGA INICIAL
    if (event.noteLoadProcces == NoteLoadProcces.initLoad) {
      await Future<void>.delayed(const Duration(seconds: 2));
    }

    // EJECURTA EL CASO DE USO DE OBTENER LAS NOTAS
    final result = await getNotesUseCase(
      GetNoteParams(userId: event.userid, query: event.query),
    );

    result.fold(
      // SI FALLA, EMITE EL ESTADO DE FALLO
      (failure) => emit(NoteFailure(failure.message)),

      // SI TIENE EXITO, REGISTRA EL USUARIO Y EMITE EL ESTADO AUTENTICADO
      (notes) => emit(
        NoteLoadSuccess(notes: notes, noteLoadProcces: event.noteLoadProcces),
      ),
    );
  }

  // AL SOLICITAR LA CREACION DE LA NOTA SOLICITADA
  FutureOr<void> _onCreateNoteRequested(
    CreateNoteRequested event,
    Emitter<NoteManagementState> emit,
  ) async {
    // SE EMITE UN ESTADO DE CARGA
    emit(NoteLoading());

    // EJECURTA EL CASO DE USO DE CREAR LAS NOTAS
    final result = await createNoteUseCase(event.noteEntity);

    result.fold(
      // SI FALLA, EMITE EL ESTADO DE FALLO
      (failure) => emit(NoteFailure(failure.message)),

      (_) => add(
        LoadNotesRequested(
          userid: event.noteEntity.userId,
          noteLoadProcces: NoteLoadProcces.create,
        ),
      ),
    );
  }

  // AL SOLICITAR LA ACTUALIZACION DE LA NOTA
  FutureOr<void> _onUpdateNoteRequested(
    UpdateNoteRequested event,
    Emitter<NoteManagementState> emit,
  ) async {
    // SE EMITE UN ESTADO DE CARGA
    emit(NoteLoading());

    // EJECURTA EL CASO DE USO DE ACTUALIZAR LAS NOTAS
    final result = await updateNoteUseCase(event.noteEntity);

    result.fold(
      // SI FALLA, EMITE EL ESTADO DE FALLO
      (failure) => emit(NoteFailure(failure.message)),

      (_) => add(
        LoadNotesRequested(
          userid: event.noteEntity.userId,
          noteLoadProcces: NoteLoadProcces.update,
        ),
      ),
    );
  }

  // AL SOLICITAR LA ELIMINACION DE LA NOTA
  FutureOr<void> _onDeleteNoteRequested(
    DeleteNoteRequested event,
    Emitter<NoteManagementState> emit,
  ) async {
    // SE EMITE UN ESTADO DE CARGA
    emit(NoteLoading());

    // EJECURTA EL CASO DE USO DE ELIMINAR LAS NOTAS
    final result = await deleteNoteUseCase(event.id);

    result.fold(
      // SI FALLA, EMITE EL ESTADO DE FALLO
      (failure) => emit(NoteFailure(failure.message)),

       (_) => add(
        LoadNotesRequested(
          userid: event.userId,
          noteLoadProcces: NoteLoadProcces.delete,
        ),
      ),
    );
  }
}
