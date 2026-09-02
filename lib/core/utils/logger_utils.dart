import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final log = LoggerUtils();

class LoggerUtils {
  static final LoggerUtils _instance = LoggerUtils._internal();
  factory LoggerUtils() => _instance;

  late final Logger _logger;

  LoggerUtils._internal() {
    _logger = Logger(
      // printer: SimplePrinter(printTime: true),
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        dateTimeFormat: (time) =>
            "${time.day}/${time.month}/${time.year} - ${time.hour}:${time.minute}:${time.second}",
      ),
    );
  }

  /// INFO
  void info(String message, {dynamic data}) {
    if (kDebugMode) {
      _logger.i(_format(message, data));
    }
  }

  /// WARNING
  void warning(String message, {dynamic data}) {
    if (kDebugMode) {
      _logger.w(_format(message, data));
    }
  }

  /// ERROR
  void error(String message, {dynamic error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }

  /// DEBUG
  void debug(String message, {dynamic data}) {
    if (kDebugMode) {
      _logger.d(_format(message, data));
    }
  }

  /// WTF
  void wtf(String message, {dynamic data}) {
    if (kDebugMode) {
      _logger.f(_format(message, data));
    }
  }

  void debugRaw(Object? data) {
    if (kDebugMode) {
      _logger.d(data.toString());
    }
  }

  /// STRUCTURED FORMATTER
  String _format(String message, dynamic data) {
    if (data == null) return message;
    return "$message\nDATA: $data";
  }
}
