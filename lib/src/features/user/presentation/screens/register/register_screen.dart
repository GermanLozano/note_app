
// IMPLEMENTACION DE LA PANTALLA PRINCIPAL DEL REGISTRO

import 'package:flutter/material.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/features/user/presentation/screens/register/components/register_form_component.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.lightShadow,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const RegisterFormComponent(),
            ),
          ),
        ),
      ),

      // BOTON FLOTANTE ÁRA REGRESAR A INICIO DE SESION 
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context).pop(),
          backgroundColor: AppColor.primaryBlue,
          child: Icon(
            Icons.arrow_back,
            color: AppColor.white,
          ),
        ),
      ),

      // POSICION DEL BONTON DE IR HACIA ATRAS
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }
}
