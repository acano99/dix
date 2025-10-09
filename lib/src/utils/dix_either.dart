/// Una clase sellada que representa un valor que puede ser de uno de dos tipos,
/// comúnmente utilizado para el manejo de errores funcionales sin excepciones.
///
/// Por convención, [L] (Left) se usa para representar un estado de falla o error,
/// mientras que [R] (Right) se usa para un estado de éxito.
///
/// Esto permite que las funciones devuelvan explícitamente un resultado que puede
/// ser un éxito o un error, obligando al llamador a manejar ambos casos a través
/// del método [fold].
///
/// Ejemplo de uso:
/// ```dart
/// DixEither<String, int> dividir(int a, int b) {
///   if (b == 0) {
///     return DixLeft('No se puede dividir por cero');
///   } else {
///     return DixRight(a ~/ b);
///   }
/// }
///
/// final resultado = dividir(10, 2);
/// final valor = resultado.fold(
///   (error) => 'Error: $error',
///   (exito) => 'El resultado es: $exito',
/// );
/// print(valor); // Imprime: 'El resultado es: 5'
/// ```
sealed class DixEither<L, R> {
  /// Constructor base constante.
  const DixEither();

  /// Transforma el valor contenido en [DixEither] (sea [L] o [R]) en un único
  /// valor de tipo [T].
  ///
  /// Obliga a manejar ambos casos, proporcionando una función para el estado
  /// [DixLeft] y otra para el estado [DixRight].
  ///
  /// [onLeft]: La función a ejecutar si esto es un [DixLeft]. Recibe el valor de error [L].
  /// [onRight]: La función a ejecutar si esto es un [DixRight]. Recibe el valor de éxito [R].
  /// Retorna el resultado de la función ejecutada.
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight);
}

/// Representa el estado de falla o 'izquierda' de un [DixEither].
///
/// Contiene un valor de tipo [L], que por convención es el error.
class DixLeft<L, R> extends DixEither<L, R> {
  /// El valor de error contenido.
  final L value;

  /// Crea una instancia de [DixLeft] con el valor de error proporcionado.
  const DixLeft(this.value);

  @override
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) => onLeft(value);
}

/// Representa el estado de éxito o 'derecha' de un [DixEither].
///
/// Contiene un valor de tipo [R], que por convención es el resultado correcto.
class DixRight<L, R> extends DixEither<L, R> {
  /// El valor de éxito contenido.
  final R value;

  /// Crea una instancia de [DixRight] con el valor de éxito proporcionado.
  const DixRight(this.value);

  @override
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) => onRight(value);
}