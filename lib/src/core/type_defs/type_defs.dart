
// IMPLEMENTACION DE ALIAS EN LAS DEFINICIONES DE TIPOS

import 'package:dartz/dartz.dart';
import 'package:note_app/src/core/error/error.dart';

typedef EitherOr<T> = Either<Failure, T>;
typedef FutureEither<T> = Future<EitherOr<T>>;
