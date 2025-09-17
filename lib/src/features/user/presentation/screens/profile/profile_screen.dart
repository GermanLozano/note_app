
// CONTRUCCION DE LA SCREEN PRINCIPAL DEL PERFIL DE USUARIO 

import 'package:flutter/material.dart';
import 'package:note_app/src/features/user/presentation/screens/profile/components/profile_user_app_bar_component.dart';
import 'package:note_app/src/features/user/presentation/screens/profile/components/profile_user_body_component.dart';
import 'package:note_app/src/features/user/presentation/screens/profile/components/profile_user_floating_action_button_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // SE MANDA A LLAMAR AL COMPONENTE APPBAR
      appBar: ProfileUserAppBarComponent(),

      // SE MANDA A LLAMAR AL COMPONENTE BODY
      body: ProfileUserBodyComponent(),

      // SE MANDA A LLAMAR AL COMPONENTE DEL BOTON FLOTANTE 
      floatingActionButton: ProfileUserFloatingActionButtonComponent(),
    );
  }
}
