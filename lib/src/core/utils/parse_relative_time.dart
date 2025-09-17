// IMPLEMENTACION DEL FORMATO DE TIEMPO RELATIVO

import 'package:timeago/timeago.dart' as timeago;

String formatRelativeTime(DateTime dateTime) {
  timeago.setLocaleMessages('es', timeago.EsMessages());
  return timeago.format(dateTime, locale: 'es');
}
