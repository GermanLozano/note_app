// IMPLEMENTACION DEL CONTRATo DE REPOSITORIO DE DEFINIDO EN EL DOMAIN

import 'package:dartz/dartz.dart';
import 'package:note_app/src/core/error/error.dart';
import 'package:note_app/src/core/error/exceptions.dart';
import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/features/user/data/data_sources/local/loca_data_source_interface.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/domain/repository/user_repository_interface.dart';

class UserRepositoryImpl implements UserRepositoryInterface {
  UserRepositoryImpl({required this.localDataSourceInterface});

  // INTANCIA AL REPOSITORIO LOCAL
  final LocaDataSourceInterface localDataSourceInterface;


  // IMPLEMENTACION DEL METODO DE OBTENER EL USUARIO ACTUAL
  @override
  FutureEither<UserEntity> getCurrentUser() async {
    try {
      final resulr = await localDataSourceInterface.getCurrenUser();
      return Right(resulr);
    } on LocalException catch (error) {
      final result = LocalFailure(error.message);
      return Left(result);
    }
  }


  // IMPLEMENTACION DEL METODO PARA CERRAR SESION
  @override
  FutureEither<bool> logout() async {
    try {
      final result = await localDataSourceInterface.logOut();
      return Right(result);
    } on LocalException catch (error) {
      final result = LocalFailure(error.message);
      return Left(result);
    }
  }


  // METODO PARA INICIAR SESION
  @override
  FutureEither<UserEntity> signIn({required UserEntity userEntity}) async {
    try {
      final result = await localDataSourceInterface.signIn(
        userEntity: userEntity,
      );
      return Right(result);
    } on LocalException catch (error) {
      final result = LocalFailure(error.message);
      return left(result);
    }
  }


  // IMPLEMENTACION DEL METOSO DE REGISTRO
  @override
  FutureEither<bool> signUp({required UserEntity userEntity}) async {
    try {
      final result = await localDataSourceInterface.signUp(
        userEntity: userEntity,
      );
      return Right(result);
    } on LocalException catch (error) {
      final result = LocalFailure(error.message);
      return left(result);
    }
  }

}
