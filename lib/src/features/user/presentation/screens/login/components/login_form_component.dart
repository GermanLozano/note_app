
// CONSTRUCCION DEL COMPONENTE DEL FORMULARIO PARA EL INICIO DE SESION

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/src/features/user/presentation/screens/login/components/login_form_fields_component.dart';
import 'package:note_app/src/features/user/presentation/widgets/form_header_widget.dart';
import 'package:note_app/src/features/user/presentation/widgets/in_line_action_text_widget.dart';

class LoginFormComponet extends StatelessWidget {
  const LoginFormComponet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        
        // WIDGET DEL ENCABEZADO DEL FORMULARIO
        const FormHeaderWidget(
          textInformation: 'Ingresa las credenciales para a las notas',
        ),
        const SizedBox(height: 24),

        // COOMPONETE DE LOS CAMPOS DEL FORMULARIO PARA INICIO DE SESION
        const LoginFormFieldsComponent(),
        const SizedBox(height: 24),

        // WIDGET DE TEXTO DE ACCION EN LINEA
        InlineActionTextWidget(
          firstText: 'No tiene cuenta?',
          secondtext: 'Registrarse',
          onTap: () => context.push('/register'),
        )
      ],
    );
  }
}
