# Dix

**Dix** es un paquete de utilidades para Flutter en desarrollo activo, diseñado para simplificar la creación de interfaces consistentes y la gestión de configuraciones comunes en aplicaciones Flutter. Esta es la **versión inicial** del paquete, que incluye herramientas para estilizar botones, mostrar notificaciones, validar cadenas y configurar la aplicación con soporte para navegación (compatible con `go_router`). ¡El proyecto está en constante crecimiento y abierto a contribuciones!

## Características

- **Estilos de botones**: Define estilos predefinidos para `ElevatedButton` y `OutlinedButton` con `DixButtonStyles`, basados en el tema de la aplicación.
- **Notificaciones**: Muestra SnackBars personalizados con `DixSnackbar`, con estilos consistentes.
- **Validación de cadenas**: Valida formatos como correos, URLs, números de teléfono y más con `DixUtils`.
- **Dimensiones predefinidas**: Usa tamaños estándar para espaciados y elementos de UI con `DixDimens`.
- **Configuración de la aplicación**: Simplifica la configuración de `MaterialApp` o `MaterialApp.router` con `DixMaterialApp`, que asigna automáticamente claves globales para navegación y notificaciones.

> **Nota**: Este es un proyecto en desarrollo. Nuevas funcionalidades y mejoras se añadirán en futuras versiones. ¡Consulta el [CHANGELOG](CHANGELOG.md) para actualizaciones!

## Instalación

1. Agrega el paquete a tu `pubspec.yaml` desde el repositorio de GitHub:

   ```yaml
   dependencies:
     dix:
       git:
         url: https://github.com/tu_usuario/dix.git
         ref: main
   ```

2. Ejecuta el siguiente comando para instalar la dependencia:

   ```bash
   flutter pub get
   ```

## Configuración inicial

`DixMaterialApp` configura automáticamente las claves globales de `DixKeys` (`navigatorKey` y `scaffoldMessengerKey`) para habilitar la navegación y las notificaciones en la aplicación. Si usas `go_router` para la navegación, asigna `DixKeys.navigatorKey` al `GoRouter`.

### Configuración con `go_router`

Usa `DixMaterialApp.router` y pasa `DixKeys.navigatorKey` al `GoRouter`:

```dart
import 'package:dix/dix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  final router = GoRouter(
    navigatorKey: DixKeys.navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MyHomePage(),
      ),
      // Más rutas...
    ],
  );

  runApp(
    DixMaterialApp.router(
      routerConfig: router,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: 'Mi Aplicación',
    ),
  );
}
```

### Configuración con `MaterialApp` clásico

Si no usas `go_router`, usa el constructor `DixMaterialApp`, que configura automáticamente las claves globales:

```dart
import 'package:dix/dix.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DixMaterialApp(
      home: MyHomePage(),
      theme: ThemeData.light(),
      title: 'Mi Aplicación',
    ),
  );
}
```

## Uso

### 1. Estilizar botones con `DixButtonStyles`

Crea botones con estilos predefinidos basados en el tema de la aplicación, con opción de personalizarlos usando `copyWith`.

```dart
import 'package:dix/dix.dart';
import 'package:flutter/material.dart';

// Uso normal (estilo predefinido)
ElevatedButton(
  style: DixButtonStyles.instance.elevatedButton(DixButtonType.primary),
  onPressed: () {},
  child: Text('Botón Primario'),
)

// Uso con copyWith (personalización)
ElevatedButton(
  style: DixButtonStyles.instance
      .elevatedButton(DixButtonType.primary)
      .copyWith(
        elevation: WidgetStatePropertyAll(4.0),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
  onPressed: () {},
  child: Text('Botón Primario Personalizado'),
)

// Uso normal (estilo predefinido)
OutlinedButton(
  style: DixButtonStyles.instance.outlinedButton(
    DixButtonType.secondary,
    radius: DixDimens.medium, // 16.0
  ),
  onPressed: () {},
  child: Text('Botón Secundario'),
)

// Uso con copyWith (personalización)
OutlinedButton(
  style: DixButtonStyles.instance
      .outlinedButton(
        DixButtonType.secondary,
        radius: DixDimens.medium, // 16.0
      )
      .copyWith(
        side: WidgetStatePropertyAll(
          BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
  onPressed: () {},
  child: Text('Botón Secundario Personalizado'),
)
```

### 2. Mostrar notificaciones con `DixSnackbar`

Muestra SnackBars con estilos consistentes usando `show` o crea un SnackBar personalizado con `showCustomSnackbar`.

```dart
import 'package:dix/dix.dart';
import 'package:flutter/material.dart';

DixSnackbar.instance.show(
  message: 'Operación completada',
  type: DixSnackbarType.primary,
);

DixSnackbar.instance.show(
  message: 'Error al guardar',
  type: DixSnackbarType.error,
  action: SnackBarAction(
    label: 'Reintentar',
    onPressed: () {},
  ),
  showCloseIcon: true,
  margin: EdgeInsets.all(DixDimens.small), // 8.0
);

DixSnackbar.instance.showCustomSnackbar(
  snackbar: SnackBar(
    content: Row(
      children: [
        Icon(Icons.info, color: Colors.white),
        SizedBox(width: DixDimens.small),
        Text('SnackBar personalizado'),
      ],
    ),
    backgroundColor: Colors.blue,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(DixDimens.medium),
    ),
  ),
);
```

### 3. Validar cadenas con `DixUtils`

Valida formatos comunes como correos electrónicos, URLs, números de teléfono, etc.

```dart
import 'package:dix/dix.dart';

bool isValidEmail = DixUtils.isEmail('usuario@ejemplo.com'); // true
bool isValidPhone = DixUtils.isPhoneNumber('+1 (123) 456-7890'); // true
bool isValidUrl = DixUtils.isURL('https://ejemplo.com'); // true
String cleaned = DixUtils.removeAllWithSpaces('Hola Mundo'); // 'HolaMundo'
```

### 4. Usar dimensiones predefinidas con `DixDimens`

Aplica dimensiones consistentes para espaciados, márgenes y tamaños.

```dart
import 'package:dix/dix.dart';
import 'package:flutter/material.dart';

Padding(
  padding: EdgeInsets.all(DixDimens.medium), // 16.0
  child: Text('Texto con espaciado medio'),
)

Container(
  margin: EdgeInsets.symmetric(vertical: DixDimens.high), // 20.0
  child: Icon(Icons.star, size: DixDimens.large), // 24.0
)
```

## Estructura del paquete

El paquete incluye las siguientes clases públicas:

- **`DixButtonStyles`**: Define estilos para `ElevatedButton` y `OutlinedButton`.
- **`DixSnackbar`**: Muestra SnackBars con estilos basados en el tema.
- **`DixUtils`**: Proporciona métodos para validar y manipular cadenas.
- **`DixDimens`**: Ofrece dimensiones predefinidas para la UI.
- **`DixMaterialApp`**: Envoltorio de `MaterialApp` que configura automáticamente claves globales.

La clase interna `DixKeys` maneja claves globales para navegación y notificaciones.

## Contribuciones

¡Dix está en constante crecimiento! Agradecemos cualquier contribución para mejorar el paquete. Para contribuir:

1. Haz un fork del repositorio.
2. Crea una rama para tu funcionalidad (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios y haz commit (`git commit -m 'Añade nueva funcionalidad'`).
4. Sube tus cambios (`git push origin feature/nueva-funcionalidad`).
5. Crea un Pull Request en GitHub.

Por favor, sigue las [guías de contribución](CONTRIBUTING.md) y asegúrate de incluir pruebas para nuevas funcionalidades.

## Licencia

Este paquete está licenciado bajo la [Licencia MIT](LICENSE). Consulta el archivo `LICENSE` para más detalles.