part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent {}

class EmployeeSyncPress extends EmployeeEvent{}

class EmployeeFetchPress extends EmployeeEvent{}

class EmployeeSearchPress extends EmployeeEvent{
  final String name;
  EmployeeSearchPress({required this.name});
}
class EmployeeDetailPress extends EmployeeEvent{
  final List<dynamic> map;
  EmployeeDetailPress({required this.map});
}