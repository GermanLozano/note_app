# APLICACIÓN DE NOTAS - FLUTTER


## Descripción

Esta aplicación móvil ha sido desarrollada como un sistema de gestión de notas personales. Permite a los usuarios crear, editar, buscar y eliminar notas, gestionando la información de manera local mediante SQLite y SharedPreferences. La arquitectura está basada en arquitectura limpia (Clean Arquitecture), el patrón Bloc para el manejo de estados y la inyección de dependencias se realiza con GetIt.


## Tecnologías Utilizadas

- **Framework:** Flutter
- **Lenguaje de Programación:** Dart
- **IDE Utilizado:** Visual Studio Code
- **Gestor de Estado:** Cubit Bloc
- **Base de datos local:** QLite (paquete sqlite3)
- **Almacenamiento local:** SharedPreferences
- **Inyeccion de dependencias:** GetIt


## Características de la Aplicación

- Registro e inicio de sesión de usuarios.
- Creación, edición, búsqueda y eliminación de notas.
- Almacenamiento seguro de datos de usuario y notas en la base de datos local.
- Interfaz de usuario intuitiva y responsiva.
- Manejo de errores y estados mediante Bloc.
- Persistencia de sesión de usuario.
- Arquitectura limpia y modular.


## Requisitos Previos

- Tener Flutter instalado (Instrucciones de Instalación)
- Tener un emulador o dispositivo físico disponible para pruebas.
- Tener instalado un editor de código como Visual Studio Code.


## Requisitos Previos
```
lib
├─ src
│  ├─ core
│  │  ├─ animations
│  │  │  └─ router_animation.dart
│  │  ├─ config
│  │  │  ├─ config.dart
│  │  │  └─ dependency_injection.dart
│  │  ├─ constants
│  │  │  └─ main_nav_items.dart
│  │  ├─ database
│  │  │  ├─ colums.dart
│  │  │  └─ operatons.dart
│  │  ├─ error
│  │  │  ├─ error.dart
│  │  │  └─ exceptions.dart
│  │  ├─ l10n
│  │  │  ├─ arb
│  │  │  │  ├─ app_en.arb
│  │  │  │  ├─ app_es.arb
│  │  │  │  ├─ app_localizations.dart
│  │  │  │  ├─ app_localizations_en.dart
│  │  │  │  └─ app_localizations_es.dart
│  │  │  └─ l10n.dart
│  │  ├─ mixings
│  │  │  └─ validator.dart
│  │  ├─ router
│  │  │  └─ router.dart
│  │  ├─ theme
│  │  │  ├─ app_color.dart
│  │  │  └─ app_theme.dart
│  │  ├─ type_defs
│  │  │  └─ type_defs.dart
│  │  ├─ use_cases
│  │  │  └─ use_cases.dart
│  │  └─ utils
│  │     ├─ custom_log.dart
│  │     ├─ custom_scaffold_messenger.dart
│  │     ├─ debouce.dart
│  │     ├─ generate_random_token.dart
│  │     └─ parse_relative_time.dart
│  └─ features
|     ├─ global
|     |  └─ presentation
|     |     ├─ screens
|     |     |   ├─ app  
|     |     |   |  └─ app.dart
|     |     |   └─ main
|     |     |      ├─ component
|     |     |      |  ├─ main_body_component.dar
|     |     |      |  └─ main_botton_navigator_bar_component.dart
|     |     |      └─ main_scree.dart
|     |     └─ widgets 
|     |        ├─ app_icon_widget.dart
|     |        ├─ custom_elevation_button_widget.dart
|     |        ├─ custom_floatin_action_button_widget.dart
|     |        └─ custom_text_field_widget.dar
│     ├─ notes
│     │  ├─ data
│     │  │  ├─ data_sources
│     │  │  │  └─ local
│     │  │  │     ├─ loca_data_source_impl.dart
│     │  │  │     └─ loca_data_source_interface.dart
│     │  │  ├─ model
│     │  │  │  └─ note_model.dart
│     │  │  └─ repository
│     │  │     └─ note_repository_impl.dart
│     │  ├─ domain
│     │  │  ├─ entities
│     │  │  │  └─ note_entity.dart
│     │  │  ├─ repository
│     │  │  │  └─ note_repository_interface.dart
│     │  │  └─ use_cases
│     │  │     ├─ create_note_use_case.dart
│     │  │     ├─ delete_note_use_case.dart
│     │  │     ├─ get_notes_use_case.dart
│     │  │     └─ update_note_use_case.dart
│     │  └─ presentation
│     │     ├─ bloc
│     │     │  └─ note_management
│     │     │     ├─ note_management_bloc.dart
│     │     │     ├─ note_management_event.dart
│     │     │     └─ note_management_state.dart
│     │     ├─ screens
|     |     |  └─ note
|     |     |     ├─ component
|     |     |     |   ├─ note_app_bar_component.dart
|     |     |     |   ├─ note_body_component.dart
|     |     |     |   ├─ note_floating_action_button_component.dart
|     |     |     |   └─ note_search_app_bar_component.dart
│     │     |     └─ widgets
│     │     |        ├─ note_card_widget.dart
|     |     |        ├─ show_note_dialog.dart
|     |     |        └─ note_screen.dart
|     |     └─ note_dependency_injection.dart
│     └─ user
│        ├─ data
│        │  ├─ data_sources
│        │  │  └─ local
│        │  │     ├─ loca_data_source_impl.dart
│        │  │     └─ loca_data_source_interface.dart
│        │  ├─ model
│        │  │  └─ user_model.dart
│        │  └─ repository
│        │     └─ user_repository_impl.dart
│        ├─ domain
│        │  ├─ entities
│        │  │  └─ user_entity.dart
│        │  ├─ repository
│        │  │  └─ user_repository_interface.dart
│        │  └─ use_cases
│        │     ├─ get_current_user_use_case.dart
│        │     ├─ logout_use_case.dart
│        │     ├─ sign_in_use_case.dart
│        │     └─ sign_up_use_case.dart
│        ├─ presentation
│        │  ├─ bloc
│        │  │  ├─ user_management
│        │  │  |  ├─ user_management_bloc.dart
│        │  │  |  ├─ user_management_event.dart
│        │  │  |  └─ user_management_state.dart
|        |  |  └─ bloc.dart
│        │  ├─ screens
│        │  │  ├─ login
│        │  │  │  ├─ components
│        │  │  │  │  ├─ login_form_component.dart
│        │  │  │  │  └─ login_form_fields_component.dart
│        │  │  │  └─ login_screen.dart
│        │  │  ├─ profile
│        │  │  │  ├─ components
│        │  │  │  │  ├─ profile_user_app_bar_component.dart
│        │  │  │  │  ├─ profile_user_body_component.dart
│        │  │  │  │  └─ profile_user_floating_action_button_component.dart
│        │  │  │  └─ profile_screen.dart
│        │  │  ├─ register
|        |  |  |  ├─ components
│        │  │  │  │  ├─ register_form_component.dart
│        │  │  │  │  ├─ register_form_field_component.dart
│        │  │  │  └─ register_screen.dart
│        │  │  └─ screens.dart
│        │  ├─ widgets
│        │     ├─ form_header_widget.dart
│        │     └─ in_line_action_text_widget.dart
│        └─ user_dependency_injection.dart
├─ bootstrap.dart
├─ main_development.dart
├─ main_production.dart
├─ main_staging.dart
```