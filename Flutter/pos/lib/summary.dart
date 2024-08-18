import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pos/db-class/transection.dart';
import 'package:pos/main.dart';


List<Transection> objectsFromJson(String str)=>List<Transection>.from(json.decode(str).map((x)=> Transection.fromJson(x)));
String objectsToJson(List<Transection> data)=>json.encode(List<Transection>.from(data).map((x)=>x.toJson()));



main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home:Summary(),
  ),
  );
}


class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _ShowallState();
}

class _ShowallState extends State<Summary> {

  late List<Transection> _transection=[];
  Future<List<Transection>> showalltransection() async {
    final response=await http.get(
      Uri.parse('http://192.168.0.111:8080/showalltransection'),

    );
    if(response.statusCode==200){
      return objectsFromJson(response.body);
    }else{
      throw Exception("Failed");
    }
  }

  @override
  void initState() {
    showalltransection();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('All Transection'),
      ),
      body: ListView(
        children: [
          SizedBox(

            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:  Container(
                height: 400,
                width: 100,
                child: FutureBuilder<List<Transection>>(
                  future: showalltransection(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Transection> transection = snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(

                            columns: [
                              DataColumn(label: Text('Payment Type')),
                              DataColumn(label: Text('Gross Sales')),
                              DataColumn(label: Text('Discount')),
                            ],
                            rows: transection.map((employee) {
                              return DataRow(cells: [
                                DataCell(Text(employee.paymentType.toString())),
                                DataCell(Text(employee.grossSales.toString())),
                                DataCell(Text(employee.discount.toString())),
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
