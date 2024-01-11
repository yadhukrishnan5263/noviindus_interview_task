part of 'driver_cubit.dart';

@immutable
abstract class DriverState {}

class DriverInitial extends DriverState {}
class DriverListLoading extends DriverState {}
class DriverListLoded extends DriverState {}
class DriverListError extends DriverState {}
