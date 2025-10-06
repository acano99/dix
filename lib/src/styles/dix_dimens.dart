/// Clase que define dimensiones predefinidas comúnmente utilizadas en el desarrollo
/// de interfaces de usuario en Flutter. Proporciona constantes estáticas para
/// espaciados, tamaños de elementos y márgenes, facilitando un diseño consistente
/// en la aplicación.
///
/// Todas las dimensiones son estáticas y de tipo `double`, ideales para propiedades
/// como padding, margin, tamaño de íconos, o espaciado entre widgets.
///
/// Ejemplo de uso:
/// ```dart
/// Padding(
///   padding: EdgeInsets.all(DixDimens.medium), // 16.0
///   child: Text('Ejemplo con espaciado medio'),
/// )
/// ```
class DixDimens {
  /// Dimensión pequeña, usada para espaciados o tamaños mínimos en la UI.
  ///
  /// Valor: `8.0` píxeles.
  /// Ejemplo: Espaciado entre elementos pequeños o bordes de widgets.
  static const double small = 8.0;

  /// Dimensión estándar, adecuada para la mayoría de los elementos de la UI.
  ///
  /// Valor: `12.0` píxeles.
  /// Ejemplo: Padding o márgenes estándar para botones o contenedores.
  static const double normal = 12.0;

  /// Dimensión media, ligeramente más grande que la estándar.
  ///
  /// Valor: `16.0` píxeles.
  /// Ejemplo: Espaciado entre secciones o tamaño de íconos medianos.
  static const double medium = 16.0;

  /// Dimensión alta, para elementos que requieren más espacio visual.
  ///
  /// Valor: `20.0` píxeles.
  /// Ejemplo: Márgenes para contenedores destacados o espaciado entre filas.
  static const double high = 20.0;

  /// Dimensión grande, para elementos prominentes o espaciados generosos.
  ///
  /// Valor: `24.0` píxeles.
  /// Ejemplo: Padding para secciones importantes o tamaño de íconos grandes.
  static const double large = 24.0;

  /// Dimensión muy grande, para elementos que necesitan destacar significativamente.
  ///
  /// Valor: `28.0` píxeles.
  /// Ejemplo: Espaciado para encabezados o elementos de diseño muy prominentes.
  static const double veryLarge = 28.0;
}
