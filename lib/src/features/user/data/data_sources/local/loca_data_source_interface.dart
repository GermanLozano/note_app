// DEFINICION DEL CONTRATO DEL REPOSITORIO LOCAL

import 'package:note_app/src/features/user/data/model/user_model.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';

abstract class LocaDataSourceInterface {

  // METODO PARA INICIAL SESION 
  Future<UserModel> signIn({required UserEntity userEntity});

  // METODO PARA REGISTRASE 
  Future<bool> signUp({required UserEntity userEntity});

  // METODO PARA OBTENER USUARIO ACUAL 
  Future<UserModel> getCurrenUser();

  // METODO PARA CERRAR SESION 
  Future<bool> logOut();
}
