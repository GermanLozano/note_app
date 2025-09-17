// CONSTRUCCION DEL BOTON DE NAVEGACION O TAPBAR DE LA SCREEN MAIN

import 'package:flutter/material.dart';
import 'package:note_app/src/core/constants/main_nav_items.dart';
import 'package:note_app/src/core/theme/app_color.dart';

class MainBottonNavigationBarComponent extends StatelessWidget {
  const MainBottonNavigationBarComponent({
    required this.currentIndex,
    required this.onItemTapped,
    super.key,
  });

  // PARAMETROS REQUERIDOS
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      backgroundColor: AppColor.background,

      items: List.generate(
        bottonNavItem.length,
        (index) => _buildNavItem(
          item: bottonNavItem[index]
        ),
      ),
    );
  }

  // METODO PATA CONSTRUIR LOS ELEMENTOS DE NAVEGACION
  BottomNavigationBarItem _buildNavItem({

    // INSTANCIA A LA CLASE 'BottomNavItemModel'
    required BottomNavItemModel item,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(item.icon),
      activeIcon: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColor.gradientEnd.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Icon(
            item.selectedIcon,
            color: AppColor.gradientStart,
            size: 28,
          ),
        ),
      ),
      label: item.label,
    );
  }
}
