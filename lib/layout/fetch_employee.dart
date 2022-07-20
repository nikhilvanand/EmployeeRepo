import 'package:cached_network_image/cached_network_image.dart';
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
  const DetailView(this.employee);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(employee['name'].toString()),),

        body:SingleChildScrollView(child:Padding(padding: const EdgeInsets.all(20),
            child:Column(children:[
          ClipRRect(borderRadius: BorderRadius.circular(20),
            child:Image(image: CachedNetworkImageProvider(employee['profile_image'].toString(),),
              errorBuilder: (BuildContext buildContext, Object object,StackTrace? stackTrace){
                return ClipRRect(borderRadius: BorderRadius.circular(20),
                    child:Image.asset('Assets/blank.jpg',height: 150,));
              },height: 150,
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
                      color: Colors.purple[50],
                    child:Padding(padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //runSpacing: 10,
                      children:[
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(2),
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(child: Text('Phone',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),),
                                TableCell(child: Text('${employee['phone']??''}',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),)
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(child: Text('Email',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),),
                                TableCell(child: Text('${employee['email']}',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),)
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(child: Text('Username',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),),
                                TableCell(child: Text('${employee['username']}',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),)
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(child: Text('Website',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),),
                                TableCell(child: Text('${employee['website']}',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),)
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(child: Text('Address',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),),
                                TableCell(child: Text('',
                                  style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800),),)
                              ],
                            ),
                            TableRow(
                              children: [
                                const TableCell(child: Text('Suite')),
                                TableCell(child: Text('${employee['address']['suite']}'),),
                              ],
                            ),
                            TableRow(
                              children: [
                                const TableCell(child: Text('Street')),
                                TableCell(child: Text('${employee['address']['street']}'),),
                              ],
                            ),
                            TableRow(
                              children: [
                                const TableCell(child: Text('City')),
                                TableCell(child: Text('${employee['address']['city']}'),),
                              ],
                            ),
                            TableRow(
                                children: [
                                  const TableCell(child:
                                    Text('Geo')),
                                  TableCell(child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                      if(employee['address']['geo']!=null)
                                    Text(employee['address']['geo']['lat']+','+employee['address']['geo']['lng']),
                                  ]
                                ),)
                                ],
                              ),
                            TableRow(
                              children: [
                                TableCell(child:
                                Text('Company',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w800))),
                                TableCell(
                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                      if(employee['company']!=null)
                                    Text(employee['company']['name']),
                                     if(employee['company']!=null)
                                    Text(employee['company']['catchPhrase']),
                                     if(employee['company']!=null)
                                    Text(employee['company']['bs']),
                                  ]
                                ),
                                )
                              ],
                            ),
                          ],
                        ),
                    ],
                    ),),
                    ),
                  ),
        ]
        ))
    ));
  }
}