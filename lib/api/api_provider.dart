import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:optimal_oncology/api/responses/login/login_response.dart';

import '../constants.dart';

class ApiProvider {
  late Dio _dio;

  ApiProvider() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 15000, connectTimeout: 15000,);

    _dio = Dio(options);
    String username = 'username';
    String password = 'password';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    Map<String, String>? customHeaders = {'authorization': basicAuth};

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      options.headers.addAll(customHeaders);
      return handler.next(options);
    }));
  }

  Future<Object> processDashboard() async {
    try {

      Response response = await _dio.get(
        AppConstants.dashboard,
      );
      return json.decode(response.toString());

    } catch (error, stacktrace) {

      return json.decode(_handleError(error));
    }
  }
  Future<LoginRegisterResponse> processLogin(email, password) async {
    try {

      Response response = await _dio.post(
        AppConstants.login,
        data: {
          'email': email,
          'password': password,
        },

      );
      return LoginRegisterResponse.fromJson(json.decode(response.toString()));

    } catch (error, stacktrace) {

      return LoginRegisterResponse.withError(_handleError(error));
    }
  }

  String _handleError(Object error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "request_cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "connection_timed_out";
          break;
        case DioErrorType.other:
          errorDescription = "something_went_wrong";
          break;
        case DioErrorType.response:
          errorDescription = "receive_timed_out";
          break;
        case DioErrorType.response:
          errorDescription = "unauthorized";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "send_timed_out";
          break;
        default:
          errorDescription = "something_went_wrong";
          break;
      }
    } else {
      errorDescription = "unexpected_error";
    }

    return errorDescription;
  }
}
