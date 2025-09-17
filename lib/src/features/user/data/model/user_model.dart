// IMPLEMENTACION DEL MODELO DE USUARIO

import 'dart:convert';

import 'package:note_app/src/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  // CONSTRUCTOR
  const UserModel({
    required this.email,
    required this.password,
    this.id,
    this.token,
  }) : super(id: id, email: email, password: password, token: token);

  //  MODELO DE USARIO DESDE LA ENTIDAD
  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      email: userEntity.email,
      password: userEntity.password,
      token: userEntity.token,
    );
  }

  //  MODELO DE USARIO DESDE EL JSON
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // MODELO DE USUARIO  DESDE UN MAPA
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] is int
          ? map['id'] as int
          : map['id'] != null
          ? int.tryParse(map['id'].toString())
          : null,
      email: map['email'] as String? ?? '',
      password: map['password'] as String? ?? '',
      token: map['token'] as String? ?? '',
    );
  }

  // VARIABLES REQUERIDAS
  final int? id;
  final String email;
  final String password;
  final String? token;

  // MODELO DE USUARIO A MAPA
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  // MODELO DE USUARIO A JSON
  String toJson() => json.encode(toMap());

  // METODO toString
  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, password: $password, token: $token)';
  }

  // METODO COPYWITH
  UserModel copyWith({
    int? id,
    String? email,
    String? password,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }
}
