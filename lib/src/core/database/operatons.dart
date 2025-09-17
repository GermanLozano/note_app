//  IMPLEMENTACION DE LAS OPERACIONES DE LA BASE DE DATOS

import 'package:note_app/src/core/database/colums.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:sqlite3/sqlite3.dart';

// TABLA DE USUARIOS
class TableUser {
  // METODO DE CREAR TABLA
  static Future<void> createTable(Database db) async {
    db.execute('''
      CREATE TABLE IF NOT EXISTS 
        ${TableUserColumns.tableName} (
          ${TableUserColumns.userId} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${TableUserColumns.email} TEXT NOT NULL UNIQUE,
          ${TableUserColumns.password} TEXT NOT NULL,
          ${TableUserColumns.token} TEXT 
      )
    ''');
  }

  // METODO PARA AGREGAR USUARIO
  static Future<void> addUser({
    required Database db,
    required UserEntity user,
  }) async {
    db.prepare(
        '''
        INSERT INTO 
        ${TableUserColumns.tableName} (
          ${TableUserColumns.email}, 
          ${TableUserColumns.password}, 
          ${TableUserColumns.token}
        ) VALUES (?, ?, ?);
      
      ''',
      )
      ..execute([user.email, user.password, user.token])
      ..dispose();
  }

  // METODO PARA ACTUALIZAR EL USUARIO
  static Future<void> updateUser({
    required Database db,
    required UserEntity user,
  }) async {
    db.prepare(
        '''
        UPDATE 
          ${TableUserColumns.tableName} 
        SET 
          ${TableUserColumns.email} = ?, 
          ${TableUserColumns.password} = ?, 
          ${TableUserColumns.token} = ?
        WHERE 
          ${TableUserColumns.userId} = ?;
      
      ''',
      )
      ..execute([user.email, user.password, user.token, user.id])
      ..dispose();
  }

  // OBTENER USUARIO POR CORREO ELECTRONICO Y CONTRASEÑA
  static Future<ResultSet> getUserByEmailAndPassword({
    required Database db,
    required String email,
    required String password,
  }) async {
    final stmt = db.prepare(
      '''
        SELECT * FROM 
          ${TableUserColumns.tableName} 
        WHERE 
          ${TableUserColumns.email} = ? 
          AND ${TableUserColumns.password} = ?;
      
      ''',
    );
    final result = stmt.select([email, password]);
    stmt.dispose();
    return result;
  }

  // EL USUARIO EXISTE POR CORREO ELECTRONICO
  static Future<bool> userExistsByEmail({
    required Database db,
    required String email,
  }) async {
    final stmt = db.prepare(
      '''
        SELECT COUNT(*) FROM 
          ${TableUserColumns.tableName} 
        WHERE 
          ${TableUserColumns.email} = ?;
      
      ''',
    );
    final result = stmt.select([email]);
    stmt.dispose();
    return (result.first.values.first! as int) > 0;
  }

  // OBTENER USUARIO POR TOKEN
  static Future<ResultSet> getUserByToken({
    required Database db,
    required String token,
  }) async {
    final stmt = db.prepare(
      '''
        SELECT * FROM 
          ${TableUserColumns.tableName} 
        WHERE 
          ${TableUserColumns.token} = ?;
        LIMIT  1;
      ''',
    );
    final result = stmt.select([token]);
    stmt.dispose();
    return result;
  }
}

// TABLA DE NOTAS
class TableNote {
  // METODO DE CREAR TABLA
  static Future<void> createTable(Database db) async {
    db.execute('''
      CREATE TABLE IF NOT EXISTS 
        ${TableNoteColumns.tableName} (
          ${TableNoteColumns.noteId} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${TableNoteColumns.title} TEXT NOT NULL,
          ${TableNoteColumns.content} TEXT NOT NULL,
          ${TableNoteColumns.createdAt} TEXT NOT NULL,
          ${TableNoteColumns.updatedAt} TEXT NOT NULL,
          ${TableNoteColumns.userId} INTEGER NOT NULL,
          FOREIGN KEY (${TableNoteColumns.userId}) 
          REFERENCES ${TableUserColumns.tableName}(${TableUserColumns.userId}) 
          ON DELETE CASCADE
      )
    ''');
  }

  // METODO PARA INSERTAR NOTAS
  static Future<void> insertNote({
    required Database db,
    required NoteEntity note,
  }) async {
    db.prepare(
        '''
        INSERT INTO 
        ${TableNoteColumns.tableName} (
          ${TableNoteColumns.title}, 
          ${TableNoteColumns.content}, 
          ${TableNoteColumns.createdAt}, 
          ${TableNoteColumns.updatedAt}, 
          ${TableNoteColumns.userId}
        ) VALUES (?, ?, ?, ?, ?);
      
      ''',
      )
      ..execute([
        note.title,
        note.content,
        note.createdAt!.toIso8601String(),
        note.updatedAt!.toIso8601String(),
        note.userId,
      ])
      ..dispose();
  }

  // METODO PARA ACTUALIZAR LA NOTA
  static Future<void> updateNote({
    required Database db,
    required NoteEntity note,
  }) async {
    db.prepare(
        '''
        UPDATE 
          ${TableNoteColumns.tableName} 
        SET 
          ${TableNoteColumns.title} = ?, 
          ${TableNoteColumns.content} = ?, 
          ${TableNoteColumns.updatedAt} = ?
        WHERE 
          ${TableNoteColumns.noteId} = ?;
      
      ''',
      )
      ..execute([
        note.title,
        note.content,
        note.updatedAt?.toIso8601String(),
        note.id,
      ])
      ..dispose();
  }

  // METODO PARA ELIMINAR LA NOTA
  static Future<void> deleteNote({
    required Database db,
    required int noteId,
  }) async {
    db.prepare(
        '''
        DELETE FROM
          ${TableNoteColumns.tableName} 
        WHERE 
          ${TableNoteColumns.noteId} = ?;
        ''',
      )
      ..execute([noteId])
      ..dispose();
  }

  // METODO PARA OBTENER LAS NOTAS
  static Future<ResultSet> getNotes({
    required Database db,
    required int userId,
    String? query,
  }) async {

    final hasQuery = query != null && query.trim().isNotEmpty;
    final String sql;
    final List<Object?> params;

    if (hasQuery) {
      sql = '''
        SELECT * FROM 
          ${TableNoteColumns.tableName} 
        WHERE 
          ${TableNoteColumns.userId} = ? 
          AND (
            ${TableNoteColumns.title} LIKE ? 
            OR ${TableNoteColumns.content} LIKE ?
          )
        ORDER BY 
          ${TableNoteColumns.updatedAt} DESC;
      ''';
      final likeQuery = '%${query.trim()}%';
      params = [userId, likeQuery, likeQuery];
    } else {
      sql = '''
        SELECT * FROM 
          ${TableNoteColumns.tableName} 
        WHERE 
          ${TableNoteColumns.userId} = ?
        ORDER BY 
          ${TableNoteColumns.updatedAt} DESC;
      ''';
      params = [userId];
    }
    final stmt = db.prepare(sql);
    final result = stmt.select(params);
    stmt.dispose();
    return result;
  }

}


// METODO PARA CREAR LAS TABLAS 
Future<void> createTables(Database database) async {
  await TableUser.createTable(database);
  await TableNote.createTable(database);
}
