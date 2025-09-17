// CONSTRUCCION DEL WIDGET DE TEXTO DE ACCION EN LIENA

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:note_app/src/core/theme/app_color.dart';

class InlineActionTextWidget extends StatelessWidget {
  const InlineActionTextWidget({
    super.key,
    this.onTap,
    this.firstText,
    this.secondtext,
  });

  // PARAMETROS REQUERIDOS
  final VoidCallback? onTap;
  final String? firstText;
  final String? secondtext;

  @override
  Widget build(BuildContext context) {
    
    // WIDGET DE TEXTO ENRIQUESIDO 
    return RichText(
      text: TextSpan(
        children: [

          //TEXTO PREGUNTA DE SI TIENE CUENTA
          TextSpan(
            text: firstText,
            style: TextStyle(color: AppColor.greyMedium)
          ),
          const TextSpan(text: ' '),

          // TEXTO DE INVITACION A RGISTRARSE 
          TextSpan(
            text: secondtext,
            style: TextStyle(
              color: AppColor.primaryBlue,
              fontWeight: FontWeight.bold
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ]
      )
    );
  }
}
