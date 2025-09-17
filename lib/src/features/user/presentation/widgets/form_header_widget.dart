// CONSTRUCCION DEL WIDGET DE ENCABEZADO DEL FORMULARIO

import 'package:flutter/widgets.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/features/global/presentation/widgets/app_icon_widget.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({required this.textInformation, super.key});

  final String textInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppIconWidget(),
        const SizedBox(height: 16,),
        Text(
          'NoteApp',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryBlue
          ),
        ),
        const SizedBox(height: 8,),
        Text(
          textInformation,
          style: TextStyle(
            color: AppColor.greyMedium,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
