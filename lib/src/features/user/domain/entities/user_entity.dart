

// IMLEMENTACION DE LA ENTIDAD USUARIO

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  // CONSTRUCTOR
  const UserEntity({
    required this.password,
    required this.email,
    this.id,
    this.token,
  });

  // ATRIBUTOS DE LA ENTIDAD
  final int? id;
  final String email;
  final String password;
  final String? token;

  @override
  List<Object?> get props => [id, email, password, token];
}
