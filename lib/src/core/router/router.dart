
// IMLEMENTACION DE LAS RUTAS DE LA APLICACION MEDIANTE GO ROUTER

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/src/core/animations/router_animation.dart';
import 'package:note_app/src/features/global/presentation/screens/main/main_screen.dart';
import 'package:note_app/src/features/user/presentation/bloc/bloc.dart';
import 'package:note_app/src/features/user/presentation/screens/login/login_screen.dart';
import 'package:note_app/src/features/user/presentation/screens/register/register_screen.dart';

final GoRouter instanceGoRouter = GoRouter(
  initialLocation: '/main',

  // RUTAS DE SCREEN DE LA APLICACION
  routes: [

    // SCREEN PRINCIPAL
    GoRoute(
      path: '/main',
      name: 'main',
      pageBuilder: (context, state) => routerAnimation(
        context: context,
        page: const MainScreen(),
        typeAnimation: RouterTypeAnimation.fade,
      ),
    ),


    // SCREEN DE LOGIN
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) => routerAnimation(
        context: context,
        page: const LoginScreen(),
        typeAnimation: RouterTypeAnimation.fade,
      ),
    ),


    // SCREEN DE REGISTRO
    GoRoute(
      path: '/register',
      name: 'register',
      pageBuilder: (context, state) => routerAnimation(
        context: context,
        page: const RegisterScreen(),
        typeAnimation: RouterTypeAnimation.fade,
      ),
    ),
  ],


  // REDIRECCIONES DE LAS RUTAS
  redirect: (BuildContext context, GoRouterState state) {
    final userState = context.read<UserManagementBloc>();
    final userAuthState = userState.state is UserAuthenticated;


    // RUTAS RELACIONADAS CON EL PROCESO DE AUTENTICACION
    final authRoutes = [
      '/login', 
      '/register'
    ];


    // ASEGURARNOS DE QUE EL SPLASHSCREEN SEA VISIBLE ANTES DE APLICAR LA LOGICA
    if(state.matchedLocation == '/splash') {
      return null;
    }


    // SI NO ESTA AUTENTICADO Y ESTA EN UNA RUTA DE AUNTENTICACION, PERMITIR QUE PASE 
    if(!userAuthState && authRoutes.contains(state.matchedLocation)) {
      return null;
    }


    // SI NO ESTA AUTENTICADO Y ESTA INTENTANDO IR A OTRA PARTE QUE NO SEA EL 
    //FLUJO DE AUTENTICACION, REDIRIGIR AL LOGIN
    if(!userAuthState && !authRoutes.contains(state.matchedLocation)) {
      return '/login';
    }


    // SI EL USUARIO ESTA AUTENTICADO Y ESTA EN UNA RUTA DE AUTENTICACION, REDIRIGIR A HOME 
    if(userAuthState && authRoutes.contains(state.matchedLocation)) {
      return '/main';
    }


    // SIN REDIRECCION ADICIONAL 
    return null;

    
  },
);
