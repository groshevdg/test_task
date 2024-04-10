import 'package:exercise/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<({Type? data, Failure? failure})> call(Params params);
}

abstract class UseCaseSync<Type, Params> {
  ({Type? data, Failure? failure}) call(Params params);
}

abstract class UseCaseVoid<Params> {
  Future<Failure?> call(Params params);
}

abstract class UseCaseVoidSync<Params> {
  Failure? call(Params params);
}
