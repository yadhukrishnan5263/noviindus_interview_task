import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:noviindus_interview_task/cubit/login_cubit/login_cubit.dart';
import 'package:noviindus_interview_task/data/utils/snackbar.dart';

import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_exceptions.dart';

class DriverRepo {
  final api = API();
  Future getDriver({required BuildContext context}) async {
    try {
      Response response = await api.sendRequest.get(ApiEndPoints.DriverApi);
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
  Future addDriver({required String name,required String mobile,required String license_no,required BuildContext context}) async {
    final FormData body = FormData.fromMap({
      "name":name,
      "mobile":mobile,
      "license_no":license_no
    });
    try {
      Response response = await api.sendRequest.post(ApiEndPoints.DriverApi+"$apiToken/",
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
  Future deleteDriver({required int driver_id,required BuildContext context}) async {
    final FormData body = FormData.fromMap({
      "driver_id":driver_id
    });
    try {
      Response response = await api.sendRequest.delete(ApiEndPoints.DriverApi+"$apiToken/",
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

}
  }
}