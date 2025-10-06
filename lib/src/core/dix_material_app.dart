import 'package:flutter/material.dart';

import 'dix_keys.dart';

/// Widget que actúa como punto de entrada de la aplicación, proporcionando un
/// envoltorio para [MaterialApp] o [MaterialApp.router]. Configura automáticamente
/// las claves globales de [DixKeys] para habilitar la navegación y las notificaciones
/// (como SnackBars) en toda la aplicación, especialmente para otras clases del paquete.
///
/// Soporta tanto el modo clásico de [MaterialApp] (usando rutas y `navigatorKey`)
/// como el modo router (compatible con `go_router` u otros sistemas de enrutamiento).
/// La clave [DixKeys.navigatorKey] debe pasarse al [GoRouter] para la navegación
/// en modo router, mientras que [DixKeys.scaffoldMessengerKey] se usa internamente
/// para notificaciones.
///
/// Debe usarse como el widget raíz de la aplicación, reemplazando [MaterialApp].
class DixMaterialApp extends StatefulWidget {
  /// Clave para el [Navigator], opcional. Si no se proporciona, se usa [DixKeys.navigatorKey].
  /// Útil para configurar la navegación con [GoRouter] en modo router.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// Clave para el [ScaffoldMessenger], opcional. Si no se proporciona, se usa
  /// [DixKeys.scaffoldMessengerKey] para gestionar notificaciones como SnackBars.
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  // Propiedades de MaterialApp (modo clásico)
  /// Widget inicial para el modo clásico.
  final Widget? home;

  /// Mapa de rutas nombradas para el modo clásico.
  final Map<String, WidgetBuilder> routes;

  /// Ruta inicial para el modo clásico.
  final String? initialRoute;

  /// Generador de rutas dinámicas para el modo clásico.
  final RouteFactory? onGenerateRoute;

  /// Generador de rutas iniciales para el modo clásico.
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// Ruta a mostrar cuando no se encuentra una ruta en el modo clásico.
  final RouteFactory? onUnknownRoute;

  /// Observadores para el [Navigator] en el modo clásico.
  final List<NavigatorObserver> navigatorObservers;

  /// Constructor para personalizar la construcción del árbol de widgets.
  final TransitionBuilder? builder;

  /// Título de la aplicación.
  final String title;

  /// Generador dinámico del título de la aplicación.
  final GenerateAppTitle? onGenerateTitle;

  /// Color principal de la aplicación.
  final Color? color;

  /// Tema claro de la aplicación.
  final ThemeData? theme;

  /// Tema oscuro de la aplicación.
  final ThemeData? darkTheme;

  /// Modo del tema (claro, oscuro o del sistema).
  final ThemeMode themeMode;

  /// Dirección del texto (LTR o RTL).
  final TextDirection? textDirection;

  /// Configuración regional (locale) de la aplicación.
  final Locale? locale;

  /// Delegados para localización.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// Callback para resolver la lista de locales.
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// Callback para resolver un locale específico.
  final LocaleResolutionCallback? localeResolutionCallback;

  /// Locales soportados por la aplicación.
  final Iterable<Locale> supportedLocales;

  /// Muestra una cuadrícula de depuración.
  final bool debugShowMaterialGrid;

  /// Muestra la superposición de rendimiento.
  final bool showPerformanceOverlay;

  /// Muestra un tablero de ajedrez en imágenes de caché rasterizado.
  final bool checkerboardRasterCacheImages;

  /// Muestra un tablero de ajedrez en capas fuera de pantalla.
  final bool checkerboardOffscreenLayers;

  /// Muestra el depurador de semántica.
  final bool showSemanticsDebugger;

  /// Muestra el banner de modo depuración.
  final bool debugShowCheckedModeBanner;

  /// Atajos de teclado personalizados.
  final Map<LogicalKeySet, Intent>? shortcuts;

  /// Comportamiento de desplazamiento personalizado.
  final ScrollBehavior? scrollBehavior;

  /// Tema de alto contraste para modo claro.
  final ThemeData? highContrastTheme;

  /// Tema de alto contraste para modo oscuro.
  final ThemeData? highContrastDarkTheme;

  /// Acciones personalizadas para intents.
  final Map<Type, Action<Intent>>? actions;

  /// Usa MediaQuery heredado del contexto padre.
  final bool useInheritedMediaQuery;

  // Propiedades de MaterialApp.router (modo router)
  /// Proveedor de información de ruta para el modo router.
  final RouteInformationProvider? routeInformationProvider;

  /// Analizador de información de ruta para el modo router.
  final RouteInformationParser<Object>? routeInformationParser;

  /// Delegado de enrutamiento para el modo router (ej: [GoRouter]).
  final RouterDelegate<Object>? routerDelegate;

  /// Configuración de enrutamiento para el modo router (ej: [GoRouter]).
  final RouterConfig<Object>? routerConfig;

  /// Gestor de botón de retroceso para el modo router.
  final BackButtonDispatcher? backButtonDispatcher;

  /// Constructor para el modo clásico de [MaterialApp].
  const DixMaterialApp({
    super.key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.textDirection,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.scrollBehavior,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.actions,
    this.useInheritedMediaQuery = false,
  }) : routeInformationProvider = null,
       routeInformationParser = null,
       routerDelegate = null,
       routerConfig = null,
       backButtonDispatcher = null;

  /// Constructor para el modo router de [MaterialApp.router], compatible con [GoRouter].
  const DixMaterialApp.router({
    super.key,
    this.scaffoldMessengerKey,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.useInheritedMediaQuery = false,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.scrollBehavior,
    this.actions,
    this.textDirection,
  }) : navigatorKey = null,
       home = null,
       routes = const {},
       initialRoute = null,
       onGenerateRoute = null,
       onGenerateInitialRoutes = null,
       onUnknownRoute = null,
       navigatorObservers = const [];

  @override
  State<DixMaterialApp> createState() => _DixMaterialAppState();
}

/// Estado del widget [DixMaterialApp], encargado de construir el [MaterialApp]
/// o [MaterialApp.router] según la configuración proporcionada.
class _DixMaterialAppState extends State<DixMaterialApp> {
  @override
  Widget build(BuildContext context) {
    if (widget.routerDelegate != null || widget.routerConfig != null) {
      // Modo router: configura [MaterialApp.router] con soporte para [GoRouter].
      return MaterialApp.router(
        routerDelegate: widget.routerDelegate,
        routeInformationParser: widget.routeInformationParser,
        routeInformationProvider: widget.routeInformationProvider,
        routerConfig: widget.routerConfig,
        backButtonDispatcher: widget.backButtonDispatcher,
        builder:
            widget.builder ??
            (context, child) {
              // Configura [ScaffoldMessenger] con [DixKeys.scaffoldMessengerKey]
              // para notificaciones globales.
              return ScaffoldMessenger(
                key: widget.scaffoldMessengerKey ?? DixKeys.scaffoldMessengerKey,
                child: child ?? const SizedBox.shrink(),
              );
            },
        title: widget.title,
        onGenerateTitle: widget.onGenerateTitle,
        color: widget.color,
        theme: widget.theme,
        darkTheme: widget.darkTheme,
        themeMode: widget.themeMode,
        localizationsDelegates: widget.localizationsDelegates,
        localeListResolutionCallback: widget.localeListResolutionCallback,
        localeResolutionCallback: widget.localeResolutionCallback,
        supportedLocales: widget.supportedLocales,
        debugShowMaterialGrid: widget.debugShowMaterialGrid,
        showPerformanceOverlay: widget.showPerformanceOverlay,
        checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
        showSemanticsDebugger: widget.showSemanticsDebugger,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        shortcuts: widget.shortcuts,
        scrollBehavior: widget.scrollBehavior,
        highContrastTheme: widget.highContrastTheme,
        highContrastDarkTheme: widget.highContrastDarkTheme,
        actions: widget.actions,
      );
    }

    // Modo clásico: configura [MaterialApp] con rutas y navegación tradicional.
    return MaterialApp(
      navigatorKey: widget.navigatorKey ?? DixKeys.navigatorKey,
      scaffoldMessengerKey:
          widget.scaffoldMessengerKey ?? DixKeys.scaffoldMessengerKey,
      home: widget.home,
      routes: widget.routes,
      initialRoute: widget.initialRoute,
      onGenerateRoute: widget.onGenerateRoute,
      onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
      onUnknownRoute: widget.onUnknownRoute,
      navigatorObservers: widget.navigatorObservers,
      builder: widget.builder,
      title: widget.title,
      onGenerateTitle: widget.onGenerateTitle,
      color: widget.color,
      theme: widget.theme,
      darkTheme: widget.darkTheme,
      themeMode: widget.themeMode,
      locale: widget.locale,
      localizationsDelegates: widget.localizationsDelegates,
      localeListResolutionCallback: widget.localeListResolutionCallback,
      localeResolutionCallback: widget.localeResolutionCallback,
      supportedLocales: widget.supportedLocales,
      debugShowMaterialGrid: widget.debugShowMaterialGrid,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
      showSemanticsDebugger: widget.showSemanticsDebugger,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      shortcuts: widget.shortcuts,
      scrollBehavior: widget.scrollBehavior,
      highContrastTheme: widget.highContrastTheme,
      highContrastDarkTheme: widget.highContrastDarkTheme,
      actions: widget.actions,
    );
  }
}