import 'dart:async' show FutureOr;

abstract class UseCase<Type, Params> {
  FutureOr<void> call(Params params);
}
