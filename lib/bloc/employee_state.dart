part of 'employee_bloc.dart';

@immutable
abstract class EmployeeState {
  static List initial() {
    List<dynamic> list=[];
    return list;
  }
}

class EmployeeInitial extends EmployeeState {}
