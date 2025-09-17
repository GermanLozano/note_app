// ignore_for_file: public_member_api_docs, sort_constructors_first
// IMLEMENTACION DEL MODELO DE LAS NOTAS

import 'dart:convert';

import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  const NoteModel({
    required this.userId,
    required this.title,
    required this.content,
    this.id,
    this.createdAt,
    this.updatedAt,
  }) : super(
         id: id,
         userId: userId,
         title: title,
         content: content,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  // MODELO DE LA NOTA DESDE LA ENTIDAD
  factory NoteModel.fromEntity(NoteEntity noteEntity) {
    return NoteModel(
      id: noteEntity.id,
      userId: noteEntity.userId,
      title: noteEntity.title,
      content: noteEntity.content,
      createdAt: noteEntity.createdAt,
      updatedAt: noteEntity.updatedAt,
    );
  }

  // MODELO DE NOTA DESDE EL JSON
  factory NoteModel.formJson(String source) =>
      NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // MODELO DE NOTA DESDE UN MAPA
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] is int
          ? map['id'] as int?
          : map['id'] != null
          ? int.tryParse(map['id'].toString())
          : null,
      userId: map['userId'] as int,
      title: map['title'] as String? ?? '',
      content: map['content'] as String? ?? '',
      createdAt: map['createdAt'] is String
          ? DateTime.parse(map['createdAt'] as String)
          : (map['createdAt'] as DateTime? ?? DateTime.now()),
      updatedAt: map['updatedAt'] is String
          ? DateTime.parse(map['updatedAt'] as String)
          : (map['updatedAt'] as DateTime? ?? DateTime.now()),
    );
  }

  // ATRIBUTOS REQUERIDOS
  final int? id;
  final int userId;
  final String title;
  final String content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  // METODO toString

  @override
  String toString() {
    return 'NoteModel(id: $id, userId: $userId, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  NoteModel copyWith({
    int? id,
    int? userId,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NoteModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
