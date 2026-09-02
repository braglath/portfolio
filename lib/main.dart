import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/app.dart';
import 'package:portfolio/core/utils/logger_utils.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      FlutterError.presentError(details);
    } else {
      log.error(
        'Flutter framework error',
        error: details.exception,
        stackTrace: details.stack,
      );
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log.error('PlatformDispatcher error', error: error, stackTrace: stack);
    return true;
  };

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized(); // ← inside zone
      runApp(const ProviderScope(child: PortfolioApp()));
    },
    (error, stack) {
      log.error('Uncaught zone error', error: error, stackTrace: stack);
    },
  );
}
