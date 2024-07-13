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
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home:Showall(),
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
      Uri.parse('http://192.168.0.75:8080/showallemployee'),

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
    appBar: AppBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('All Employees'),
    ),
      body: ListView(
        children: [
          SizedBox(

            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:  Container(
                height: 400,
                width: 100,
                child: FutureBuilder<List<Employee>>(
                  future: showall(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Employee> employees = snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(

                            columns: [
                              DataColumn(label: Text('Name')),
                              DataColumn(label: Text('Email')),
                              DataColumn(label: Text('Role')),
                            ],
                            rows: employees.map((employee) {
                              return DataRow(cells: [
                                DataCell(Text(employee.name.toString())),
                                DataCell(Text(employee.email.toString())),
                                DataCell(Text(employee.role.toString())),
                              ]);
                            }).toList(),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error");
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
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
