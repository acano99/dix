import 'package:dix/src/utils/dix_either.dart';
import 'package:flutter_test/flutter_test.dart';

sealed class LoginFailure {
  final String error;
  const LoginFailure(this.error);
}

class NetworkError extends LoginFailure {
  NetworkError() : super('Ha ocurrido un error de red');
}

class IncorrectUserOrPassword extends LoginFailure {
  IncorrectUserOrPassword() : super('Usuario o contrasenna incorrecto');
}

class EmptyUserOrPassword extends LoginFailure {
  EmptyUserOrPassword()
    : super('El usuario y la contrasenna no pueden estar vacios');
}

void main() {
  group('DixEither test a la clase', () {
    test('Probamos un caso satisfactorio', () {
      final response = _testLogin(user: 'acano', password: '1234');

      expect(response, isA<DixRight>());
    });

    test('Probamos caso de error NetworkError', () {
      final response = _testLogin(user: 'test', password: '1234');

      expect(
        response,
        isA<DixLeft>().having(
          (left) => left.value,
          'Error lanzado en el camino left',
          isA<NetworkError>(),
        ),
      );
    });

    test('Probamos caso de error EmptyUserOrPassword', () {
      final response = _testLogin(user: '', password: '');

      expect(
        response,
        isA<DixLeft>().having(
          (left) => left.value,
          'Error lanzado en el camino left',
          isA<EmptyUserOrPassword>(),
        ),
      );
    });

    test('Probamos caso de error IncorrectUserOrPassword', () {
      final response = _testLogin(user: 'acano', password: '123');

      expect(
        response,
        isA<DixLeft>().having(
          (left) => left.value,
          'Error lanzado en el camino left',
          isA<IncorrectUserOrPassword>(),
        ),
      );
    });
  });
}

DixEither<LoginFailure, String> _testLogin({
  required String user,
  required String password,
}) {
  if (user.isEmpty || password.isEmpty) return DixLeft(EmptyUserOrPassword());
  if (user == 'test') return DixLeft(NetworkError());
  if (password == '123') return DixLeft(IncorrectUserOrPassword());
  return DixRight('Login Succes');
}
