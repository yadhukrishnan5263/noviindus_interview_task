import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../data/repo/driver_repo.dart';
import '../../data/utils/loading.dart';
import '../../data/utils/snackbar.dart';

part 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(DriverInitial());
  final repo = DriverRepo();
  getDriverList({required BuildContext context}) async {
    emit(DriverListLoading());
    showLoading(context);
    try {
      await repo.getDriver(context: context).then((value) {
        hideLoading(context);
        emit(DriverListLoded());
      });
    }catch(e){
      showError(context, "Something went wrong");
      hideLoading(context);
      emit(DriverListError());
    }
  }
  postDriver({required String name,required String mobile,required String license_no,required BuildContext context}) async {
    emit(DriverListLoading());
    showLoading(context);
    try {
      await repo.addDriver(name: name,mobile: mobile,license_no: license_no,context: context).then((value) {
        hideLoading(context);
        emit(DriverListLoded());
      });
    }catch(e){
      showError(context, "Something went wrong");
      hideLoading(context);
      emit(DriverListError());
    }
  }
  deleteDriver({required int driver_id,required BuildContext context}) async {
    emit(DriverListLoading());
    showLoading(context);
    try {
      await repo.deleteDriver(driver_id: driver_id, context: context).then((value) {
        hideLoading(context);
        emit(DriverListLoded());
      });
    }catch(e){
      showError(context, "Something went wrong");
      hideLoading(context);
      emit(DriverListError());
    }
  }
}
