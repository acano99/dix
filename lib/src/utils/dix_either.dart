sealed class DixEither<L, R> {
  const DixEither();

  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight);
}

class DixLeft<L, R> extends DixEither<L, R> {
  final L value;

  const DixLeft(this.value);

  @override
  fold<T>(Function(L l) onLeft, Function(R r) onRight) => onLeft(value);
}

class DixRight<L, R> extends DixEither<L, R> {
  final R value;

  const DixRight(this.value);

  @override
  fold<T>(Function(L l) onLeft, Function(R r) onRight) => onRight(value);
}
