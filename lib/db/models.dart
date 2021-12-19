import 'package:dio/dio.dart';
import 'package:kitaro/kitaro.dart';


class ApiResult<T> {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const ApiResult._({
    this.response,
    this.httpCode,
    ErrorMessage? error,
  }) : _error = error;

  factory ApiResult.success({required T response, required int httpCode}) {
    return ApiResult._(response: response, httpCode: httpCode);
  }

  factory ApiResult.failed({
    required int httpCode,
    required String errorTitle,
    String? errorMessage,
  }) {
    return ApiResult._(
      httpCode: httpCode,
      error: ErrorMessage(
        title: errorTitle,
        message: errorMessage,
      ),
    );
  }

  factory ApiResult.unknown({required String errorCode, int? httpCode}) {
    return ApiResult._(
      error: ErrorMessage(title: errorCode),
      httpCode: httpCode,
    );
  }

  // ------------------------------- FIELDS -------------------------------
  final T? response;
  final int? httpCode;
  final ErrorMessage? _error;

  // ----------------------------- PROPERTIES -----------------------------
  ErrorMessage? get error =>
      _error;

  bool get isSuccess => _error == null;

  bool get hasError => _error != null;

  // ------------------------------- METHODS ------------------------------
  ApiResult<T> copyWith({
    T? response,
    int? httpCode,
    ErrorMessage? error,
  }) {
    return ApiResult._(
      response: response ?? this.response,
      httpCode: httpCode ?? this.httpCode,
      error: error ?? _error,
    );
  }
}

class CallApiResult<T> {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const CallApiResult({
    required this.rawResponse,
    this.response,
  });

  // ------------------------------- FIELDS -------------------------------
  final Response rawResponse;
  final T? response;
}
