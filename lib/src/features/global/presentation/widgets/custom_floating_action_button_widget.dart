// CONSTRUCCION DEL WIDGET DEL BOTON DE ACCION PAREA ABRIR EL MODAL
// PARA CREAR LAS NOTAS

import 'package:flutter/material.dart';
import 'package:note_app/src/core/theme/app_color.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  const CustomFloatingActionButtonWidget({
    required this.icon,
    super.key,
    this.onPressed,
  });

  // PARAMETROS REQUERIDOS
  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.gradientStart,
      onPressed: onPressed,
      child: icon,
    );
  }
}
