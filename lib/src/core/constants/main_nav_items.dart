// CONSTRUCCION DE LOS ELEMENTOS PRINCIPALES DE NAVEGACION

import 'package:flutter/material.dart';

class BottomNavItemModel {
  // CONSTRUCTOR
  const BottomNavItemModel({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  // ATRIBUTOS REQUERIDOS
  final String label;
  final IconData icon;
  final IconData selectedIcon;

}


// ITEMS PRINCIPALES DE NAVEGACION
const bottonNavItem = [
  BottomNavItemModel(
    label: 'Inicio',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
  ),

  BottomNavItemModel(
    label: 'Perfil',
    icon: Icons.person_outlined,
    selectedIcon: Icons.person,
  ),
];
