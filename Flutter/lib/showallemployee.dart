import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pos/db-class/employee.dart';
import 'package:pos/main.dart';


List<Employee> objectsFromJson(String str)=>List<Employee>.from(json.decode(str).map((x)=> Employee.fromJson(x)));
String objectsToJson(List<Employee> data)=>json.encode(List<Employee>.from(data).map((x)=>x.toJson()));



main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Showall() ,
  ),
  );
}

class Showall extends StatefulWidget {
  const Showall({super.key});

  @override
  State<Showall> createState() => _ShowallState();
}

class _ShowallState extends State<Showall> {

  late List<Employee> _students=[];
  Future<List<Employee>> showall() async {
    final response=await http.get(
      Uri.parse('http://192.168.0.110:8080/showallemployee'),

    );
    if(response.statusCode==200){
      return objectsFromJson(response.body);
    }else{
      throw Exception("Failed");
    }
  }

  @override
  void initState() {
    showall();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 400,
            child: FutureBuilder<List<Employee>>(
              future:showall(),
              builder:(context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount:snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Container(
                        child: DataTable(
                            columns: [
                              DataColumn(
                                label: Text('ID'),
                              ),
                              DataColumn(
                                label: Text('Name'),
                              ),
                              DataColumn(
                                label: Text('Email Address'),
                              ),
                              DataColumn(
                                label: Text('Employee Role'),
                              ),
                            ],
                            rows: [

                              DataRow(cells: [
                                DataCell(Text(snapshot.data![index].id.toString())),
                                DataCell(Text(snapshot.data![index].name.toString())),
                                DataCell(Text(snapshot.data![index].email.toString())),
                                DataCell(Text(snapshot.data![index].role.toString())),
                              ])
                            ]),
                      );
                      // return ListTile(
                      //   title: Text(snapshot.data![index].id.toString()),
                      //   leading: Text(snapshot.data![index].name.toString()),
                      // );
                    },
                  );
                }else if(snapshot.hasError){
                  return Text("Error");
                }else{
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyApp(),
            ),
          );
        },
        tooltip: 'Back',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
