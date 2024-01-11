import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:noviindus_interview_task/data/model/bus_model.dart';
import 'package:noviindus_interview_task/data/utils/loading.dart';
import 'package:noviindus_interview_task/data/utils/snackbar.dart';

import '../../data/model/bus_model.dart';
import '../../data/repo/bus_repo.dart';

part 'bus_state.dart';

class BusCubit extends Cubit<BusState> {
  BusCubit() : super(BusInitial());
  final repo = BusRepo();
  getBusList({required BuildContext context}) async {
    emit(BusListLoading());
    showLoading(context);
    try {
      await repo.getBus(context: context).then((value) {
        List data = value["bus"];
        List<BusModel> buslist = data.map((e) => BusModel.fromJson(e)).toList();

        hideLoading(context);
        emit(BusListLoded(buslist));
      });
    } catch (e) {
      showError(context, "Something went wrong");
      hideLoading(context);
      emit(BusListError());
    }
  }
}
