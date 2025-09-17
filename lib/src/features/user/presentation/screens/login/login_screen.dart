
// CONSTRUCCION DE LA PANTALLA DE INICIO DE SESION 

import 'package:flutter/material.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/features/user/presentation/screens/login/components/login_form_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.lightShadow,
                    blurRadius: 12,
                    offset: const Offset(0, 4 )
                  )
                ]
              ),
              child: const LoginFormComponet(),
            ),
          ),
        )
      ),
    );
  }
}
