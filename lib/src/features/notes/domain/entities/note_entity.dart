
// IMPLEMENTACION DE LA ENTIDAD DE LA NOTA

import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {

  // CONSTRUCTOR
  const NoteEntity({
    required this.userId,
    required this.title,
    required this.content,
    this.createdAt,
    this.updatedAt,
    this.id,
  });


  // ATRIBUTOS REQUERIDOS
  final int? id;
  final int userId;
  final String title;
  final String content;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  // COMPARACION DE OBJETO MEDIANTE EL PAQUETE EQUATABLE
  @override
  List<Object?> get props {
    return [
      id,
      userId,
      title,
      content,
      createdAt,
      updatedAt,
    ];
  }
}
