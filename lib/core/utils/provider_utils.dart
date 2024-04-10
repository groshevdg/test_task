import 'package:exercise/core/errors/failure.dart';
import 'package:exercise/core/errors/network_failure.dart';
import 'package:flutter/material.dart';

class ProviderUtils {
  static void failureHandler<T>(
    Failure failure, {
    required Function(T errorDTO) onErrorDTO,
    required VoidCallback onOtherFailure,
    VoidCallback? onEmptyNetworkFailure,
  }) {
    if (failure is NetworkFailure) {
      final errorDTO = failure.errorDTO;

      if (errorDTO != null && errorDTO is T) {
        onErrorDTO(errorDTO);
        return;
      }

      if (onEmptyNetworkFailure != null) {
        onEmptyNetworkFailure();
        return;
      }

      onOtherFailure();
      return;
    }

    onOtherFailure();
    return;
  }
}
