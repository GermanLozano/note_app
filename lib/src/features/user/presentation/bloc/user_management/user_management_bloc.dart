
// IMPLEMENTACION DEL BLOC PARA EL USUARIO 

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_app/src/core/use_cases/use_cases.dart';
import 'package:note_app/src/core/utils/custom_log.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/domain/use_cases/get_current_user_use_case.dart';
import 'package:note_app/src/features/user/domain/use_cases/logout_use_case.dart';
import 'package:note_app/src/features/user/domain/use_cases/sign_in_use_case.dart';
import 'package:note_app/src/features/user/domain/use_cases/sign_up_use_case.dart';

part 'user_management_event.dart';
part 'user_management_state.dart';

class UserManagementBloc
    extends Bloc<UserManagementEvent, UserManagementState> {

  // CONSTRUCTOR PARA LOS CASOS DE USO REQUERIDOS Y REGISTRA LOS MANEJADORES DE EVENTOS
  UserManagementBloc({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.getCurrentUserUseCase,
    required this.logOutUseCase,
  }) : super(UserInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<GetCurrentUserRequested>(_onGetCurrentUserRequested);
    on<LogOutRequested>(_onLogOutRequested);
  }


  // DEFINICION DE PROPIEDADES FINALES PARA LOS CASOS DE USO
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final LogOutUseCase logOutUseCase;


  // AL SOLICITAR EL INICIO DE SESION
  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<UserManagementState> emit,
  ) async {

    // EMITE UN ESTADO DE CARGA Y ESPERA 2 SEGUNDOS
    emit(UserLoading());
    await Future<void>.delayed(const Duration(seconds: 2));

    // EJECURTA EL CASO DE USO DE INICIO DE SESION
    final result = await signInUseCase(
      UserEntity(
        email: event.userEntity.email,
        password: event.userEntity.password,
      ),
    );
    result.fold(

      // SI FALLA, EMITE EL ESTADO DE FALLO 
      (failure) => emit(
        UserLoginFailure(
          failure.message,
        ),
      ),

      // SI TIENE EXITO, REGISTRA EL USUARIO Y EMITE EL ESTADO AUTENTICADO
      (susses) {
        customLog(susses.toString());
        emit(
          UserAuthenticated(susses),
        );
      },
    );
  }


  // AL SOLICITAR EL REGISTRO
  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<UserManagementState> emit,
  ) async {

    // EMITE EL ESTADO DE CARGA Y ESPERA 2 SEGUNDOS
    emit(UserLoading());
    await Future<void>.delayed(const Duration(seconds: 2));

    // EJECUTA EL CASO DE USO DEL REGISTRO
    final result = await signUpUseCase(
      UserEntity(
        email: event.userEntity.email,
        password: event.userEntity.password,
      ),
    );

    result.fold(

      // SI FALLA, EMITE EL ESTADO DE ERROR DE REGISTRO
      (failure) => emit(
        UserRegistrationFailure(
          failure.message,
        ),
      ),

      // SI TIENE EXITO, REGISTRA EL USUARIO Y EMITE EL ESTADO NO AUTENTICADO
      (susses) {
        customLog(susses.toString());
        emit(
          const UserUnauthenticated(),
        );
      },
    );
  }


  // AL SOLICITAR EL CIERRE DE SESION
  Future<void> _onLogOutRequested(
    LogOutRequested event,
    Emitter<UserManagementState> emit,
  ) async {

    // EMITE EL ESTADO DE CARGA Y ESPERA 2 SEGUNDOS
    emit(UserLoading());
    await Future<void>.delayed(const Duration(seconds: 2));

    // EJECUTA EL CASO DE USO DE CIERRE DE SESION
    final result = await logOutUseCase(NoParams());

    result.fold(

      // SI FALLA EMITE EL ESTADO DE ERRO 
      (failure) => emit(
        UserFailure(
          failure.message,
        ),
      ),

      // SI TIENE EXITO, EMITE EL ESTADO NO AUTENTICADO
      (susses) {
        customLog(susses.toString());
        emit(
          const UserUnauthenticated(),
        );
      },
    );
  }


  // AL OBTENER EL USUARIO ACTUAL SOLICITADO
  Future<void> _onGetCurrentUserRequested(
    GetCurrentUserRequested event,
    Emitter<UserManagementState> emit,
  ) async {

    // EMITE EL ESTADO DE CARGA 
    emit(UserLoading());

    // EJECUTA EL CASO DE USO DE OBTENER EL USUARIO ACTUAL 
    final result = await getCurrentUserUseCase(NoParams());

    result.fold(

      // SI FALLA, EMITE EL ESTADO DE ERROR 
      (failure) => emit(
        UserFailure(
          failure.message,
        ),
      ),

      // SI TIENE EXITO, EMIT5E EL ESTADO DE AUTENTICADO
      (susses) {
        customLog(susses.toString());
        emit(
           UserAuthenticated(susses),
        );
      },
    );
  }

}
