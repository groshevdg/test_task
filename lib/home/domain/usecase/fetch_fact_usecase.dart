import 'package:injectable/injectable.dart';
import 'package:exercise/core/errors/failure.dart';
import 'package:exercise/core/usecases/empty_params.dart';
import 'package:exercise/core/usecases/usecase.dart';
import 'package:exercise/home/data/models/fact_dto.dart';
import 'package:exercise/home/domain/repository/facts_repository.dart';

@injectable
class GetFactUseCase extends UseCase<FactDTO, EmptyParams> {
  GetFactUseCase({required FactsRepository repository}) : _repository = repository;

  final FactsRepository _repository;

  @override
  Future<({FactDTO? data, Failure? failure})> call(EmptyParams params) async {
    return _repository.fetchFact();
  }
}
