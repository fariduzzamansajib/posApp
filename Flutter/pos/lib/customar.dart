import 'package:flutter/material.dart';
import 'package:pos/main.dart';

class Customar extends StatefulWidget {
  const Customar({super.key});

  @override
  State<Customar> createState() => _CustomarState();
}

class _CustomarState extends State<Customar> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _address = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _id,
                    decoration: InputDecoration(
                      labelText: "Customar id",
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
                      labelText: "Customar Name",
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
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: _address,
                    decoration: InputDecoration(
                      labelText: "Customar Adress",
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
                
                ElevatedButton(
                  child: Text("Sign up"),
                  onPressed: () async {
                  },
                ),
              ],
            ),
          ),
        ),

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
