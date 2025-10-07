import 'package:flutter/material.dart';

/// Clase que proporciona un método estático para crear un [TextTheme] personalizado y consistente
/// para una aplicación Flutter. Permite definir familias de fuentes distintas para títulos y cuerpo de texto,
/// asegurando una tipografía coherente en toda la UI.
///
/// Los estilos generados se basan en las convenciones de Material Design y están pensados para
/// ser asignados a la propiedad `textTheme` de un [ThemeData], que luego se pasa al widget
/// `DixMaterialApp` o `DixMaterialApp.router`.
///
/// Ejemplo de uso:
/// ```dart
/// DixMaterialApp(
///   theme: ThemeData(
///     textTheme: DixTextTheme.createTextTheme(
///       titleFamily: 'Poppins',
///       bodyFamily: 'Roboto',
///     ),
///   ),
///   home: MyHomePage(),
/// );
/// ```
class DixTextTheme {
  /// Crea y retorna un [TextTheme] con estilos predefinidos para la tipografía de la aplicación.
  ///
  /// [titleFamily]: La familia de fuentes a usar para los estilos de títulos (ej: `headline`, `title`).
  /// Por defecto es 'Poppins'.
  /// [bodyFamily]: La familia de fuentes a usar para los estilos de cuerpo de texto (ej: `body`, `label`).
  /// Por defecto es 'Roboto'.
  ///
  /// Retorna un [TextTheme] con tamaños, pesos y espaciados preconfigurados para una jerarquía
  /// visual clara y legible.
  static TextTheme createTextTheme({
    String titleFamily = 'Poppins',
    String bodyFamily = 'Roboto',
  }) =>
      TextTheme(
        headlineLarge: TextStyle(
          fontFamily: titleFamily,
          fontSize: 36,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(fontFamily: titleFamily, fontSize: 34),
        headlineSmall: TextStyle(fontFamily: titleFamily, fontSize: 32),
        titleLarge: TextStyle(
          fontFamily: titleFamily,
          fontSize: 28,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(fontFamily: titleFamily, fontSize: 26),
        titleSmall: TextStyle(fontFamily: titleFamily, fontSize: 24),
        bodyLarge: TextStyle(fontFamily: bodyFamily, fontSize: 20),
        bodyMedium: TextStyle(fontFamily: bodyFamily, fontSize: 18),
        bodySmall: TextStyle(fontFamily: bodyFamily, fontSize: 16),
        labelLarge: TextStyle(fontFamily: bodyFamily, fontSize: 14),
        labelMedium: TextStyle(fontFamily: bodyFamily, fontSize: 12),
        labelSmall: TextStyle(fontFamily: bodyFamily, fontSize: 10),
      );
}
