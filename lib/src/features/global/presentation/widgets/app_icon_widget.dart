
// CONSTRUCCION DEL WIDGET DEL ICONO DE LA APLICACION


import 'package:flutter/material.dart';
import 'package:note_app/src/core/theme/app_color.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.primaryBlue,
        borderRadius: BorderRadius.circular(20)
      ),
      child: const Icon(Icons.note, color: Colors.white, size: 32,),
    );
  }
}
