import 'package:flutter/material.dart';

import '../../dix.dart';

/// Enumeración que define los tipos de notificaciones (SnackBars) soportados por [DixSnackbar].
/// Cada tipo corresponde a un estilo visual basado en el [ColorScheme] del tema actual:
/// - `primary`: SnackBar destacado para mensajes principales (ej: confirmaciones).
/// - `secondary`: SnackBar para mensajes secundarios, menos prominentes.
/// - `tertiary`: SnackBar para mensajes alternativos o de baja prioridad.
/// - `error`: SnackBar para mensajes de error o alertas (ej: fallos en operaciones).
enum DixSnackbarType { primary, secondary, tertiary, error }

/// Clase que proporciona una forma simplificada de mostrar notificaciones (SnackBars) en Flutter
/// con estilos predefinidos basados en el tema de la aplicación. Utiliza el patrón Singleton para
/// garantizar una única instancia y permite personalizar los SnackBars mediante parámetros opcionales.
///
/// Los SnackBars se generan según el tipo especificado en [DixSnackbarType] y pueden personalizarse
/// con propiedades como margen, elevación, acción, o forma. La clase depende de [DixKeys.navigatorKey]
/// para acceder al contexto del [ScaffoldMessenger].
///
/// Ejemplo de uso:
/// ```dart
/// DixSnackbar.instance.show(
///   message: 'Operación completada',
///   type: DixSnackbarType.primary,
/// );
///
/// // SnackBar con acción y personalización
/// DixSnackbar.instance.show(
///   message: 'Error al guardar',
///   type: DixSnackbarType.error,
///   action: SnackBarAction(
///     label: 'Reintentar',
///     onPressed: () {},
///   ),
///   showCloseIcon: true,
///   margin: EdgeInsets.all(8.0),
/// );
/// ```
class DixSnackbar {
  /// Constructor privado para implementar el patrón Singleton.
  DixSnackbar._();

  /// Instancia única de [DixSnackbar], accesible globalmente.
  static final DixSnackbar instance = DixSnackbar._();

  /// Duración por defecto para mostrar el SnackBar (4000 milisegundos).
  static const Duration _snackBarDisplayDuration = Duration(milliseconds: 4000);

  /// Esquema de colores obtenido del tema actual, usando el contexto de [DixKeys.navigatorKey].
  final _colorScheme = Theme.of(
    DixKeys.navigatorKey.currentContext!,
  ).colorScheme;

  /// Color de fondo del SnackBar, determinado por el tipo de [DixSnackbarType].
  late Color _backgroundColor;

  /// Color del texto del SnackBar, determinado por el tipo de [DixSnackbarType].
  late Color _foregroundColor;

  /// Muestra un SnackBar personalizado proporcionado por el usuario.
  ///
  /// [snackbar]: El [SnackBar] a mostrar, configurado con las propiedades deseadas.
  /// Utiliza el [ScaffoldMessenger] del contexto de [DixKeys.navigatorKey] para mostrar la notificación.
  void showCustomSnackbar({required SnackBar snackbar}) {
    ScaffoldMessenger.of(
      DixKeys.navigatorKey.currentContext!,
    ).showSnackBar(snackbar);
  }

  /// Muestra un SnackBar con un mensaje y estilo basado en el tipo especificado.
  ///
  /// [message]: El texto a mostrar en el SnackBar.
  /// [type]: El tipo de SnackBar ([DixSnackbarType]), que determina los colores (por defecto: `primary`).
  /// [elevation]: Elevación del SnackBar (opcional).
  /// [margin]: Margen exterior del SnackBar (opcional).
  /// [padding]: Relleno interior del SnackBar (opcional).
  /// [shape]: Forma personalizada del SnackBar (opcional).
  /// [action]: Acción opcional para el SnackBar (ej: botón "Deshacer").
  /// [showCloseIcon]: Indica si se muestra un ícono de cierre (opcional).
  /// [closeIconColor]: Color del ícono de cierre (opcional, usa [foregroundColor] por defecto).
  /// [duration]: Duración del SnackBar (por defecto: 4000 ms).
  /// [behavior]: Comportamiento del SnackBar (ej: flotante o fijo, opcional).
  void show({
    required String message,
    DixSnackbarType type = DixSnackbarType.primary,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    SnackBarAction? action,
    bool? showCloseIcon,
    Color? closeIconColor,
    Duration duration = _snackBarDisplayDuration,
    SnackBarBehavior? behavior,
  }) {
    _buildColors(type);

    showCustomSnackbar(
      snackbar: _buildSnackbar(
        behavior: behavior,
        background: _backgroundColor,
        foreground: _foregroundColor,
        message: message,
        action: action,
        closeIconColor: closeIconColor,
        duration: duration,
        elevation: elevation,
        margin: margin,
        padding: padding,
        shape: shape,
        showCloseIcon: showCloseIcon,
      ),
    );
  }

  /// Construye un [SnackBar] con las propiedades especificadas.
  ///
  /// [background]: Color de fondo del SnackBar.
  /// [foreground]: Color del texto del SnackBar.
  /// [message]: Texto a mostrar en el SnackBar.
  /// [elevation]: Elevación del SnackBar (opcional).
  /// [margin]: Margen exterior del SnackBar (opcional).
  /// [padding]: Relleno interior del SnackBar (opcional).
  /// [shape]: Forma personalizada del SnackBar (opcional).
  /// [action]: Acción opcional para el SnackBar (ej: botón "Deshacer").
  /// [showCloseIcon]: Indica si se muestra un ícono de cierre (opcional).
  /// [closeIconColor]: Color del ícono de cierre (opcional, usa [foreground] por defecto).
  /// [duration]: Duración del SnackBar (por defecto: 4000 ms).
  /// [behavior]: Comportamiento del SnackBar (ej: flotante o fijo, opcional).
  /// Retorna un [SnackBar] configurado con las propiedades proporcionadas.
  SnackBar _buildSnackbar({
    required Color background,
    required Color foreground,
    required String message,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    SnackBarAction? action,
    bool? showCloseIcon,
    Color? closeIconColor,
    Duration duration = _snackBarDisplayDuration,
    SnackBarBehavior? behavior,
  }) => SnackBar(
    behavior: behavior,
    backgroundColor: background,
    closeIconColor: closeIconColor ?? foreground,
    showCloseIcon: showCloseIcon,
    action: action,
    shape: shape,
    duration: duration,
    elevation: elevation,
    margin: margin,
    padding: padding,
    content: Text(message, style: TextStyle(color: foreground)),
  );

  /// Configura los colores del SnackBar según el tipo especificado.
  ///
  /// [type]: El tipo de SnackBar ([DixSnackbarType]) que determina los colores de fondo y texto.
  /// Actualiza las propiedades [_backgroundColor] y [_foregroundColor] usando el [_colorScheme].
  void _buildColors(DixSnackbarType type) {
    switch (type) {
      case DixSnackbarType.primary:
        _backgroundColor = _colorScheme.primary;
        _foregroundColor = _colorScheme.onPrimary;
        break;
      case DixSnackbarType.secondary:
        _backgroundColor = _colorScheme.secondary;
        _foregroundColor = _colorScheme.onSecondary;
        break;
      case DixSnackbarType.tertiary:
        _backgroundColor = _colorScheme.tertiary;
        _foregroundColor = _colorScheme.onTertiary;
        break;
      case DixSnackbarType.error:
        _backgroundColor = _colorScheme.error;
        _foregroundColor = _colorScheme.onError;
        break;
    }
  }
}
