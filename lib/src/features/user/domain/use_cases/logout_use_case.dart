// IMPLEMENTACION DEL CASO DE USO PARA CERRAR SESION

import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/core/use_cases/use_cases.dart';
import 'package:note_app/src/features/user/domain/repository/user_repository_interface.dart';

class LogOutUseCase implements UseCaseInterface<bool, NoParams> {

  const LogOutUseCase({required this.repositoryInterface});

  final UserRepositoryInterface repositoryInterface;


   @override
  FutureEither<bool> call(NoParams paramsType) async {
    final result = await repositoryInterface.logout();
    return result;
  }
}
