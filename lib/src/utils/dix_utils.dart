/// Clase de utilidades que facilita algunas comprobaciones al usuario
class DixUtils {
  /// Método que permite realizar comprobaciones de String a partir de un patrón
  /// de expresión regular.
  ///
  /// Retorna `true` si el [value] coincide con el [pattern], de lo contrario `false`.
  /// Si [value] es `null`, retorna `false`.
  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  /// Comprueba si el String dado es un número de pasaporte válido.
  ///
  /// Un pasaporte válido debe tener entre 6 y 9 caracteres alfanuméricos
  /// y no puede ser solo ceros.
  static bool isPassport(String s) =>
      hasMatch(s, r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');

  /// Comprueba si el String dado es un nombre de usuario válido.
  ///
  /// Un nombre de usuario válido debe comenzar y terminar con un carácter alfanumérico,
  /// y puede contener caracteres alfanuméricos, guiones bajos o puntos en el medio.
  static bool isUsername(String s) =>
      hasMatch(s, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');

  /// Comprueba si el String dado es una URL válida.
  ///
  /// Soporta protocolos HTTP, HTTPS y FTP, así como dominios con o sin 'www'.
  static bool isURL(String s) => hasMatch(
    s,
    r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,7}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
  );

  /// Comprueba si el String dado es una dirección de correo electrónico válida.
  ///
  /// Soporta formatos de correo electrónico estándar.
  static bool isEmail(String s) => hasMatch(
    s,
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  /// Comprueba si el String dado es un número de teléfono válido.
  ///
  /// Un número de teléfono válido debe tener entre 9 y 16 dígitos
  /// y puede incluir prefijos internacionales, paréntesis, guiones, espacios y puntos.
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Comprueba si el String dado es una fecha y hora válida en formato ISO 8601.
  ///
  /// Espera un formato como 'YYYY-MM-DDTHH:MM:SS.sssZ' o 'YYYY-MM-DD HH:MM:SS.sss'.
  static bool isDateTime(String s) =>
      hasMatch(s, r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$');

  /// Elimina todos los espacios en blanco de un String dado.
  ///
  /// Retorna un nuevo String sin espacios.
  static String removeAllWithSpaces(String value) => value.replaceAll(' ', '');
}
