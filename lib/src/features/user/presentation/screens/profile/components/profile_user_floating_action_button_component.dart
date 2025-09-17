
// CONTRUCCION DEL WIDGET DEL BOTON FLOTANTE PARA LA SCREEN DEL PERFIL DE USUARIO

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/features/global/presentation/widgets/custom_floating_action_button_widget.dart';
import 'package:note_app/src/features/user/presentation/bloc/bloc.dart';

class ProfileUserFloatingActionButtonComponent extends StatelessWidget {
  const ProfileUserFloatingActionButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserManagementBloc, UserManagementState, bool>(
      selector: (state) {
        return state is UserLoading;
      },
      builder: (context, state) {
        return CustomFloatingActionButtonWidget(
          icon: state
              ? CircularProgressIndicator.adaptive(
                  backgroundColor: AppColor.white,
                  strokeWidth: 2,
                )
              : Icon(
                Icons.logout,
                color: AppColor.white,
              ),
          onPressed: () async {
            context.read<UserManagementBloc>().add(
              LogOutRequested()
            );
          },
        );
      },
    );
  }
}
