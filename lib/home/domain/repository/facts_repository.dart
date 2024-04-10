import 'package:exercise/core/errors/failure.dart';
import 'package:exercise/home/data/models/fact_dto.dart';

abstract class FactsRepository {
  Future<({FactDTO? data, Failure? failure})> fetchFact();
}