// CONSTRUCCION DEL COMPONENTE DE CAMPOS PARA EL REGISTRO

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

class RegisterFormFieldComponent extends StatefulWidget {
  const RegisterFormFieldComponent({super.key});

  @override
  State<RegisterFormFieldComponent> createState() =>
      _RegisterFormFieldComponentState();
}

class _RegisterFormFieldComponentState extends State<RegisterFormFieldComponent>
    with Validator {
  // CONTROLADORES PARA ADMINISTRAR  EL TEXTO
  late TextEditingController emailController;
  late TextEditingController passwordControlle;
  final GlobalKey globalKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  bool visiblePassword = false;

  // INICIALIZAR ESTADO
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: '');
    passwordControlle = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserManagementBloc, UserManagementState>(
      listener: (context, state) {
        // VALIDAMOS SI EL ESTADO ES "Error en el registro del usuario"
        if (state is UserRegistrationFailure) {
          customScaffoldMessenger(
            context,
            message: state.message,
            color: AppColor.background,
          );

          // VALIDAR SI EL ESTADO DEL USUARIO NO ESTA AUTENTICADO
        } else if (state is UserUnauthenticated) {
          customScaffoldMessenger(
            context,
            message: 'Usuario registrado correctamente',
            color: AppColor.success,
          );
          context.go('/login');
        }
      },
      builder: (context, state) {
        final isLoading = state is UserLoading;
        return Form(
          key: globalKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            children: [

              // CAMPO DE INGRESO DE EMAIL
              CustomTextFielWidget(
                controller: emailController,
                hintText: 'bex@email.com',
                labelText: 'Email',
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // CAMPO DE INGRESO DEL PASSWORD
              CustomTextFielWidget(
                controller: passwordControlle,
                hintText: '***********',
                labelText: 'Password',
                validator: validatePassword,
                obscureText: !visiblePassword,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // CAMPO DE CONFIRMACION DEL PASSWORD
              CustomTextFielWidget(
                hintText: '***********',
                labelText: 'Confirm Password',
                validator: (value) =>
                    validateConfirmPassword(value, passwordControlle.text),
                obscureText: !visiblePassword,
                onFieldSubmitted: (p0) => _submitregisterForm(),
                textInputAction: TextInputAction.next,
              ),

              // CLECK PARA LA OPCION DE VER CONTRASEÑA
              Row(
                children: [
                  Checkbox(
                    value: visiblePassword,
                    onChanged: (value) {
                      // ESTABLECER EL ESTADO
                      setState(() {
                        visiblePassword = !visiblePassword;
                      });
                    },
                  ),
                  Text(
                    'Mostrar Contraseña',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              // BOTTON PARA ENVIAR EL FORMULARIO
              CustomElevationButtonWidget(
                text: 'Registrarse',
                isLoading: isLoading,
                onPressed: _submitregisterForm,
              ),
            ],
          ),
        );
      },
    );
  }

  // METODO PARA ENVIAR EL FORMULARIO
  void _submitregisterForm() {
    if (!(globalKey.currentState! as FormState).validate()) {
      return;
    }

    FocusScope.of(context).unfocus();
      context.read<UserManagementBloc>().add(
        SignUpRequested(
          userEntity: UserEntity(
            email: emailController.text,
            password: passwordControlle.text, 
          )
        )
      );
  }
}
