import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pos/db-class/employee.dart';
import 'package:pos/login.dart';

List<Employee> objectsFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));
objectsToJson(List<Employee> data) =>
    json.encode(List<Employee>.from(data.map((x) => x.toJson())));

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  String? dd = "manager";

  Future<Employee> signupEmployee() async {
    Employee s = Employee(
      id: int.parse(_id.text),
      name: _name.text,
      phone: _phone.text,
      email: _email.text,
      password: _password.text,
      role: dd,
    );
    final response = await http.post(
        Uri.parse('http://192.168.0.110:8080/insert'),
        body: jsonEncode(s.toJson()),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _id,
                  decoration: InputDecoration(
                    labelText: "id",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _phone,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: "email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(5),
              //   child: TextFormField(
              //     controller: _role,
              //     decoration: InputDecoration(
              //       labelText: "role",
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5),
              //       ),
              //     ),
              //   ),
              // ),

              Row(
                children: [
                  DropdownButton(
                      value: dd,
                      items: <DropdownMenuItem<String>>[

                        DropdownMenuItem<String>(
                          child: Text("Manager"),
                          value: "manager",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("Admin"),
                          value: "admin",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("Cashier"),
                          value: "cashier",
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          dd = value;
                          //SnackBar s = SnackBar(content: Text(dd.toString()));

                          //ScaffoldMessenger.of(context).showSnackBar(s);
                        });
                      }),
                ],
              ),
              ElevatedButton(
                child: Text("Sign up"),
                onPressed: () async {
                  Employee st = await signupEmployee();
                  if (st != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  } else if (_id.text.length == 0) {
                    SnackBar snk =
                        SnackBar(content: Text("Enter Correct Information"));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
