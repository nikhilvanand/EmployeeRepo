import 'package:blocplay2/bloc/employee_bloc.dart';
import 'package:blocplay2/layout/fetch_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocplay2/data/db.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>EmployeeBloc(),
    child: _HomeView(),);
  }
}
class _HomeView extends StatelessWidget{
  const _HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Employee Records'),),
     body: Center(
     child:Column(
       mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,
         children:[
           BlocBuilder<EmployeeBloc, String>(builder: (context, count){
             return Text(count);
           }),
          /* ElevatedButton(onPressed: (){
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => ShowEmployee()),
             );
           }*/
               //, child: Text('Show Employees'))
     ],
     ),
     ),
     floatingActionButton:FloatingActionButton(onPressed: (){
           context.read<EmployeeBloc>().add(EmployeeSyncPress());
         },child: const Icon(Icons.sync),
         ),
   );
  }
}
///////////////////////////////////////////////////////////////////////
