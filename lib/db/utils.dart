import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kitaro/kitaro.dart';

import 'models.dart';

// ------------------------------ VARIABLES -----------------------------
final developerStateError = StateError(
  'Response object should never be null when any API call is completed '
      'successfully',
);
final errorDetailsHttpCodeKey = 'httpCode';

// ------------------------------ FUNCTIONS -----------------------------
Future<ApiResult<T>> handleApiError<T>({
  required _CallApiFunction<T> callApiFunction,
  required String errorCode,
}) async {
  try {
    final r = await callApiFunction();
    if (r.response != null &&
        r.rawResponse.statusCode != null &&
        r.rawResponse.statusCode! >= 200 &&
        r.rawResponse.statusCode! < 300) {
      return ApiResult.success(
        response: r.response!,
        httpCode: r.rawResponse.statusCode!,
      );
    }
  } on DioError catch (e) {
    final statusCode = e.response?.statusCode;
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 404 ||
        statusCode == 409 ||
        statusCode == 422) {
      return _handleError(e, errorCode);
    }

    if (statusCode != null) {
      return ApiResult.unknown(
        errorCode: '$errorCode-$statusCode',
        httpCode: statusCode,
      );
    }

    return ApiResult.unknown(errorCode: '$errorCode-1');
    // ignore: unused_catch_clause
  } on CheckedFromJsonException catch (e) {
    return ApiResult.unknown(errorCode: '$errorCode-JSON');
  }

  return ApiResult.unknown(errorCode: '$errorCode-2');
}

ApiResult<T> _handleError<T>(DioError e, String errorCode) {
  // Null check has been done before this method is called.
  final response = e.response!;
  final statusCode = response.statusCode!;

  // Status code 404 with no response payload.
  if (statusCode == 404) {
    return ApiResult.failed(
      httpCode: statusCode,
      errorTitle: errorTitleNotFound,
    );
  }

  return ApiResult.unknown(
    errorCode: '$errorCode-$statusCode',
    httpCode: statusCode,
  );
}

// ------------------------------ TYPEDEFS ------------------------------
typedef _CallApiFunction<T> = Future<CallApiResult<T>> Function();
