import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:meta/meta.dart';

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
          options: buildCacheOptions(const Duration(days: 100)),);
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
          options: buildCacheOptions(const Duration(days: 100)),);
        try {
          List<dynamic> list = response.data;
          List<dynamic> searchList = list.where((i) =>
          i['name'].toString().toLowerCase().contains(event.name)).toList();
          emit(searchList);
        } catch (e) {
          emit([]);
        }
      },);
  }
}
