part of 'note_management_bloc.dart';

// ENUMERACION DE PROCESO DE CARGA DE NOTAS
enum NoteLoadProcces { create, update, initLoad, delete, search }

sealed class NoteManagementState extends Equatable {
  const NoteManagementState();

  @override
  List<Object> get props => [];
}

// ESTADO: ESTADO INICIAL DE LA NOTA
final class NoteInitial extends NoteManagementState {}

// ESTADO: CARGANDO LA NOTA
final class NoteLoading extends NoteManagementState {}

// ESTADO: NOTA CARGADA CORRECTAMENTE
final class NoteLoadSuccess extends NoteManagementState {
  const NoteLoadSuccess({required this.notes, required this.noteLoadProcces});

  final List<NoteEntity> notes;
  final NoteLoadProcces noteLoadProcces;
  
  @override
  List<Object> get props => [notes];
}

// ESTADO: NOTA FALLÓ
final class NoteFailure extends NoteManagementState {
  const NoteFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
