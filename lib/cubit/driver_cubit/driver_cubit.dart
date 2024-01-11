import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../data/model/driver_model.dart';
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
        List data = value["drivers"];
        List<DriverModel> driverlist =
            data.map((e) => DriverModel.fromJson(e)).toList();
        hideLoading(context);
        emit(DriverListLoded(driverlist));
      });
    } catch (e) {
      showError(context, "Something went wrong");
      hideLoading(context);
      emit(DriverListError());
    }
  }

  postDriver(
      {required String name,
      required String mobile,
      required String license_no,
      required BuildContext context}) async {
    emit(DriverListLoading());
    showLoading(context);
    try {
      await repo
          .addDriver(
              name: name,
              mobile: mobile,
              license_no: license_no,
              context: context)
          .then((value) {
        showSuccess(context, "Driver added successfully");
        hideLoading(context);
        emit(DriverListLoded([]));
        Navigator.pop(context);
      });
    } catch (e) {
      showError(context, "Something went wrong");
      hideLoading(context);
      emit(DriverListError());
    }
  }

  deleteDriver(
      {required List<DriverModel> driverlist,
      required int index,
      required int driver_id,
      required BuildContext context}) async {
    showLoading(context);
    try {
      await repo
          .deleteDriver(driver_id: driver_id, context: context)
          .then((value) {
        showSuccess(context, "Driver deleted successfully");
        driverlist.removeAt(index);
        emit(DriverListLoded(driverlist));
      });
      hideLoading(context);
    } catch (e) {
      showError(context, "Something went wrong");
      hideLoading(context);
      emit(DriverListError());
    }
  }
}
