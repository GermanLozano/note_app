
// IMPLEMENTACION DE LAS POSIBLES EXCEPCIONES DE LA APLICACION

// EXCEPCION DEL LADO DEL SERVIDOR
class ServerException implements Exception {
  ServerException(this.message);  
  final String message;
}

// EXCEPCION DE LA BASE DE DATOS LOCAL
class LocalException implements Exception {
  LocalException({required this.message});
  final String message;
}
