part of 'bus_cubit.dart';

@immutable
abstract class BusState {}

class BusInitial extends BusState {}
class BusListLoading extends BusState {}
class BusListLoded extends BusState {}
class BusListError extends BusState {}
