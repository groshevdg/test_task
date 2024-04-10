import 'package:exercise/core/env/environment_config.dart';
import 'package:exercise/core/navigation/routes_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_environment/flutter_app_environment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends ConsumerWidget {
  const App({super.key});

  DebugOptions get _debugOptions =>
      Environment<EnvironmentConfig>.instance().debugOptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          showPerformanceOverlay: _debugOptions.showPerformanceOverlay,
          debugShowMaterialGrid: _debugOptions.debugShowMaterialGrid,
          checkerboardRasterCacheImages:
              _debugOptions.checkerboardRasterCacheImages,
          checkerboardOffscreenLayers:
              _debugOptions.checkerboardOffscreenLayers,
          showSemanticsDebugger: _debugOptions.showSemanticsDebugger,
          debugShowCheckedModeBanner:
              _debugOptions.debugShowCheckedModeBanner,
          initialRoute: RoutesFactory.initialRoute,
          onGenerateRoute: RoutesFactory.getGeneratedRoutes,
          title: 'Test Task',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          ),
        ),
      ),
    );
  }
}
