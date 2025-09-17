
// DEFINICION DE LOS POSIBLES ERRORES DE LA APLICACION

// CONTRATO GENERAL DE LOS ERRORES
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);
  
  final String message;


  @override
  List<Object?> get props => [message];
} 

// FALLO DE RUTA  
class RouteFailure extends Failure {
  const RouteFailure(super.message);
}

// FALLO DE RED
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

// FALLO DE SERVIDOR
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

// FALLO DE BASE DE DATOS LOCAL
class LocalFailure extends Failure {
  const LocalFailure(super.message);
}

// FALLO DE CACHE 
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

// FALLO DESCONOCIDO
class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

// FALLO DE VALIDACION
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

// FALLO NO AUTORIZADO
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.message);
}

// FALLO NO ENCONTRADO
class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}
