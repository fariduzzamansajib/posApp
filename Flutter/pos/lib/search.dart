import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pos/db-class/product.dart';
import 'package:pos/main.dart';

List<Product> objectsFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
String objectsToJson(List<Product> data) =>
    json.encode(List<Product>.from(data).map((x) => x.toJson()));

class Searchid extends StatefulWidget {
  const Searchid({super.key});

  @override
  State<Searchid> createState() => _SearchidState();
}

class _SearchidState extends State<Searchid> {
  TextEditingController _id = TextEditingController();
  String searchid = "";
  late List<Product> _students = [];

  Future<List<Product>> showall() async {
    final response = await http.get(
      Uri.parse('http://192.168.0.110:8080/search'),
    );
    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void show() async {
    _students = await showall();
  }

  Future<List<Product>> showallbyid(String id) async {
    var response;

    if (id.length == 0) {
      response = await http.get(
        Uri.parse('http://192.168.0.111:8080/product'),
      );
    } else {
      response = await http.get(
        Uri.parse('http://192.168.0.111:8080/search/' + id),
      );
    }

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void showbyid() async {
    _students = await showallbyid(_id.text);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search By Id"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Form(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _id,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter id';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'id',
                          //hintText: 'Enter id',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_id.text.length == 0) {
                            showall();
                          } else {
                            searchid = _id.text;
                          }
                          showbyid();

                          setState(() {});
                        },
                        child: Text("Search", style: TextStyle(fontSize: 30),),
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder<List<Product>>(
              future: showallbyid(_id.text),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(snapshot.data![index].id.toString(),style: TextStyle(fontSize: 30)),
                        title: Text(snapshot.data![index].name.toString(),style: TextStyle(fontSize: 30),),
                        trailing: Text(snapshot.data![index].stock.toString(),style: TextStyle(fontSize: 30),),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else {
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
