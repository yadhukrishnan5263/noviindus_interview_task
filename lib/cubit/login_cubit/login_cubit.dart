import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:noviindus_interview_task/data/utils/loading.dart';

import '../../data/repo/login_repo.dart';
import '../../data/utils/snackbar.dart';

part 'login_state.dart';
String apiToken = '';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final repo = LoginRepo();
login({required String username,required String password,required BuildContext context}) async {
showLoading(context);
emit(LoginLoading());
try{
  await repo.login(username: username, password: password, context: context).then((value) {
    if (value["status"] == true) {
      apiToken=value['access_token'];
      showSuccess(context, value["message"]);
      emit(LoginSuccess());
      hideLoading(context);
    }
  });
}
catch(e){
  showError(context, "Login Failed");
  hideLoading(context);
  emit(LoginFailed());
}

}
}
