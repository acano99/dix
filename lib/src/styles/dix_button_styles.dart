import 'package:dix/dix.dart';
import 'package:flutter/material.dart';

/// Enumeración que define los tipos de botones soportados por [DixButtonStyles].
/// Cada tipo corresponde a un estilo visual basado en el [ColorScheme] del tema actual:
/// - `primary`: Botón destacado para acciones principales (ej: guardar, enviar).
/// - `secondary`: Botón para acciones secundarias, menos prominentes.
/// - `tertiary`: Botón para acciones alternativas o de baja prioridad.
/// - `error`: Botón para acciones relacionadas con errores o alertas (ej: cancelar, eliminar).
enum DixButtonType { primary, secondary, tertiary, error }

/// Clase que proporciona estilos predefinidos para botones en Flutter, basados en el tema de la aplicación.
/// Los estilos son compatibles con [ElevatedButton] y [OutlinedButton], y se generan según el tipo
/// especificado en [DixButtonType]. Utiliza el patrón Singleton para garantizar una única instancia.
///
/// Los estilos generados pueden usarse directamente o personalizarse con el método `copyWith` de [ButtonStyle].
/// Ejemplo de uso:
/// ```dart
/// ElevatedButton(
///   style: DixButtonStyles.instance.elevatedButton(DixButtonType.primary),
///   onPressed: () {},
///   child: Text('Botón Primario'),
/// )
/// ```
class DixButtonStyles {
  /// Constructor privado para implementar el patrón Singleton.
  DixButtonStyles._();

  /// Instancia única de [DixButtonStyles], accesible globalmente.
  static final DixButtonStyles instance = DixButtonStyles._();

  /// Esquema de colores obtenido del tema actual, usando el contexto de [DixKeys.navigatorKey].
  final colorScheme = Theme.of(
    DixKeys.navigatorKey.currentContext!,
  ).colorScheme;

  /// Color de fondo usado para [ElevatedButton].
  late Color backgroundColor;

  /// Color de texto o íconos usado para [ElevatedButton] y [OutlinedButton].
  late Color foregroundColor;

  /// Color del borde usado para [OutlinedButton].
  late Color borderColor;

  /// Genera un estilo para un [ElevatedButton] basado en el tipo de botón especificado.
  ///
  /// [type]: El tipo de botón ([DixButtonType]) que determina los colores a usar.
  /// Retorna un [ButtonStyle] con colores de fondo y texto adaptados al tema y al estado del botón (ej: habilitado o deshabilitado).
  ButtonStyle elevatedButton(DixButtonType type) {
    _setElevatedColors(type);

    return _buildElevatedStyle(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    );
  }

  /// Genera un estilo para un [OutlinedButton] basado en el tipo de botón especificado.
  ///
  /// [type]: El tipo de botón ([DixButtonType]) que determina los colores del borde y texto.
  /// [customForeground]: Color opcional para sobrescribir el color del texto o íconos.
  /// [radius]: Radio de los bordes del botón (por defecto: 12.0).
  /// Retorna un [ButtonStyle] con un borde y texto adaptados al tema y al estado del botón.
  ButtonStyle outlinedButton(
    DixButtonType type, {
    Color? customForeground,
    double radius = 12.0,
  }) {
    _setOutlinedColors(type);

    return _buildOutlinedStyle(
      borderColor: borderColor,
      foregroundColor: customForeground ?? foregroundColor,
      radius: radius,
    );
  }

  /// Configura los colores para un [ElevatedButton] según el tipo de botón especificado.
  ///
  /// [type]: El tipo de botón ([DixButtonType]) que determina los colores de fondo y texto.
  /// Actualiza las propiedades [backgroundColor] y [foregroundColor] usando el [colorScheme].
  void _setElevatedColors(DixButtonType type) {
    switch (type) {
      case DixButtonType.primary:
        backgroundColor = colorScheme.primaryContainer;
        foregroundColor = colorScheme.onPrimaryContainer;
        break;
      case DixButtonType.secondary:
        backgroundColor = colorScheme.secondaryContainer;
        foregroundColor = colorScheme.onSecondaryContainer;
        break;
      case DixButtonType.tertiary:
        backgroundColor = colorScheme.tertiaryContainer;
        foregroundColor = colorScheme.onTertiaryContainer;
        break;
      case DixButtonType.error:
        backgroundColor = colorScheme.error;
        foregroundColor = colorScheme.onError;
        break;
    }
  }

  /// Configura los colores para un [OutlinedButton] según el tipo de botón especificado.
  ///
  /// [type]: El tipo de botón ([DixButtonType]) que determina los colores del borde y texto.
  /// Actualiza las propiedades [borderColor] y [foregroundColor] usando el [colorScheme].
  void _setOutlinedColors(DixButtonType type) {
    switch (type) {
      case DixButtonType.primary:
        borderColor = colorScheme.primary;
        foregroundColor = colorScheme.primary;
        break;
      case DixButtonType.secondary:
        borderColor = colorScheme.secondary;
        foregroundColor = colorScheme.secondary;
        break;
      case DixButtonType.tertiary:
        borderColor = colorScheme.tertiary;
        foregroundColor = colorScheme.tertiary;
        break;
      case DixButtonType.error:
        borderColor = colorScheme.error;
        foregroundColor = colorScheme.error;
        break;
    }
  }

  /// Construye un estilo para un [ElevatedButton] con los colores especificados.
  ///
  /// [backgroundColor]: Color de fondo del botón.
  /// [foregroundColor]: Color del texto o íconos del botón.
  /// Retorna un [ButtonStyle] que maneja el estado deshabilitado con colores del tema.
  ButtonStyle _buildElevatedStyle({
    required Color backgroundColor,
    required Color foregroundColor,
  }) => ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.withValues(alpha: 0.12);
      }
      return backgroundColor;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.withValues(alpha: 0.38);
      }
      return foregroundColor;
    }),
  );

  /// Construye un estilo para un [OutlinedButton] con los colores y radio especificados.
  ///
  /// [borderColor]: Color del borde del botón.
  /// [foregroundColor]: Color del texto o íconos del botón.
  /// [radius]: Radio de los bordes del botón.
  /// Retorna un [ButtonStyle] con un borde redondeado y manejo del estado deshabilitado.
  ButtonStyle _buildOutlinedStyle({
    required Color borderColor,
    required Color foregroundColor,
    required double radius,
  }) => ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.withValues(alpha: 0.38);
      }
      return foregroundColor;
    }),
  );
}
