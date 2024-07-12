import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pos/db-class/product.dart';
import 'package:pos/main.dart';


List<Product> objectsFromJson(String str)=>List<Product>.from(json.decode(str).map((x)=> Product.fromJson(x)));
String objectsToJson(List<Product> data)=>json.encode(List<Product>.from(data).map((x)=>x.toJson()));



main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Showinventory() ,
  ),
  );
}

class Showinventory extends StatefulWidget {
  const Showinventory({super.key});

  @override
  State<Showinventory> createState() => _Showinventory();
}

class _Showinventory extends State<Showinventory> {

  late List<Product> _students=[];
  Future<List<Product>> showinventory() async {
    final response=await http.get(
      Uri.parse('http://192.168.0.110:8080/showallproduct'),

    );
    if(response.statusCode==200){
      return objectsFromJson(response.body);
    }else{
      throw Exception("Failed");
    }
  }

  @override
  void initState() {
    showinventory();
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
            child: FutureBuilder<List<Product>>(
              future:showinventory(),
              builder:(context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount:snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Container(
                        child: DataTable(
                            columns: [
                              DataColumn(
                                label: Text('Barcode'),
                              ),
                              DataColumn(
                                label: Text('P_Name'),
                              ),
                              DataColumn(
                                label: Text('S_Rate'),
                              ),
                              DataColumn(
                                label: Text('Stock'),
                              ),
                            ],
                            rows: [

                              DataRow(cells: [
                                DataCell(Text(snapshot.data![index].barcode.toString())),
                                DataCell(Text(snapshot.data![index].name.toString())),
                                DataCell(Text(snapshot.data![index].sales_rate.toString())),
                                DataCell(Text(snapshot.data![index].stock.toString())),
                              ])
                            ]),
                      );
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
