
// CONSTRUCCION DEL COMPONENTE PARA LA BARRA DE BUSQUEDA DE LAS NOTAS

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/core/utils/debouce.dart';
import 'package:note_app/src/features/notes/presentation/bloc/note_managenent/note_management_bloc.dart';
import 'package:note_app/src/features/user/presentation/bloc/bloc.dart';

class NoteSearchAppBarComponent extends StatefulWidget {
  const NoteSearchAppBarComponent({super.key});

  @override
  State<NoteSearchAppBarComponent> createState() =>
      _NoteSearchAppBarComponentState();
}

class _NoteSearchAppBarComponentState extends State<NoteSearchAppBarComponent> {
  // TIEMPO DE ESPERA ENTRE PETICIONES EN LA BARRA DE BUSQUEDA
  final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    final userManagementBloc = context.read<UserManagementBloc>().state;

    return TextField(
      decoration: InputDecoration(
        hintText: 'Buscar Notas...',
        hintStyle: TextStyle(color: AppColor.white),
        filled: true,
        fillColor: AppColor.white.withValues(alpha: 0.2),
        prefixIcon: Icon(Icons.search, color: AppColor.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: AppColor.white),
      onChanged: (value) {
        if (userManagementBloc is UserAuthenticated) {
          debounce.run(
            () => context.read<NoteManagementBloc>().add(
              LoadNotesRequested(
                userid: userManagementBloc.userEntity.id!,
                query: value,
                noteLoadProcces: NoteLoadProcces.search,
              ),
            ),
          );
        }
      },
    );
  }
}
