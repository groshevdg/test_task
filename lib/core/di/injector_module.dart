import 'package:dio/dio.dart';
import 'package:flutter_app_environment/flutter_app_environment.dart' as env;
import 'package:injectable/injectable.dart';
import 'package:exercise/core/env/environment_config.dart';

@module
abstract class InjectorModule {
  @singleton
  EnvironmentConfig get config =>
      env.Environment<EnvironmentConfig>.instance().config;

  @lazySingleton
  Dio dio(EnvironmentConfig config) =>
      Dio(BaseOptions(baseUrl: config.baseUrl));
}
