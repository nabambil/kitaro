import 'package:dio/dio.dart';

import 'models.dart';
import 'utils.dart';

class KitaroFirebase {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const KitaroFirebase();

  // ------------------------------- METHODS ------------------------------
  // Future<ApiResult<WorklifeLogInResponse>> logIn({
  //   required WorklifeLogInRequest request,
  // }) async {
  //   final path = Uri(path: '/v1/auth/login');
  //   return await handleApiError(
  //     errorCode: logInErrorCode,
  //     callApiFunction: () async {
  //       final result = await httpClient.requestUri<Map<String, dynamic>>(
  //         path,
  //         options: Options(method: 'POST'),
  //         data: request.toJson(),
  //       );
  //       return CallApiResult(
  //         rawResponse: result,
  //         response: WorklifeLogInResponse.fromJson(result.data ?? {}),
  //       );
  //     },
  //   );
  // }
}
