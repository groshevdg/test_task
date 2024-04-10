import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_dto.g.dart';
part 'fact_dto.freezed.dart';

@freezed
class FactDTO with _$FactDTO {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FactDTO({
    required String fact,
}) = _FactDTO;

  factory FactDTO.fromJson(Map<String, dynamic> json) =>
      _$FactDTOFromJson(json);
}