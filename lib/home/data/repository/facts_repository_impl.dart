import 'package:injectable/injectable.dart';
import 'package:exercise/core/errors/failure.dart';
import 'package:exercise/core/utils/repository_utils.dart';
import 'package:exercise/home/data/datasource/facts_remote_datasource.dart';
import 'package:exercise/home/data/models/fact_dto.dart';
import 'package:exercise/home/domain/repository/facts_repository.dart';

@LazySingleton(as: FactsRepository)
class FactsRepositoryImpl extends FactsRepository {
  FactsRepositoryImpl({required FactsRemoteDatasource factsRemoteDatasource})
      : _factsRemoteDatasource = factsRemoteDatasource;

  final FactsRemoteDatasource _factsRemoteDatasource;

  @override
  Future<({FactDTO? data, Failure? failure})> fetchFact() {
    return RepositoryUtils.processRequest(
      _factsRemoteDatasource.fetchRandomFact,
    );
  }
}
