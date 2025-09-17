// IMPLEMENTACION DE INYECCION DE DEPENDENCIAS

import 'package:get_it/get_it.dart';
import 'package:note_app/src/core/database/operatons.dart';
import 'package:note_app/src/features/notes/presentation/screen/note_dependency_injection.dart';
import 'package:note_app/src/features/user/user_dependency_injection.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlite3/sqlite3.dart';

GetIt di = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    // EXTERNAL
    final directory = await getApplicationDocumentsDirectory();
    final paht = p.join(directory.path, 'notes_app.db');
    final db = sqlite3.open(paht);
    await createTables(db);
    final prefs = await SharedPreferences.getInstance();

    di
      ..registerLazySingleton<Database>(() => db)
      ..registerLazySingleton<SharedPreferences>(() => prefs);

    await UserDependencyInjection.init();
    await NoteDependencyInjection.init();
  }
}
