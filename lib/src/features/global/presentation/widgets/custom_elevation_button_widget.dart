// CONSTRUCCION DEL WIDGET DEL BOTON DE ELEVACION PERSONALIZADO

import 'package:flutter/material.dart';
import 'package:note_app/src/core/theme/app_color.dart';

class CustomElevationButtonWidget extends StatelessWidget {
  const CustomElevationButtonWidget({
    required this.text, 
    this.leadingIcon, 
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.trailingIcon,
  });

  // PARAMETROS REQUERIDOS PARA EL BOTON
  final String text;
  final VoidCallback? onPressed;
  final bool? isLoading;
  final Icon? trailingIcon;
  final Icon? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0)
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.gradientStart,
                AppColor.gradientEnd,
              ],
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leadingIcon ?? const SizedBox.shrink(),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                if(isLoading!)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: 30,
                  height: 30,
                  child: const CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                else
                trailingIcon ?? const SizedBox.shrink() 
              ],
            ),
          ),
        )
      ),
    );
  }
}
