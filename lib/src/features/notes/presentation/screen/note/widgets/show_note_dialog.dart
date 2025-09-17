// IMPLEMEMTACION DE LA FUNCION DE NIVEL GENERAL PARA MOSTRAR UN ALERT DIALOG
// PERSONALIZADO CON CAMPOS DE TEXTO PERSONALIZADOS PARA CREAR O EDITAR LAS NOTAS

import 'package:flutter/material.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/features/global/presentation/widgets/custom_elevation_button_widget.dart';
import 'package:note_app/src/features/global/presentation/widgets/custom_text_field_widget.dart';

Future<void> showNoteDialog({
  required BuildContext context,
  required void Function(String title, String content) onSubmi,
  String initialTitle = '',
  String initialContent = '',
}) async {

  // PARAMETROS REQUERIDOS
  final titleController = TextEditingController(text: initialTitle);
  final contenController = TextEditingController(text: initialContent);

  await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      backgroundColor: AppColor.background,
      title: Text(
        initialTitle.isEmpty ? 'Nueva Nota' : 'Editar Nota',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            
            // CAMPO PARA EL TITULO
            CustomTextFielWidget(
              controller: titleController,
              enableBorderColor: AppColor.greyMedium.withValues(alpha: 0.6),
              labelText: 'Titulo',
              hintText: 'Ingresa el titulo de la nota',
              borderColor: AppColor.greyMedium.withValues(alpha: 0.6),
            ),

            // CAMPO PARA EL CONTENIDO
            CustomTextFielWidget(
              controller: contenController,
              enableBorderColor: AppColor.greyMedium.withValues(alpha: 0.6),
              labelText: 'Contenido',
              hintText: 'Ingresa el contenido de la nota',
              borderColor: AppColor.greyMedium.withValues(alpha: 0.6),
              maxLine: 5,
            ),
          ],
        ),
      ),
      actions: [

        // FILA PARA LOS BOTONES DE CANCELAR Y GUARDAR
        Row(
          children: [
            Expanded(

              // BOTON CANCELAR
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
            ),
            Expanded(

              // BOTON GUARDAR
              child: CustomElevationButtonWidget(
                text: 'Guardar',
                leadingIcon: Icon(
                  Icons.save,
                  color: AppColor.white,
                ),
                onPressed: () {
                  final title = titleController.text.trim();
                  final content = contenController.text.trim();

                  // SI EL TITULO NI EL CONTENIDO ES VACION, ENTONCES
                  if (title.isNotEmpty && content.isNotEmpty) {
                    onSubmi(title, content);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
