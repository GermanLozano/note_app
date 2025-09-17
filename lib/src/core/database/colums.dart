// IMPLEMENTACIÓN DE LA COLUMNA DE LA BASE DE DATOS


// TABLA DE USUARIOS
class TableUserColumns {
  static const String tableName = 'users';
  static const String userId = 'id';
  static const String email = 'email';
  static const String password = 'password';
  static const String token = 'token';
}

// TABLA DE NOTAS
class TableNoteColumns {
  static const String tableName = 'notes';
  static const String noteId = 'id';
  static const String title = 'title';
  static const String content = 'content';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
  static const String userId = 'userId'; // clave foránea, tabla de usuarios
}
