import 'package:blocplay2/data/db.dart';
import 'package:blocplay2/data/employee_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowEmployee extends StatelessWidget{
  String strPhone='';
  ShowEmployee({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          initialData: 'Default Value',
          future: EmployeeDB.showAllData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Employee> Employees=snapshot.data as List<Employee>;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: strPhone.length,
              scrollDirection: Axis.vertical,
              itemBuilder:(BuildContext context, int index){
                return SizedBox(
                  //height: 90,//width: 120,
                  child:
                  Card(
                    elevation: 0,
                    //color: Colors.teal[200]!,
                    //child:InkWell(onTap: (){},
                    child:
                    Padding(padding: const EdgeInsets.all(10),
                        child:
                        Row(children: [
                          Expanded(child: SelectableText(Employees[index].username.toString())),
                        ],)
                      //SelectableText(strPhone[index]),
                    ),
                  ),
                  //),
                );
              },
            );
              }
          else{
            return Text('Data fetch Error');
          }
          }
      ),
    );
  }

}