import 'package:flutter/material.dart';
import 'package:pos/login.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String? dd = "select your role";
  TextEditingController e_name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextField(
                  controller: e_name,
                  decoration: InputDecoration(
                    labelText: "Employee Name",
                    hintText: "Employee Name",
                    icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular((10)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    hintText: "Phone",
                    icon: Icon(Icons.phone),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    icon: Icon(Icons.email),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    icon: Icon(Icons.password),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(65, 15, 30, 0),
                child: Row(
                  children: [
                    DropdownButton(
                        value: dd,
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                              child: Text(
                                "Select your role",
                              ),
                              value: "select your role"),
                          DropdownMenuItem<String>(
                              child: Text(
                                "Owner",
                              ),
                              value: "owner"),
                          DropdownMenuItem<String>(
                              child: Text(
                                "Administrator",
                              ),
                              value: "administrator"),
                          DropdownMenuItem<String>(
                              child: Text(
                                "Manager",
                              ),
                              value: "manager"),
                          DropdownMenuItem<String>(
                              child: Text(
                                "Cahier",
                              ),
                              value: "cahier"),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            dd = value;
                            SnackBar s = SnackBar(content: Text(dd.toString()));
                            ScaffoldMessenger.of(context).showSnackBar(s);
                          });
                        }),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Registration",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        },
        tooltip: 'Back',
        child: const Icon(Icons.arrow_back),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
