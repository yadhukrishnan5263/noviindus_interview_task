
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:noviindus_interview_task/cubit/login_cubit/login_cubit.dart';



import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_endpoints.dart';

class API {
  final Dio _dio = Dio();
  API() {
    _dio.options.baseUrl = ApiEndPoints.BASE_URL;
    _dio.interceptors.add(PrettyDioLogger(
        compact: true,
        error: true,
        responseBody: true,
        responseHeader: true,
        
        requestHeader: true,
        requestBody: true,
        request: true));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options,
            RequestInterceptorHandler requestInterceptorHandler) async {
          final token = apiToken;
          if (token != null) {
            options.headers["x-api-key"] = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA1MDE0MTUxLCJpYXQiOjE3MDQ5Mjc3NTEsImp0aSI6IjQ0MzgwMWUxOTMzZTRlN2ViYjk1OWE0M2M2N2Q3MTllIiwidXNlcl9pZCI6MiwiZmlyc3RfbmFtZSI6ImFkbWluX3VzZXIiLCJ1cmxfaWQiOiJXSzRFUkRUIn0.Cu5CYCfwx8SLL2QKkjKQIb8zFDWbGCRkyhvXe6zTpmM";
          }
          return requestInterceptorHandler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          if (response.statusCode == 401) {
            log("401error");

            // locator<SharedPrefs>().removeAll();
            // Navigator.pushAndRemoveUntil(
            //     MyApp.context,
            //     MaterialPageRoute(
            //       builder: (_) => const Login(),
            //     ),
            //     (route) => false);
          }
          if (response.data is String) {
            final jsonResponse = jsonDecode(response.data);
            response.data = jsonResponse;
          }
          return handler.next(response);
        },
        onError: (
          DioException error,
          //ErrorSpacer (API,)
          ErrorInterceptorHandler handler,
        ) async {
          log('DioError, $error');
          return handler.next(error);
        },
      ),
    );
  }
  Dio get sendRequest => _dio;
}
