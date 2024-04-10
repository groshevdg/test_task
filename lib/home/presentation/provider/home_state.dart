import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:exercise/home/data/models/fact_dto.dart';
import 'package:exercise/home/presentation/models/home_errors.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isLoading,
    HomeErrors? errors,
    FactDTO? fact,
  }) = _HomeState;
}
