import 'package:exercise/core/env/environment_config.dart';
import 'package:exercise/core/runner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_environment/flutter_app_environment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Environment.initFromJson<EnvironmentConfig>(
    environmentType: EnvironmentType.test,
    fromJson: EnvironmentConfig.fromJson,
  );

  await run();
}
