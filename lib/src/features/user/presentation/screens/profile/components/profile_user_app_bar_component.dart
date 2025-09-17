// CONSTRUCCION DEL APP BAR PARA EL PERFIL DE USUARIO

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/presentation/bloc/bloc.dart';

class ProfileUserAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileUserAppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserManagementBloc, UserManagementState, UserEntity>(
      selector: (state) {
        // SI EL USUARIO ESTA AUTENTICADO, ENTONCES
        if (state is UserAuthenticated) {
          return state.userEntity;
        } else {
          return const UserEntity(email: 'Invitado', password: '');
        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.gradientStart, AppColor.gradientEnd],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColor.white,
                  child: Icon(
                    Icons.person,
                    size: 36,
                    color: AppColor.greyMedium,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'NoteApp',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  state.email,
                  style: TextStyle(color: AppColor.greyLight),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(170);
}
