import 'package:blocplay2/data/employee_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/employee_bloc.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> employee;

  const DetailPage(this.employee);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => EmployeeBloc(),
      child: DetailView(employee),);
  }
}
class DetailView extends StatelessWidget{
  final Map<String, dynamic> employee;
  DetailView(this.employee);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(employee['name'].toString()),),

        body:SingleChildScrollView(child:Padding(padding: EdgeInsets.all(20),
            child:Column(children:[
          ClipRRect(borderRadius: BorderRadius.circular(20),child:Image.network(employee['profile_image'].toString(),
            errorBuilder: (BuildContext buildContext, Object object,StackTrace? stackTrace){
              return ClipRRect(borderRadius: BorderRadius.circular(20),child:Image.asset('Assets/blank.jpg',));
            },
          ),
          ),
              Text(employee['name'].toString(),
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800,
                   // fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans',
                    fontSize: 20),
              ),
              Padding(padding: const EdgeInsets.only(left: 5,right: 5),
                  child:
                    Card(
                    child:Padding(padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //runSpacing: 10,
                      children:[
                    Text('Email         :${employee['email']}',
                    style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),
                      Text('Phone       :${employee['phone']}', style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800,),),
                      Text('Username  :${employee['username']}', style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800,),),
                      Text('Website   :${employee['website']}', style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800,),),
                        Text('Address',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800,),),
                        Text('Suite     :${employee['address']['suite']}'),
                        Text('Street    :${employee['address']['street']}'),
                        Text('City    :${employee['address']['city']}'),
                        if(employee['address']['geo']!=null)
                        Text('Latitude    :${employee['address']['geo']['lat']}'),
                        if(employee['address']['geo']!=null)
                        Text('Longitude    :${employee['address']['geo']['lng']}'),
                        Text('Company Details',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800,),),
                        if(employee['company']!=null)
                        Text('Name     :${employee['company']['name']}',),
                        if(employee['company']!=null)
                        Text('CatchPhrase     :${employee['company']['catchPhrase']}',),
                        if(employee['company']!=null)
                        Text('BS     :${employee['company']['bs']}',),
                    ],
                    ),),
                    ),
                  ),
        ]
        ))
    ));
  }
}