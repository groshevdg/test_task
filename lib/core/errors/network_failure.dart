import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:exercise/core/errors/failure.dart';

part 'network_failure.freezed.dart';

@Freezed(genericArgumentFactories: true)
class NetworkFailure<T> extends Failure with _$NetworkFailure<T> {
  const factory NetworkFailure({
    T? errorDTO,
  }) = _NetworkFailure<T>;
}
