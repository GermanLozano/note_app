// CONSTRUCCION DEL BOTON DE ACCION FLOTANTE COMO COMPONENTE

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/features/global/presentation/widgets/custom_floating_action_button_widget.dart';
import 'package:note_app/src/features/notes/domain/entities/note_entity.dart';
import 'package:note_app/src/features/notes/presentation/bloc/note_managenent/note_management_bloc.dart';
import 'package:note_app/src/features/notes/presentation/screen/note/widgets/show_note_dialog.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/presentation/bloc/bloc.dart';

class NoteFloatingActionButtonComponent extends StatelessWidget {
  const NoteFloatingActionButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserManagementBloc, UserManagementState, UserEntity?>(
      selector: (state) {
        if (state is UserAuthenticated) {
          return state.userEntity;
        }
        return null;
      },
      builder: (context, state) {
        return CustomFloatingActionButtonWidget(
          icon: Icon(
            Icons.add,
            color: AppColor.white,
          ),

          // ACCION A RALIZAR UNA VES SE PRECIONE EL BOTON
          onPressed: () async {
            await showNoteDialog(
              context: context,
              onSubmi: (title, content) {
                context.read<NoteManagementBloc>().add(
                  CreateNoteRequested(
                    noteEntity: NoteEntity(
                      title: title, 
                      content: content, 
                      userId: state!.id!, 
                    )
                  )
                );
              },
            );
          },
        );
      },
    );
  }
}
