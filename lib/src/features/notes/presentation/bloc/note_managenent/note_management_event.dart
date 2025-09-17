// DEFINICION DE LOS ESTADOS DE LAS NOTAS

part of 'note_management_bloc.dart';

sealed class NoteManagementEvent extends Equatable {
  const NoteManagementEvent();

  @override
  List<Object?> get props => [];
}

// EVENTO: CARGAR NOTAS SOLICITADAS
class LoadNotesRequested extends NoteManagementEvent {
  const LoadNotesRequested({
    required this.userid,
    required this.noteLoadProcces,
    this.query,
  });

  // PARAMETROS REQUERIDOS
  final int userid;
  final String? query;
  final NoteLoadProcces noteLoadProcces;

  @override
  List<Object?> get props => [userid, query, noteLoadProcces];
}

// EVENTO: CREAR NOTA SOLICITADA
class CreateNoteRequested extends NoteManagementEvent {
  const CreateNoteRequested({required this.noteEntity});

  final NoteEntity noteEntity;

  @override
  List<Object?> get props => [noteEntity];
}

// EVENTO: ACTUALIZACION DE NOTA SOLICITADA
class UpdateNoteRequested extends NoteManagementEvent {
  const UpdateNoteRequested({required this.noteEntity});

  final NoteEntity noteEntity;

  @override
  List<Object?> get props => [noteEntity];
}

// ELENTO: ELIMINAR NOTA SOLICITADA
class DeleteNoteRequested extends NoteManagementEvent {
  const DeleteNoteRequested({required this.id, required this.userId});

  final int id;
  final int userId;

  @override
  List<Object?> get props => [id];
}
