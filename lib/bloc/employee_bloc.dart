import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocplay2/data/db.dart';
import 'package:blocplay2/data/employee_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class Geo{
  String lat;//": "-68.6102",
  String lng;//": "-47.0653"
  Geo(this.lat,this.lng);
  Geo.fromJson(Map<String,dynamic> json):lat=json['lat'],lng=json['lng'];
}
class Address{
  String street;//": "Douglas Extension",
  String suite;//": "Suite 847",
  String city;//": "McKenziehaven",
  String zipcode;//// ": "59590-4157",
  Geo geo;
  Address(this.city,this.street,this.suite,this.zipcode,this.geo);
  Address.fromJson(Map<String,dynamic> json):city=json['city'],
        street=json['street'],
        suite=json['suite'],
        zipcode=json['zipcode'],
        geo=Geo.fromJson(json['zipcode']);
}

class EmployeeBloc extends Bloc<EmployeeEvent, String> {
 // Geo geo=Geo('', '');
 // Company company=Company('', '', '');
  //Address address=Address('','','','',Geo('',''));
 // EmployeeModel employeeModel=EmployeeModel('name',0,'email', 'phone', 'profile_image', 'username', 'website');
 // Address initialProduct=Address('','','','',Geo('',''));
  EmployeeBloc() : super('') {
    on<EmployeeSyncPress>((event, emit) async {
      Dio dio=Dio();
      Response response= await dio.get('https://run.mocky.io/v3/d2f09150-6abe-485d-ad5e-477d480c7a71');
      try{
        List<dynamic> list=response.data;
        for(int i=0;i<list.length;++i){
          Map<String, dynamic> map=list[i];
          Employee employee=Employee.fromJson(map);
          await EmployeeDB.insertData(employee);
        }
      emit('Success');}
          catch(e){
        emit(e.toString());
          }
    },
    );
    /*on<EmployeeSyncPress>((event, emit) async{
      try{
      List<Employee> employeeList= await EmployeeDB.showAllData();
      emit(employeeList)
      }catch(){

      }
    },);*/
  }
}
