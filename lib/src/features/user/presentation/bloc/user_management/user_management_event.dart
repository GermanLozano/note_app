// DEFINICION DE LOS EVENTOS PARA EL USUARIO

part of 'user_management_bloc.dart';

sealed class UserManagementEvent extends Equatable {}

// EVENTO: SOLICITUD DE INICIO DE SESION
class SignInRequested extends UserManagementEvent {
  SignInRequested({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<Object?> get props => [userEntity];
}


// EVENTO: SOLICITUD DE REGISTRO
class SignUpRequested extends UserManagementEvent {
  SignUpRequested({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<Object?> get props => [userEntity];
}


// EVENTO: OBTENER EL USUARIO ACTUAL SOLICITADO
class GetCurrentUserRequested extends UserManagementEvent {
  GetCurrentUserRequested();

  @override
  List<Object?> get props => [];
}


// EVENTO: SOLICITUD DE CIERRE DE SESION
class LogOutRequested extends UserManagementEvent {
  LogOutRequested();

  @override
  List<Object?> get props => [];
}
