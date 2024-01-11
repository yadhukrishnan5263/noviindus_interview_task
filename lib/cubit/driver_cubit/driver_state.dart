part of 'driver_cubit.dart';

@immutable
abstract class DriverState {}

class DriverInitial extends DriverState {}
class DriverListLoading extends DriverState {}
class DeleteDriver extends DriverState {}
class DriverListLoded extends DriverState {
  final List<DriverModel> driverlist;

  DriverListLoded(this.driverlist);
}
class DriverListError extends DriverState {}
