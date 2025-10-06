import 'package:flutter/material.dart';

/// Esta clase establece claves globales para poder usar el contexto
/// en cualquier parte de la aplicación.
class DixKeys {
  /// Clave global para acceder al estado del Navigator desde cualquier parte.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Clave global para acceder al ScaffoldMessenger y mostrar mensajes/snackbars.
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
