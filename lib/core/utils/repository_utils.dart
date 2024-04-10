import 'package:dio/dio.dart';
import 'package:exercise/core/errors/failure.dart';
import 'package:exercise/core/errors/network_failure.dart';
import 'package:exercise/core/errors/serialization_failure.dart';

class RepositoryUtils {
  static Future<({Failure? failure, R? data})> processRequest<R>(
    Future<R> Function() func, {
    Failure Function(DioException dioException)? onDioException,
  }) async {
    try {
      final R response = await func();
      return (failure: null, data: response);
    } on DioException catch (dioException) {
      if (onDioException != null) {
        try {
          return (failure: onDioException(dioException), data: null);
          // ignore: avoid_catches_without_on_clauses
        } catch (_) {
          return (failure: const SerializationFailure(), data: null);
        }
      }

      return (failure: const NetworkFailure(), data: null);
      // ignore: avoid_catching_errors
    } on Error catch (_) {
      return (failure: const SerializationFailure(), data: null);
    }
  }
}
