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
     appBar: AppBar(
       title: const Text('Employee Records'),
       actions: [
         // Navigate to the Search Screen
         IconButton(
             onPressed: () => Navigator.of(context)
                 .push(MaterialPageRoute(builder: (_) => SearchPage())),
             icon: const Icon(Icons.search))
       ],
     ),
     body:Center(child:
       BlocBuilder<EmployeeBloc, List<dynamic>>(builder: (context, list){
       if(list.isEmpty){
         return Text('Data Not Synched!');
       }else{
             return ListView.builder(
                 scrollDirection: Axis.vertical,
                 itemCount: list.length,
                 //physics: const NeverScrollableScrollPhysics(),
                 itemBuilder: (BuildContext context, int index)
             {
               return Card(
                 child:Padding(padding:const EdgeInsets.all(10),
                     child:Row(children: [
                       Image.network(list[index]['profile_image'].toString(),
                         errorBuilder: (BuildContext buildContext, Object object,StackTrace? stackTrace){
                         return Image.asset('Assets/blank.jpg');
                       },),
                       Expanded(
                         //width: double.infinity,
                         child:Padding(padding: const EdgeInsets.all(20),
                           child:Text(list[index]['name'].toString()),
                         ),
                       ),
                       //Text(list[index]['profile_image'].toString()),
                     ],),
                 ),
               );
             });
       }
           }),
         ),

     floatingActionButton:Column(
       mainAxisAlignment: MainAxisAlignment.end,
         crossAxisAlignment: CrossAxisAlignment.center,
         children:[
       FloatingActionButton(onPressed: (){
           context.read<EmployeeBloc>().add(EmployeeSyncPress());
         },child: const Icon(Icons.sync),
         ),
    ]
   ));
  }
}
/////////////////////////////////////////////////////
class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>EmployeeBloc(),
      child: SearchView(),);
  }
}
class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  TextEditingController editingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        context.read<EmployeeBloc>().add(EmployeeSearchPress(name: editingController.text));
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
                controller: editingController,
              ),
            ),
          )),
      body: Center(child:
      BlocBuilder<EmployeeBloc, List<dynamic>>(builder: (context, list){
        if(list.isEmpty){
          return Text('Data Not Synched!');
        }else{
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              //physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index)
              {
                return Card(
                  child:Padding(padding:const EdgeInsets.all(10),
                    child:Row(children: [
                      Image.network(list[index]['profile_image'].toString(),
                        errorBuilder: (BuildContext buildContext, Object object,StackTrace? stackTrace){
                          return Image.asset('Assets/blank.jpg');
                        },),
                      Expanded(
                        //width: double.infinity,
                        child:Padding(padding: const EdgeInsets.all(20),
                          child:Text(list[index]['name'].toString()),
                        ),
                      ),
                      //Text(list[index]['profile_image'].toString()),
                    ],),
                  ),
                );
              });
        }
      }),
      ),
    );
  }
}
