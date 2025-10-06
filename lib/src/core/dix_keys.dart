import 'package:flutter/material.dart';

/// Clase interna que proporciona claves globales para acceder al contexto de la aplicación
/// desde dentro de la librería. Facilita la gestión de navegación y notificaciones
/// en otras clases del paquete, como [DixButtonStyles] y [DixSnackbar].
///
/// La clave [navigatorKey] debe asignarse al [GoRouter] en la configuración de la
/// aplicación para habilitar la navegación global. Las demás claves son de uso interno.
class DixKeys {
  /// Clave global para acceder al estado del [Navigator], usada externamente con
  /// [GoRouter] para gestionar la navegación en la aplicación.
  ///
  /// Debe asignarse al parámetro `navigatorKey` del [GoRouter] en la configuración
  /// de la aplicación.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Clave global para acceder al estado del [ScaffoldMessenger], usada internamente
  /// por la librería para mostrar notificaciones como SnackBars.
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
