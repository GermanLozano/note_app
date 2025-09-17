// IMPLEMENTACION PARA LA GENERACION DE TOKENS ALEATORIOS

import 'package:uuid/uuid.dart';

String generateRandomToken({int length = 24} ) {
  const uuid = Uuid();
  return uuid.v4().replaceAll('-', '').substring(0, length);
}
