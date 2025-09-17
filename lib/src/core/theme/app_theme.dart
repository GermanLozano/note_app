// DEFINICION DEL TEMA DE LA APLICACION

import 'package:flutter/material.dart';
import 'package:note_app/src/core/theme/app_color.dart';

class AppTheme {
  AppTheme();

  ThemeData getTheme() => ThemeData(
    scaffoldBackgroundColor: AppColor.background,
    useMaterial3: true,
    highlightColor: Colors.transparent
  );
  
}
