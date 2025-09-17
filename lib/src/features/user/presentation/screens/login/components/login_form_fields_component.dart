// CONSTRUCCION DEL COMPONENTE DEL FORMULARIO DE INICIO DE SESION

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/src/core/mixings/validator.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/core/utils/custom_scaffold_messenger.dart';
import 'package:note_app/src/features/global/presentation/widgets/custom_elevation_button_widget.dart';
import 'package:note_app/src/features/global/presentation/widgets/custom_text_field_widget.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/presentation/bloc/bloc.dart';

class LoginFormFieldsComponent extends StatefulWidget {
  const LoginFormFieldsComponent({super.key});

  @override
  State<LoginFormFieldsComponent> createState() =>
      _LoginFormFieldsComponentState();
}

class _LoginFormFieldsComponentState extends State<LoginFormFieldsComponent>
    with Validator {
      
  // CONTROLADORES PARA ADMINISTRAR  EL TEXTO
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey globalKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  bool visiblePassword = false;

  // INICIALIZAR ESTADO
  @override
  void initState() {
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserManagementBloc, UserManagementState>(
      listener: (context, state) {
        // VALIDAMOS SI EL ESTADO ES "Error de inicio de sesion del usuario"
        if (state is UserLoginFailure) {
          customScaffoldMessenger(
            context,
            message: state.message,
            color: AppColor.error,
          );

          // VALIDAMOS SI EL ESTADO ES "Usuario autenticado"
        } else if (state is UserAuthenticated) {
          context.go('/main');
        }
      },
      builder: (context, state) {
        final isLoading = state is UserLoading;

        return Form(
          key: globalKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            children: [
              // CAMPO DE EMAIL
              CustomTextFielWidget(
                readOnly: isLoading,
                controller: emailController,
                hintText: 'bex@email.com',
                labelText: 'Email',
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(
                height: 16,
              ),

              // CAMPO DEL PASSWORD
              CustomTextFielWidget(
                readOnly: isLoading,
                controller: passwordController,
                hintText: '*********',
                labelText: 'Password',
                obscureText: !visiblePassword,
                suffixIcon: visiblePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                validator: validatePassword,
                suffixIconOnTap: () {
                  setState(() {
                    visiblePassword = !visiblePassword;
                  });
                },
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (p0) => _submitLoginForm(),
              ),
              const SizedBox(height: 24),

              // BOTON DE INICIO DE SESION
              CustomElevationButtonWidget(
                text: 'Iniciar Sesion',
                isLoading: isLoading,
                onPressed: _submitLoginForm,
              ),
            ],
          ),
        );
      },
    );
  }

  // METODO PARA ENVIAR LOS DATOS DE INICIO DE SESION
  void _submitLoginForm() {
    if (!(globalKey.currentState! as FormState).validate()) {
      return;
    }

    FocusScope.of(context).unfocus();
    context.read<UserManagementBloc>().add(
      SignInRequested(
        userEntity: UserEntity(
          email: emailController.text,
          password: passwordController.text, 
        )
      ),
    );
  }
}
