import 'package:flutter/material.dart';

import '../../dix.dart';

enum DixSnackbarType { primary, secondary, tertiary, error }

class DixSnackbar {
  DixSnackbar._();

  static final DixSnackbar instance = DixSnackbar._();

  static const Duration _snackBarDisplayDuration = Duration(milliseconds: 4000);

  final _colorScheme = Theme.of(
    DixKeys.navigatorKey.currentContext!,
  ).colorScheme;

  late Color _backgroundColor;
  late Color _foregroundColor;

  void showCustomSnackbar({required SnackBar snackbar}) {
    ScaffoldMessenger.of(
      DixKeys.navigatorKey.currentContext!,
    ).showSnackBar(snackbar);
  }

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
