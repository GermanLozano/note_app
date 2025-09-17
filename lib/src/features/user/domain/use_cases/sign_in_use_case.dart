
// IMPLEMENTACON DEL CASO DE USO PARA INICIAR SESION

import 'package:note_app/src/core/type_defs/type_defs.dart';
import 'package:note_app/src/core/use_cases/use_cases.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/domain/repository/user_repository_interface.dart';

class SignInUseCase implements UseCaseInterface<UserEntity, UserEntity> {
  SignInUseCase({required this.repositoryInterface});

  final UserRepositoryInterface repositoryInterface;

  @override
  FutureEither<UserEntity> call(UserEntity paramsType) async {
    
    final result = await repositoryInterface.signIn(
      userEntity: paramsType
    );
    
    return result;
  }
}
