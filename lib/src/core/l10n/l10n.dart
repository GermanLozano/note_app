
// IMPLEMENTACION DE LA INTERNACIONALIZACION

import 'package:flutter/widgets.dart';
import 'package:note_app/src/core/l10n/arb/app_localizations.dart';

export 'package:note_app/src/core/l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
