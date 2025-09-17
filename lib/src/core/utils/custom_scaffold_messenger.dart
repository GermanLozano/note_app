
// IMPLEMENTACION DEL MENSAJERO DE SCAFFOLD PERSONALIZADO - ERRORES, AVISO, ETC.

import 'package:flutter/material.dart';

void customScaffoldMessenger(
  BuildContext context, {
    required String message,
    required Color color,
  
  }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outlined, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(child: Text(message))
        ],
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      duration: const Duration(seconds: 3),
    ),
  );
}
