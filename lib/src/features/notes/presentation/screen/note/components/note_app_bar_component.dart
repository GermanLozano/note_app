// CONSTRUCCION DEL COMPONENTE APPBAR PARA LA SCREEN DE LAS NOTAS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/features/notes/presentation/screen/note/components/note_search_app_bar_component.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/presentation/bloc/bloc.dart';

class NoteAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const NoteAppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.gradientStart, AppColor.gradientEnd],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mis Notas',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // COMPORTAMIENTO DEL BOTON DE CERRAR SESION
              BlocSelector<UserManagementBloc, UserManagementState, bool>(
                selector: (state) {
                  return state is UserLoading;
                },

                // SI EL ESTADO ES CARGANDO EL USUARIO, MUESTRA UN CIRCULAR PROGRES
                // SINO, MUESTRA EL ICONO DE CERRAR SESION
                builder: (context, state) {
                  return IconButton(
                    icon: state
                        ? CircularProgressIndicator.adaptive(
                            backgroundColor: AppColor.white,
                            strokeWidth: 2,
                          )
                        : Icon(
                            Icons.logout,
                            color: AppColor.white,
                          ),
                    onPressed: () {
                      context.read<UserManagementBloc>().add(LogOutRequested());
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 4),

          //  SI EL ESTADO ES USUARIO AUTENTICADO, MUESTRA UN MENSAJE DE BIENBENIDA
          //  AL USUARIO CON EL QUE INICIO SESION
          BlocSelector<UserManagementBloc, UserManagementState, UserEntity>(
            selector: (state) {
              if (state is UserAuthenticated) {
                return state.userEntity;
              } else {
                return const UserEntity(email: 'Invitado', password: '');
              }
            },
            builder: (context, state) {
              return Text(
                '¡Hola, ${state.email}',
                style: TextStyle(
                  color: AppColor.white.withValues(alpha: 0.8)
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          const NoteSearchAppBarComponent(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(172);
}
