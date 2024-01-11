part of 'bus_cubit.dart';

@immutable
abstract class BusState {}

class BusInitial extends BusState {}

class BusListLoading extends BusState {}

class BusListLoded extends BusState {
  final List<BusModel> buslist;

  BusListLoded(this.buslist);
}

class BusListError extends BusState {}
