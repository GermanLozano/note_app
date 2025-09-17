// IMPLEMENTACION DEL CASO DE USO PARA REGISTRAR UN USUARIO

import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/core/use_cases/use_cases.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/domain/repository/user_repository_interface.dart';

class SignUpUseCase implements UseCaseInterface<bool, UserEntity> {
  SignUpUseCase({required this.userRepositoryInterface});

  final UserRepositoryInterface userRepositoryInterface;

  @override
  FutureEither<bool> call(UserEntity paramstype) async {
    final result = await userRepositoryInterface.signUp(userEntity: paramstype);
    return result;
  }
}
