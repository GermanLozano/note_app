
// DEFINOICION DE LOS COLORES DE LA APP 

import 'package:flutter/material.dart';

class AppColor{
    static Color black = const Color(0xFF000000);
    static Color white = const Color(0xFFFFFFFF);
    static Color trasparent = const Color(0x00000000);

    // FONDO GENRAL DE LA PANTALLA 
    static Color background = const Color(0xFFEDF2FC);

    // AZUL PRINCIPAL USADO EN EL LOGO Y TEXTOS IMPORTANTES, (NoteApp)
    static Color primaryBlue = const Color(0xFF3B49DF);

    // GRADIENTE DEL BOTON DE INICIO DE SESION (DEGRADADO AZUL A VIOLETA)
    
    // INICIO DEL GRADIENTE
    static Color gradientStart = const Color(0xFF3063F0);    

    // FINAL DEL GRADIENTE
    static Color gradientEnd = const Color(0xFF5C2EDF);


    // TEXTOS SECUNDARIOS, EJEMPLO: "Ingresa tus credenciales"

    // TRES TONALIDADES DE GRIS PARA LOS TEXTOS SECUNDARIOS
    static Color greyLight = const Color.fromARGB(255, 213, 216, 219);
    static Color greyMedium = const Color.fromARGB(255, 117, 123, 133);
    static Color greyDark = const Color(0xFF374151);


    // COLOR PARA BORDES Y ELEMENTOS NEUTRALES, SI SE REQUIEREN 

    // COLOR PARA SOMBRAS UTILES
    static Color lightShadow = const Color.fromRGBO(0, 0, 0, 0.05);


    // COLORES PARA CASOS DE EXITO Y FRACASO QUE COMBINEN CON EL DISEÑO GENERLA

    // VERDE PARA EXITO 
    static Color success = const Color.fromARGB(255, 57, 197, 70);
    
    // ROJO PARA ERRORES
    static Color error = const Color(0xFFDC3545);

}
