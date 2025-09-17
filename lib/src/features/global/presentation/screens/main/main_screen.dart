// IMPLEMENTACION DE LA PANTALLA MAIN PRINCIPAL DONDE SE CREARAN Y  VERAN LAS NOTAS
//Y SE PODRA NAVEGAR AL PERFIL Y CERRAR SESION

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/core/utils/custom_scaffold_messenger.dart';
import 'package:note_app/src/features/global/presentation/screens/main/components/main_body_component.dart';
import 'package:note_app/src/features/global/presentation/screens/main/components/main_botton_navigation_bar_component.dart';
import 'package:note_app/src/features/notes/presentation/bloc/note_managenent/note_management_bloc.dart';
import 'package:note_app/src/features/user/presentation/bloc/bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _hasLoadedNote = false;

  // CAMBIAR DE DEPENDENCIAS
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final userState = context.read<UserManagementBloc>().state;

    if (!_hasLoadedNote && userState is UserAuthenticated) {
      context.read<NoteManagementBloc>().add(
        LoadNotesRequested(
          userid: userState.userEntity.id!,
          noteLoadProcces: NoteLoadProcces.initLoad,
        ),
      );
      _hasLoadedNote = true;
    }
  }

  void _onTabSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // BLOCLISTENER PARA EL USUARIO
        BlocListener<UserManagementBloc, UserManagementState>(
          listener: (context, state) {
            // SI EL ESTADP DEL USUARIO NO ES AUTENTICADO
            if (state is UserUnauthenticated) {
              context.go('/login');
              customScaffoldMessenger(
                context,
                message: 'Sesion cerrada satisfactoriamente',
                color: AppColor.success,
              );
            }

            // SI EL ESTADO DEL USUARIO SI ES AUTENTICADO
            if (state is UserAuthenticated && !_hasLoadedNote) {
              context.read<NoteManagementBloc>().add(
                LoadNotesRequested(
                  userid: state.userEntity.id!,
                  noteLoadProcces: NoteLoadProcces.initLoad,
                ),
              );
              _hasLoadedNote = true;
            }
          },
        ),

        // BLOCLISTENER PARA LAS NOTAS
        BlocListener<NoteManagementBloc, NoteManagementState>(
          listener: (context, state) {
            // VALIDAR SI EL ESTADO ES, NOTAS CARGADAS EXITOSAMENTE
            if (state is NoteLoadSuccess) {
              var message = '';

              // SWITCH PARA EL ESTADP DE CADA PROCESO
              switch (state.noteLoadProcces) {
                case NoteLoadProcces.create:
                  message = 'Nota guardada exitosamente';

                case NoteLoadProcces.delete:
                  message = 'Nota eliminada exitosamente';

                case NoteLoadProcces.update:
                  message = 'Nota actualizada exitosamente';

                case NoteLoadProcces.initLoad:
                case NoteLoadProcces.search:
              }

              // SE VALIDA SI EL MENSAJE NO ESTA VACIO
              if (message.isNotEmpty) {
                customScaffoldMessenger(
                  context,
                  message: message,
                  color: AppColor.success,
                );
              }
            }
          },
        ),
      ],
      child: Scaffold(
        body: MainBodyComponent(currentIndex: _selectedIndex),
        bottomNavigationBar: MainBottonNavigationBarComponent(
          currentIndex: _selectedIndex,
          onItemTapped: _onTabSelected,
        ),
      ),
    );
  }
}
