
// DEFINICION DEL CONTRATO DEL REPOSITORIO DE USUARIO

import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';

abstract class UserRepositoryInterface {

  // DEFINICION DEL METODO DE INICIAR SESION
  FutureEither<UserEntity> signIn({required UserEntity userEntity});

  // DEFINICION DEL METODO PARA REGISTRARSE
  FutureEither<bool> signUp({required UserEntity userEntity});

  // DEFINICION DEL METODO PARA OBTENER EL USUARIO ACTUAL
  FutureEither<UserEntity> getCurrentUser();

  // DEFINICION DEL METODO PARA CERRAR SESION
  FutureEither<bool> logout();

} 
