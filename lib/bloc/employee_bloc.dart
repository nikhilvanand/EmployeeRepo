import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocplay2/data/db.dart';
import 'package:blocplay2/data/employee_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, List<dynamic>> {
  EmployeeBloc() : super(EmployeeState.initial()) {
      on<EmployeeSyncPress>((event, emit) async {
        Dio dio = Dio();
        dio.interceptors.add(
            DioCacheManager(CacheConfig(baseUrl: "https://run.mocky.io"))
                .interceptor);
        Response response = await dio.get(
          'https://run.mocky.io/v3/d2f09150-6abe-485d-ad5e-477d480c7a71',
          options: buildCacheOptions(const Duration(days: 7)),);
        try {
          List<dynamic> list = response.data;
          emit(list);
        } catch (e) {
          emit([]);
        }
      },
      );
      on<EmployeeSearchPress>((event, emit) async {
        Dio dio = Dio();
        dio.interceptors.add(
            DioCacheManager(CacheConfig(baseUrl: "https://run.mocky.io"))
                .interceptor);
        Response response = await dio.get(
          'https://run.mocky.io/v3/d2f09150-6abe-485d-ad5e-477d480c7a71',
          options: buildCacheOptions(const Duration(days: 7)),);
        try {
          List<dynamic> list = response.data;
          List<dynamic> searchList = list.where((i) =>
              i['name'].toString().toLowerCase().contains(event.name)).toList();
          emit(searchList);
        } catch (e) {
          emit([]);
        }
      },);
      on<EmployeeDetailPress>((event, emit) async {
        try {
          List<dynamic> list = event.map;
          List<dynamic> mapper=list[0];
          String street= mapper[0]['street'];
          list[0]['address']=street;
          emit(list);
        } catch (e) {
          emit([]);
        }
      },);

  }
}
