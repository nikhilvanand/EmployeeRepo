import 'package:blocplay2/bloc/employee_bloc.dart';
import 'package:blocplay2/layout/fetch_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner:false ,
    );
  }
}
class MyHomePage extends StatelessWidget{
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>EmployeeBloc(),
    child: const _HomeView(),);
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
                 .push(MaterialPageRoute(builder: (_) => const SearchPage())),
             icon: const Icon(Icons.search))
       ],
     ),
     body:Center(child:
       BlocBuilder<EmployeeBloc, List<dynamic>>(builder: (context, list) {
         if (list.isEmpty) {
           /*return ElevatedButton(onPressed: (){
           context.read<EmployeeBloc>().add(EmployeeSyncPress());
         }, child: Text('Show Employees'));*/
           context.read<EmployeeBloc>().add(EmployeeSyncPress());
           return const Text('');
         } else {
           return ListView.builder(
               scrollDirection: Axis.vertical,
               itemCount: list.length,
               //physics: const NeverScrollableScrollPhysics(),
               itemBuilder: (BuildContext context, int index) {
                 return Padding(padding: const EdgeInsets.only(left: 10,right: 10),
                 child:InkWell(
                   child:Card(
                     color: Colors.purple[50],
                     child:Padding(
                     padding: const EdgeInsets.all(10),
                     child:Row(
                     children: [
                       ClipRRect(borderRadius: BorderRadius.circular(10),
                         child:Image(image: CachedNetworkImageProvider(list[index]['profile_image'].toString(),),
                         errorBuilder: (BuildContext buildContext, Object object,StackTrace? stackTrace){
                           return ClipRRect(borderRadius: BorderRadius.circular(10),
                               child:Image.asset('Assets/blank.jpg',height: 80,));
                         },height: 80,
                       ),
                       ),
                       Expanded(
                         child:Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                           child:Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:[
                            Text(list[index]['name'].toString(),style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800,),),
                                 if(list[index]['company']!=null)
                                   Text('${list[index]['company']['name']}',),
                          ]
                         ),
                       ),
                      ),
                    ],
                     ),),
                   ),
                   onTap: (){
                     Map<String,dynamic> map=list[index];
                     Navigator.of(context)
                         .push(MaterialPageRoute(builder: (_) => DetailPage(map)));
                   },
                 ),
                 );
               }
           );
         }
       })
         ),

     /*floatingActionButton:Column(
       mainAxisAlignment: MainAxisAlignment.end,
         crossAxisAlignment: CrossAxisAlignment.center,
         children:[
       FloatingActionButton(onPressed: (){
           context.read<EmployeeBloc>().add(EmployeeSyncPress());
         },child: const Icon(Icons.sync),
         ),
    ]
   )*/
   );
  }
}
/////////////////////////////////////////////////////
class SearchPage extends StatelessWidget{
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>EmployeeBloc(),
      child: SearchView(),);
  }
}
class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final TextEditingController editingController=TextEditingController();
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
                    //prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
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
          return const Text('Nothing Found!');
        }else{
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              //physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index)
              {
                return Padding(padding: const EdgeInsets.only(left: 10,right: 10),
                  child:InkWell(
                    child:Card(
                      color: Colors.purple[50],
                      child:Padding(
                        padding: const EdgeInsets.all(10),
                        child:Row(
                          children: [
                            ClipRRect(borderRadius: BorderRadius.circular(10),
                              child:Image(image: CachedNetworkImageProvider(list[index]['profile_image'].toString(),),
                                errorBuilder: (BuildContext buildContext, Object object,StackTrace? stackTrace){
                                  return ClipRRect(borderRadius: BorderRadius.circular(10),
                                      child:Image.asset('Assets/blank.jpg',height: 40,));
                                },height: 40,
                              ),
                            ),
                            Expanded(
                              child:Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                                child:Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text(list[index]['name'].toString(),style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800,),),
                                      if(list[index]['company']!=null)
                                        Text('${list[index]['company']['name']}',),
                                    ]
                                ),
                              ),
                            ),
                          ],
                        ),),
                    ),
                    onTap: (){
                      Map<String,dynamic> map=list[index];
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => DetailPage(map)));
                    },
                  ),
                );
              }
              );
        }
      }),
      ),
    );
  }
}
