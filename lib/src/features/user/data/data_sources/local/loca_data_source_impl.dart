// IMPLEMENTACION DEL CONTRATO DE ORIGEN DE DATOS LOCAL

import 'package:note_app/src/core/database/operatons.dart';
import 'package:note_app/src/core/error/exceptions.dart';
import 'package:note_app/src/core/utils/generate_random_token.dart' as ut;
import 'package:note_app/src/features/user/data/data_sources/local/loca_data_source_interface.dart';
import 'package:note_app/src/features/user/data/model/user_model.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlite3/sqlite3.dart';

class LocaDataSourceImpl implements LocaDataSourceInterface {
  LocaDataSourceImpl({required this.db, required this.preferences});

  // INSTANCIA A LA BASE DE DATOS SQLITE3
  final Database db;

  // INSTANCIA A LAS BIBLIOTECA DE PEFERENCAS COMPARTIDAS
  final SharedPreferences preferences;

  // MEMTODO PARA OBTENBER EL USUARIO ACTUAL
  @override
  Future<UserModel> getCurrenUser() async {
    try {
      // OBTEBER EL TOKEN ALMACENADO LOCALMENTE
      final storedToken = preferences.getString('token');

      if (storedToken == null || storedToken.isEmpty) {
        throw LocalException(message: 'No token found in local storage');
      }

      // BUSCAR EL USUARIO POR TOKEN EN LA BASE DE DATOS
      final userResultSet = await TableUser.getUserByToken(
        db: db,
        token: storedToken,
      );

      if (userResultSet.isEmpty) {
        throw LocalException(message: 'No user found with the stored token.');
      }

      final userData = userResultSet.first;

      // OBTENEMOS EL USUARIO ACTUAL DESDE EL MAPA 
      final currentUser = UserModel.fromMap(userData);

      return currentUser;
    } on LocalException {
      rethrow;
    }
  }
  

  // METODO PARA CERRAR SESION
  @override
  Future<bool> logOut() async {
    try {

      // ELIMINA EL TOKEN DE LAS PREFERENCIAS COMPARTIDAS 
      await preferences.remove('token');
      return true;
    } catch (error) {
      throw LocalException(message: 'Error during logOut: $error');
    }
  }


  // METODO PARA INICIAL SESION
  @override
  Future<UserModel> signIn({required UserEntity userEntity}) async {
    try {
      // OBTENER EL USUARIO POR CORREO Y CONTRASEÑA
      final userResult = await TableUser.getUserByEmailAndPassword(
        db: db,
        email: userEntity.email,
        password: userEntity.password,
      );

      if (userResult.isEmpty) {
        throw LocalException(message: 'Invalid Email or Password');
      }

      // DATOS DEL USUARIO
      final userData = userResult.first;

      // SE GENERA EL TOKEN ALEATORIO
      final generatedToken = ut.generateRandomToken();

      // SE ACTUALIZA EL MODELO DE USUARIO
      final updatedUserModel = UserModel.fromMap(
        userData,
      ).copyWith(token: generatedToken);

      // SE ACTIALIZA EL USUARIO 
      await TableUser.updateUser(db: db, user: updatedUserModel);
      await preferences.setString('token', generatedToken);

      return updatedUserModel;

    } on LocalException {
      rethrow;
    } catch (error) {
      throw LocalException(message: 'Error during sign In: $error');
    }
  }

  // METODO PARA EL REGISTRO DE USUARIO
  @override
  Future<bool> signUp({required UserEntity userEntity}) async {
    try {

      // CONSULTAR SI EL USUARIO EXISTE 
      final existingUser = await TableUser.userExistsByEmail(
        db: db,
        email: userEntity.email,
      );

      // VALIDAR SI EXISTE
      if (existingUser) {
        throw LocalException(message: 'Email is already register');
      }

      // SI NO EXISTE, INSERTAR EL USUARIO EN LA BASE DE DATOS
      await TableUser.addUser(db: db, user: UserModel.fromEntity(userEntity));

      return true;
    } on LocalException {
      rethrow;
    } catch (error) {
      throw LocalException(message: 'Error during sign In: $error');
    }
  }
}
