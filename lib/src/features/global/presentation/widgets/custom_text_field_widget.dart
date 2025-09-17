// CONSTRUCCION DEL WIDGET DE CAMPOS DE TEXTO PERSONALIZADOS

import 'package:flutter/material.dart';
import 'package:note_app/src/core/theme/app_color.dart';

class CustomTextFielWidget extends StatelessWidget {
  const CustomTextFielWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.suffixIconOnTap,
    this.validator,
    this.controller,
    this.bottomRight = 8,
    this.bottomLeft = 8,
    this.topRight = 8,
    this.topLeft = 8,
    this.enableBorderColor,
    this.borderColor,
    this.hintColors,
    this.maxLine = 1,
  });

  // VARIABLES Y ATRIBUTOS REQUERIDOS PARA LOS CAMPOS DE TEXTO
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final IconData? suffixIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final VoidCallback? suffixIconOnTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final double? bottomRight;
  final double? bottomLeft;
  final double? topRight;
  final double? topLeft;
  final Color? enableBorderColor;
  final Color? borderColor;
  final Color? hintColors;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    // SE DEFINE EL RADIO DEL BORDE
    final borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(bottomLeft!),
      bottomRight: Radius.circular(bottomRight!),
      topRight: Radius.circular(topRight!),
      topLeft: Radius.circular(topLeft!),
    );

    return TextFormField(
      maxLines: maxLine,
      controller: controller,
      obscureText: obscureText!,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColors),
        suffixIcon: GestureDetector(
          onTap: suffixIconOnTap,
          child: Icon(suffixIcon),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: borderColor ?? AppColor.gradientStart,
          ),
        ),
        floatingLabelStyle: const TextStyle(fontSize: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: enableBorderColor ?? AppColor.greyLight
          ),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      readOnly: readOnly!,
    );

  }
}
