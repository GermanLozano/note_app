
// IMPLEMENTACION DEL CONTRATRO PARA LOS CASOS DE USO

import 'package:equatable/equatable.dart';
import 'package:note_app/src/core/type_defs/type_defs.dart';


// INTERFAZ PARA LOS CASOS DE USO CON PARAMETROS
abstract interface class UseCaseInterface<ReturnType, ParamsType>{
  FutureEither<ReturnType> call(ParamsType paramsType); 
}

// CLASE PARA CUANDO NO HAY PARAMETROS
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
