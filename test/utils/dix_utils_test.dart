import 'package:dix/dix.dart';
import 'package:flutter_test/flutter_test.dart';

/// Test para comprobar los metodos de la clase DixUtils
void main() {
  group('isEmail: Comprobación de correos', () {
    test('Correo válido', () {
      final validEmail = 'abrahan.jcano99@gmail.com';

      final isValid = DixUtils.isEmail(validEmail);

      expect(isValid, isTrue);
    });
    test('Correo inválido', () {
      final invalidEmail = 'abrahan@com';

      final isInvalid = DixUtils.isEmail(invalidEmail);

      expect(isInvalid, isFalse);
    });
  });

  group('isPhoneNumber: Comprobación de números telefónicos', () {
    test('Número válido', () {
      final validNumber = '+53 55528678';

      final isValid = DixUtils.isPhoneNumber(validNumber);

      expect(isValid, isTrue);
    });

    test('Número inválido', () {
      final invalidNumber = '888888';

      final isInvalid = DixUtils.isPhoneNumber(invalidNumber);

      expect(isInvalid, isFalse);
    });
  });

  group('isUrl: Comprobación de ls URL', () {
    test('https válida', () {
      final validUrlHttps = 'https://www.acano99.com';

      final isValidUrlHttps = DixUtils.isURL(validUrlHttps);

      expect(isValidUrlHttps, isTrue);
    });
    test('http válida', () {
      final validUrlHttp = 'http://www.acano99.com';

      final isValidUrlHttp = DixUtils.isURL(validUrlHttp);

      expect(isValidUrlHttp, isTrue);
    });

    test('https inválida', () {
      final invalidUrlHttps = 'https://acano99';

      final isInvalidUrlHttps = DixUtils.isURL(invalidUrlHttps);

      expect(isInvalidUrlHttps, isFalse);
    });

    test('http inválida', () {
      final invalidUrlHttp = 'http://acano99';

      final isInvalidUrlHttp = DixUtils.isURL(invalidUrlHttp);

      expect(isInvalidUrlHttp, isFalse);
    });

    test('URL inválida', () {
      final invalidUrl = 'ht://acano99';

      final isInvalidUrl = DixUtils.isURL(invalidUrl);

      expect(isInvalidUrl, isFalse);
    });
  });

  group('isUsername: Comprueba si es un username válido', () {
    test('username válido', () {
      final validUsername = 'acano99';

      final isValidUsername = DixUtils.isUsername(validUsername);

      expect(isValidUsername, isTrue);
    });

    test('username inválido', () {
      final invalidUsername = '@acano';

      final isInvalidUsername = DixUtils.isUsername(invalidUsername);

      expect(isInvalidUsername, isFalse);
    });
  });

  group('removeAllWithSpaces: Comprobación del método', () {
    test('Comprobar si remueve correctamente los espacios', () {
      final stringWithSpaces = 'Hello World';
      final stringWitoutSpaces = 'HelloWorld';

      final result = DixUtils.removeAllWithSpaces(stringWithSpaces);

      expect(result, equals(stringWitoutSpaces));
    });
  });

  group('isDateTime: Comprobación de las fechas con horas', () {
    test('Fecha válida', () {
      final validDate = '2023-10-06T14:30:00.000Z';

      final isValid = DixUtils.isDateTime(validDate);

      expect(isValid, isTrue);
    });

    test('Fecha inválida', () {
      final invalidDate = '2023-13-06';

      final isInvalid = DixUtils.isDateTime(invalidDate);

      expect(isInvalid, isFalse);
    });
  });
}
