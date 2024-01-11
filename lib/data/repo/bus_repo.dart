import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_exceptions.dart';
import '../utils/snackbar.dart';

class BusRepo {
  final api = API();

  Future getBus({required BuildContext context}) async {
    try {
      Response response = await api.sendRequest.get(ApiEndPoints.BusListApi);
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
