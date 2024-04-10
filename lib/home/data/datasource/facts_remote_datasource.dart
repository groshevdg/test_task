import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:exercise/home/data/models/fact_dto.dart';

part 'facts_remote_datasource.g.dart';

@lazySingleton
@RestApi()
abstract class FactsRemoteDatasource {
  @factoryMethod
  factory FactsRemoteDatasource(Dio dio) = _FactsRemoteDatasource;

  @GET('/fact')
  Future<FactDTO> fetchRandomFact();
}
