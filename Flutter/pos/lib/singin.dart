import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pos/db-class/employee.dart';
import 'package:pos/main.dart';

List<Employee> objectsFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));
objectsToJson(List<Employee> data) =>
    json.encode(List<Employee>.from(data.map((x) => x.toJson())));

class Singin extends StatefulWidget {
  const Singin({super.key});

  @override
  State<Singin> createState() => _LoginState();
}

class _LoginState extends State<Singin> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future<Employee> singinemployee() async {
    Employee s = Employee(
        id: 0,
        name: "",
        phone: "",
        email: _email.text,
        password: _password.text,
        role: "");
    final response = await http.post(
        Uri.parse('http://192.168.0.111:8080/singinAdmin'),
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.greenAccent,
              child: Center(
                child: Text(
                  "Login Page",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter Your Email",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular((10)))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: TextField(
                            controller: _password,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter Your Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    (10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        ElevatedButton(
                          onPressed: () async {
                            Employee s = await singinemployee();

                            if (s != null &&
                                (s.email == _email.text) &&
                                (s.password == _password.text)) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            } else {
                              SnackBar snk = SnackBar(
                                  content: Text("Enter Correct information"));
                              ScaffoldMessenger.of(context).showSnackBar(snk);
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            fixedSize: Size(120, 34),
                          ),
                        ),

                        // ElevatedButton(
                        //   child: Text("Login", style: TextStyle(color: Colors.black, fontSize: 18),),
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.greenAccent),
                        //
                        //   onPressed: () async {
                        //
                        //     Employee s = await singinemployee();
                        //
                        //     if (s != null &&
                        //         (s.email == _email.text) &&
                        //         (s.password == _password.text)) {
                        //       Navigator.push(context,
                        //           MaterialPageRoute(builder: (context) => MyApp()));
                        //     } else {
                        //       SnackBar snk =
                        //       SnackBar(content: Text("Enter Correct information"));
                        //       ScaffoldMessenger.of(context).showSnackBar(snk);
                        //     }
                        //   },
                        //
                        // ),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(60, 10, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  "You have no account?",
                                  style: TextStyle(fontSize: 16),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyApp(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Create an account",
                                      style: TextStyle(fontSize: 16),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
