import 'package:flutter/material.dart';
import 'package:pos/addproducts.dart';
import 'package:pos/addsproduct.dart';
import 'package:pos/customar.dart';
import 'package:pos/demo.dart';
import 'package:pos/inventory.dart';
import 'package:pos/lowstock.dart';
import 'package:pos/moreabout.dart';
import 'package:pos/navbar.dart';
import 'package:pos/login.dart';
import 'package:pos/registration.dart';
import 'package:pos/search.dart';
import 'package:pos/showallemployee.dart';
import 'package:pos/singin.dart';
import 'package:pos/summary.dart';

void main() {
  runApp(const Login());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text("Pos Management System"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "images/pos.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SearchProduct()));
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        height: 65,
                                        width: 65,
                                        color: Colors.greenAccent,
                                        child: Icon(Icons.search),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  child: GestureDetector(
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                                      child: Text(
                                        "Sales",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Showall()));
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        height: 65,
                                        width: 65,
                                        color: Colors.greenAccent,
                                        child: Icon(Icons.people),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  child: GestureDetector(
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text(
                                        "Employee",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Showinventory()));
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        height: 65,
                                        width: 65,
                                        color: Colors.greenAccent,
                                        child: Icon(Icons.inventory),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  child: GestureDetector(
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                      child: Text(
                                        "Inventory",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AddProductPage()));
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        height: 65,
                                        width: 65,
                                        color: Colors.greenAccent,
                                        child: Icon(Icons.people),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  child: GestureDetector(
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(12, 5, 0, 0),
                                      child: Text(
                                        "Purchase",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Lowstock()));
                                  },
                                  child: ClipOval(
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      color: Colors.greenAccent,
                                      child: Icon(Icons.inventory_2_rounded),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                child: GestureDetector(
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                                    child: Text(
                                      "Low Stock",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Summary()));
                                  },
                                  child: ClipOval(
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      color: Colors.greenAccent,
                                      child: Icon(Icons.bar_chart),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                child: GestureDetector(
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                    child: Text(
                                      "Summary",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Customar()));
                                  },
                                  child: ClipOval(
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      color: Colors.greenAccent,
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                child: GestureDetector(
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                    child: Text(
                                      "Customar",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MoreAbout()));
                                  },
                                  child: ClipOval(
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      color: Colors.greenAccent,
                                      child: Icon(Icons.arrow_right),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                child: GestureDetector(
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                    child: Text(
                                      "More",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: BottomNavigationBar(
                  backgroundColor: Colors.greenAccent,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',

                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
