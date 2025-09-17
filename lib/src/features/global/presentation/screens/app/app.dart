import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/core/config/config.dart';
import 'package:note_app/src/core/l10n/l10n.dart';
import 'package:note_app/src/core/router/router.dart';
import 'package:note_app/src/core/theme/app_theme.dart';
import 'package:note_app/src/features/notes/presentation/bloc/note_managenent/note_management_bloc.dart';
import 'package:note_app/src/features/user/presentation/bloc/bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di<UserManagementBloc>()..add(GetCurrentUserRequested()),
        ),
        BlocProvider(
          create: (context) => di<NoteManagementBloc>(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Flutter App',
      theme:  AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: instanceGoRouter,
    );
  }
}
