import 'package:dix/dix.dart';
import 'package:flutter/material.dart';

enum DixButtonType { primary, secondary, tertiary, error }

class DixButtonStyles {
  DixButtonStyles._();

  static final DixButtonStyles instance = DixButtonStyles._();

  final colorScheme = Theme.of(
    DixKeys.navigatorKey.currentContext!,
  ).colorScheme;

  late Color backgroundColor;
  late Color foregroundColor;
  late Color borderColor;

  ButtonStyle elevatedButton(DixButtonType type) {
    _setElevatedColors(type);

    return _buildElevatedStyle(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    );
  }

  ButtonStyle outlinedButton(
    DixButtonType type, {
    Color? customForeground,
    double radius = 12,
  }) {
    _setOutlinedColors(type);

    return _buildOutlinedStyle(
      borderColor: borderColor,
      foregroundColor: customForeground ?? foregroundColor,
      radius: radius,
    );
  }

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

  ButtonStyle _buildOutlinedStyle({
    required Color borderColor,
    required Color foregroundColor,
    required double radius,
  }) => ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadiusGeometry.circular(radius),
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
