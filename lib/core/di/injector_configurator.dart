import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:exercise/core/di/injector_configurator.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  await getIt.allReady();

  getIt<Dio>().interceptors.addAll([
    AwesomeDioInterceptor(logRequestTimeout: false),
  ]);
}
