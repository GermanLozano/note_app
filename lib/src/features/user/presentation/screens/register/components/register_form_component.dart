
// CONTRUCCION DEL COMPONENTE PARA EL REGISTRO 

import 'package:flutter/material.dart';
import 'package:note_app/src/features/user/presentation/screens/register/components/register_form_field_component.dart';
import 'package:note_app/src/features/user/presentation/widgets/form_header_widget.dart';
import 'package:note_app/src/features/user/presentation/widgets/in_line_action_text_widget.dart';

class RegisterFormComponent extends StatelessWidget {
  const RegisterFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FormHeaderWidget(
          textInformation: 'Crea una cuenta para acceder a tus notas'
        ),

        SizedBox(height: 24),

        // COMPONENTE DE CAMPOS DE FORMULARIO DE REGISTRO
        RegisterFormFieldComponent(),

        SizedBox(height: 24),

         // WIDGET DE TEXTO DE ACCION EN LINEA
        InlineActionTextWidget()
      ],
    );
  }
}
