part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent {}

class EmployeeSyncPress extends EmployeeEvent{}

class EmployeeFetchPress extends EmployeeEvent{}
