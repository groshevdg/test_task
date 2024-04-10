import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:exercise/core/errors/failure.dart';

part 'serialization_failure.freezed.dart';

@freezed
class SerializationFailure extends Failure with _$SerializationFailure {
  const factory SerializationFailure() = _SerializationFailure;
}
