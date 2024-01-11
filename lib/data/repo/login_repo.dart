import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_exceptions.dart';
import '../utils/snackbar.dart';

class LoginRepo {
  final api = API();
  Future login({required String username,required String password,required BuildContext context}) async {
    final FormData body = FormData.fromMap({
      "username":username,
      "password":password,
    });
    try {
      Response response = await api.sendRequest.post(ApiEndPoints.LoginApi,
          options: Options(contentType: 'multipart/form_data'), data: body);
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (ex) {
      final errorMessage = ApiException.fromDioError(ex).toString();
      showError(context, errorMessage);
      return Future.error(errorMessage);
    } catch (exception) {
      showError(context, exception.toString());

      return Future.error(exception.toString());
    }
  }
}