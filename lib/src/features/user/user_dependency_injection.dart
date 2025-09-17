// IMPLEMENTACION DE LA INYECCION DE DEPENDENCIAS PARA EL USUARIO

import 'package:note_app/src/core/config/config.dart';
import 'package:note_app/src/features/user/data/data_sources/local/loca_data_source_impl.dart';
import 'package:note_app/src/features/user/data/data_sources/local/loca_data_source_interface.dart';
import 'package:note_app/src/features/user/data/repository/user_repository_impl.dart';
import 'package:note_app/src/features/user/domain/repository/user_repository_interface.dart';
import 'package:note_app/src/features/user/domain/use_cases/get_current_user_use_case.dart';
import 'package:note_app/src/features/user/domain/use_cases/logout_use_case.dart';
import 'package:note_app/src/features/user/domain/use_cases/sign_in_use_case.dart';
import 'package:note_app/src/features/user/domain/use_cases/sign_up_use_case.dart';
import 'package:note_app/src/features/user/presentation/bloc/user_management/user_management_bloc.dart';

class UserDependencyInjection {
  static Future<void> init() async {
    //------------------ BLOC PROVIDER - STATE MANAGEMENT ---------------
    di
      ..registerFactory<UserManagementBloc>(
        () => UserManagementBloc(
          signInUseCase: di(),
          signUpUseCase: di(),
          getCurrentUserUseCase: di(),
          logOutUseCase: di(),
        ),
      )
      //---------------------------- USE CASES ---------------------------
      ..registerLazySingleton<SignInUseCase>(
        () => SignInUseCase(
          repositoryInterface: di(),
        ),
      )
      ..registerLazySingleton<GetCurrentUserUseCase>(
        () => GetCurrentUserUseCase(
          userRepositoryInterface: di(),
        ),
      )
      ..registerLazySingleton<LogOutUseCase>(
        () => LogOutUseCase(
          repositoryInterface: di(),
        ),
      )
      ..registerLazySingleton<SignUpUseCase>(
        () => SignUpUseCase(
          userRepositoryInterface: di(),
        ),
      )
      //---------------------------- REPOSITORIES -------------------------
      ..registerLazySingleton<UserRepositoryInterface>(
        () => UserRepositoryImpl(
          localDataSourceInterface: di(),
        ),
      )
      //--------------------------- DATA SOURCES ---------------------------
      ..registerLazySingleton<LocaDataSourceInterface>(
        () => LocaDataSourceImpl(db: di(), preferences: di()),
      );
  }
}
