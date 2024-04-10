import 'dart:async';

import 'package:exercise/core/app.dart';
import 'package:exercise/core/di/injector_configurator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:exercise/core/providers/provider_logger.dart';

Future<void> run() async {
  await configureDependencies();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: const App(),
    ),
  );
}
