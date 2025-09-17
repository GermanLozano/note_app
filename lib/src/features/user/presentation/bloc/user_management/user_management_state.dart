
// DEFINICION DE LOS ESTADOS DEL USUARIO 

part of 'user_management_bloc.dart';

sealed class UserManagementState extends Equatable {
  const UserManagementState();

  @override
  List<Object> get props => [];
}

// ESTADO: INICIO DE SESION DEL USUARIO
final class UserInitial extends UserManagementState {}

// ESTADO: CARGANDO USUARIOS
final class UserLoading extends UserManagementState {}

// ESTADO: USUARIO AUTENTICADO
final class UserAuthenticated extends UserManagementState {
  const UserAuthenticated(this.userEntity);

  final UserEntity userEntity;

  @override
  List<Object> get props => [userEntity];
}

// ESTADO: USUARIO NO AUTENTICADO
final class UserUnauthenticated extends UserManagementState {
  const UserUnauthenticated();
}

// ESTADO: ERROR DEL USUARIO
final class UserFailure extends UserManagementState {
  const UserFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

// ESTADO: ERROR EN EL REGISTRO DE USUARIO
final class UserRegistrationFailure extends UserManagementState {
  const UserRegistrationFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

// ESTADO: ERRO DE INICIO DE SESION DEL USUARIO
final class UserLoginFailure extends UserManagementState {
  const UserLoginFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
