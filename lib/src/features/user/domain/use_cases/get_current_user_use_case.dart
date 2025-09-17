// IMPLEMENTACION DEL CASO DE USO PARA OBTENER EL USUARIO ACTUAL

import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/core/use_cases/use_cases.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/domain/repository/user_repository_interface.dart';

class GetCurrentUserUseCase implements UseCaseInterface<UserEntity, NoParams> {
  GetCurrentUserUseCase({required this.userRepositoryInterface});

  final UserRepositoryInterface userRepositoryInterface;

  @override
  FutureEither<UserEntity> call(NoParams paramsType) async {
    final result = await userRepositoryInterface.getCurrentUser();
    return result;
  }
}
