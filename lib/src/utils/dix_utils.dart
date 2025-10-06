/// Clase de utilidades que proporciona métodos estáticos para realizar validaciones y manipulaciones
/// comunes de cadenas de texto (Strings) en Flutter. Incluye comprobaciones para formatos como
/// correos electrónicos, números de teléfono, URLs, nombres de usuario, pasaportes, fechas y horas,
/// así como utilidades para manipular cadenas.
///
/// Todos los métodos son estáticos, por lo que no es necesario instanciar la clase.
/// Ejemplo de uso:
/// ```dart
/// bool isValidEmail = DixUtils.isEmail('usuario@ejemplo.com'); // true
/// bool isValidPhone = DixUtils.isPhoneNumber('+1 (123) 456-7890'); // true
/// String cleanedString = DixUtils.removeAllWithSpaces('Hola Mundo'); // 'HolaMundo'
/// ```
class DixUtils {
  /// Valida si una cadena coincide con un patrón de expresión regular.
  ///
  /// [value]: La cadena a validar. Si es `null`, retorna `false`.
  /// [pattern]: El patrón de expresión regular a usar para la validación.
  /// Retorna `true` si [value] coincide con [pattern], de lo contrario `false`.
  ///
  /// Ejemplo:
  /// ```dart
  /// bool result = DixUtils.hasMatch('test123', r'^[a-zA-Z0-9]+$'); // true
  /// bool nullResult = DixUtils.hasMatch(null, r'^[a-zA-Z0-9]+$'); // false
  /// ```
  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  /// Valida si una cadena representa un número de pasaporte válido.
  ///
  /// Un pasaporte válido debe:
  /// - Tener entre 6 y 9 caracteres alfanuméricos.
  /// - No estar compuesto únicamente por ceros (ej: '000000' no es válido).
  ///
  /// [s]: La cadena a validar.
  /// Retorna `true` si [s] es un número de pasaporte válido, de lo contrario `false`.
  ///
  /// Ejemplo:
  /// ```dart
  /// bool valid = DixUtils.isPassport('AB123456'); // true
  /// bool invalid = DixUtils.isPassport('000000'); // false
  /// ```
  static bool isPassport(String s) =>
      hasMatch(s, r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');

  /// Valida si una cadena representa un nombre de usuario válido.
  ///
  /// Un nombre de usuario válido debe:
  /// - Comenzar y terminar con un carácter alfanumérico.
  /// - Contener solo caracteres alfanuméricos, guiones bajos (`_`) o puntos (`.`) en el medio.
  /// - Tener al menos 3 caracteres (debido al patrón `[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]`).
  ///
  /// [s]: La cadena a validar.
  /// Retorna `true` si [s] es un nombre de usuario válido, de lo contrario `false`.
  ///
  /// Ejemplo:
  /// ```dart
  /// bool valid = DixUtils.isUsername('user_name123'); // true
  /// bool invalid = DixUtils.isUsername('_user_'); // false
  /// ```
  static bool isUsername(String s) =>
      hasMatch(s, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');

  /// Valida si una cadena representa una URL válida.
  ///
  /// Soporta URLs con:
  /// - Protocolos `http`, `https`, `ftp` (case-insensitive).
  /// - Dominios con o sin `www`.
  /// - Extensiones de dominio de 2 a 7 caracteres (ej: `.com`, `.co.uk`).
  /// - Puertos opcionales (ej: `:8080`).
  /// - Rutas, parámetros de consulta, o fragmentos (opcional).
  ///
  /// [s]: La cadena a validar.
  /// Retorna `true` si [s] es una URL válida, de lo contrario `false`.
  ///
  /// Ejemplo:
  /// ```dart
  /// bool valid = DixUtils.isURL('https://www.ejemplo.com/ruta'); // true
  /// bool invalid = DixUtils.isURL('htp://invalid'); // false
  /// ```
  static bool isURL(String s) => hasMatch(
    s,
    r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,7}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
  );

  /// Valida si una cadena representa una dirección de correo electrónico válida.
  ///
  /// Soporta formatos estándar de correo electrónico, incluyendo:
  /// - Direcciones con subdominios (ej: `usuario@sub.dominio.com`).
  /// - Direcciones con comillas para nombres (ej: `"nombre completo"@dominio.com`).
  /// - Direcciones con direcciones IP (ej: `usuario@[192.168.1.1]`).
  ///
  /// [s]: La cadena a validar.
  /// Retorna `true` si [s] es un correo electrónico válido, de lo contrario `false`.
  ///
  /// Ejemplo:
  /// ```dart
  /// bool valid = DixUtils.isEmail('usuario@ejemplo.com'); // true
  /// bool invalid = DixUtils.isEmail('usuario@.com'); // false
  /// ```
  static bool isEmail(String s) => hasMatch(
    s,
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  /// Valida si una cadena representa un número de teléfono válido.
  ///
  /// Un número de teléfono válido debe:
  /// - Tener entre 9 y 16 caracteres.
  /// - Contener solo dígitos, prefijos internacionales (`+`), paréntesis, guiones (`-`),
  ///   espacios o puntos (`.`).
  ///
  /// [s]: La cadena a validar.
  /// Retorna `true` si [s] es un número de teléfono válido, de lo contrario `false`.
  ///
  /// Ejemplo:
  /// ```dart
  /// bool valid = DixUtils.isPhoneNumber('+1 (123) 456-7890'); // true
  /// bool invalid = DixUtils.isPhoneNumber('12345'); // false (demasiado corto)
  /// ```
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Valida si una cadena representa una fecha y hora válida en formato ISO 8601.
  ///
  /// Soporta formatos como:
  /// - `YYYY-MM-DDTHH:MM:SS.sss` (ej: `2023-10-06T14:30:00.000`).
  /// - `YYYY-MM-DD HH:MM:SS.sss` (con espacio en lugar de `T`).
  /// - Opcionalmente, termina con `Z` para indicar UTC (ej: `2023-10-06T14:30:00.000Z`).
  ///
  /// [s]: La cadena a validar.
  /// Retorna `true` si [s] es una fecha y hora válida, de lo contrario `false`.
  ///
  /// Ejemplo:
  /// ```dart
  /// bool valid = DixUtils.isDateTime('2023-10-06T14:30:00.000Z'); // true
  /// bool invalid = DixUtils.isDateTime('2023-13-06'); // false
  /// ```
  static bool isDateTime(String s) =>
      hasMatch(s, r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$');

  /// Elimina todos los espacios en blanco de una cadena.
  ///
  /// [value]: La cadena de la que se eliminarán los espacios.
  /// Retorna una nueva cadena sin espacios en blanco.
  ///
  /// Ejemplo:
  /// ```dart
  /// String result = DixUtils.removeAllWithSpaces('Hola Mundo'); // 'HolaMundo'
  /// ```
  static String removeAllWithSpaces(String value) => value.replaceAll(' ', '');
}
