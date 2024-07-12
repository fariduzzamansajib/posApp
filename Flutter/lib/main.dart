import 'package:flutter/material.dart';
import 'package:pos/inventory.dart';
import 'package:pos/navbar.dart';
import 'package:pos/login.dart';
import 'package:pos/registration.dart';
import 'package:pos/showallemployee.dart';

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
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                "images/pos.png",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(22, 20, 0, 0),
                          child: ClipOval(
                            child: Container(
                              height: 85,
                              width: 85,
                              color: Colors.greenAccent,
                              child: Icon(Icons.search),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 5, 0, 0),
                          child: Text(
                            "Search",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
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
                              padding: EdgeInsets.fromLTRB(22, 20, 0, 0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Showall() ));

                                },
                                child: ClipOval(
                                  child: Container(
                                    height: 85,
                                    width: 85,
                                    color: Colors.greenAccent,
                                    child: Icon(Icons.people),

                                
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              child: GestureDetector(
                                child:  const Padding(
                                  padding: EdgeInsets.fromLTRB(22, 5, 0, 0),
                                  child: Text(
                                    "Employee",
                                    style: TextStyle(fontSize: 20),

                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Showall() ));
                                },

                                // onTap: (){
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //       builder: (context) => Showall(),
                                //       ),
                                //   );
                                // },

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
                              padding: EdgeInsets.fromLTRB(22, 20, 0, 0),
                              child: ClipOval(
                                child: Container(
                                  height: 85,
                                  width: 85,
                                  color: Colors.greenAccent,
                                  child: Icon(Icons.inventory),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 5, 0, 0),
                              child: Text(
                                "Inventory",
                                style: TextStyle(fontSize: 20),
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
            Row(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(22, 20, 0, 0),
                          child: ClipOval(
                            child: Container(
                              height: 85,
                              width: 85,
                              color: Colors.greenAccent,
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
                          child: Text(
                            "Add Product",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
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
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: ClipOval(
                                child: Container(
                                  height: 85,
                                  width: 85,
                                  color: Colors.greenAccent,
                                  child: Icon(Icons.bar_chart),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                              child: Text(
                                "Summary",
                                style: TextStyle(fontSize: 20),
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
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: ClipOval(
                                child: Container(
                                  height: 85,
                                  width: 85,
                                  color: Colors.greenAccent,
                                  child: Icon(Icons.arrow_right),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(22, 5, 0, 0),
                              child: Text(
                                "More",
                                style: TextStyle(fontSize: 20),
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
          ],
        ),
      ),

      // body: Column(
      //   children: [
      //     Container(
      //       height: 660,
      //       decoration: BoxDecoration(
      //         color: Colors.orange,
      //         borderRadius: BorderRadius.only(
      //           topRight: Radius.circular(90),
      //           bottomLeft: Radius.circular(90),
      //         ),
      //       ),
      //       child:
      //       Expanded(
      //         child: GridView.count(
      //           crossAxisCount: 2,
      //           padding: EdgeInsets.all(20.0),
      //           mainAxisSpacing: 10,
      //           crossAxisSpacing: 10,
      //           primary: false,
      //           children: <Widget>[
      //             Container(
      //               padding: EdgeInsets.all(8.0),
      //               child: SizedBox.fromSize(
      //                 size: Size(80, 80),
      //                 child: ClipOval(
      //                   child: Material(
      //                     color: Colors.green,
      //                     child: InkWell(
      //                         splashColor: Colors.lightGreenAccent,
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: <Widget>[
      //                             Icon(
      //                               Icons.search,
      //                               size: 50,
      //                             ),
      //                             Text(
      //                               "Seach Product",
      //                               style: TextStyle(fontSize: 20),
      //                             ),
      //                           ],
      //                         ),
      //                         onTap: () {
      //                           Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                               builder: (context) => Inventory(),
      //                             ),
      //                           );
      //                         }),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               padding: EdgeInsets.all(8.0),
      //               child: SizedBox.fromSize(
      //                 size: Size(80, 80),
      //                 child: ClipOval(
      //                   child: Material(
      //                     color: Colors.green,
      //                     child: InkWell(
      //                         splashColor: Colors.green,
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: <Widget>[
      //                             Icon(
      //                               Icons.list,
      //                               size: 50,
      //                             ),
      //                             Text(
      //                               "Inventory List",
      //                               style: TextStyle(fontSize: 20),
      //                             ),
      //                           ],
      //                         ),
      //                         onTap: () {
      //                           Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                               builder: (context) => Inventory(),
      //                             ),
      //                           );
      //                         }),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               padding: EdgeInsets.all(8.0),
      //               child: SizedBox.fromSize(
      //                 size: Size(80, 80),
      //                 child: ClipOval(
      //                   child: Material(
      //                     color: Colors.green,
      //                     child: InkWell(
      //                         splashColor: Colors.green,
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: <Widget>[
      //                             Icon(
      //                               Icons.monitor,
      //                               size: 50,
      //                             ),
      //                             Text(
      //                               " Summary",
      //                               style: TextStyle(fontSize: 20, ),
      //                             ),
      //                           ],
      //                         ),
      //                         onTap: () {
      //                           Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                               builder: (context) => Inventory(),
      //                             ),
      //                           );
      //                         }),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               padding: EdgeInsets.all(8.0),
      //               child: SizedBox.fromSize(
      //                 size: Size(80, 80),
      //                 child: ClipOval(
      //                   child: Material(
      //                     color: Colors.green,
      //                     child: InkWell(
      //                         splashColor: Colors.green,
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: <Widget>[
      //                             Icon(
      //                               Icons.people,
      //                               size: 50,
      //                             ),
      //                             Text(
      //                               "Employee",
      //                               style: TextStyle(fontSize: 20),
      //                             ),
      //                           ],
      //                         ),
      //                         onTap: () {
      //                           Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                               builder: (context) => Inventory(),
      //                             ),
      //                           );
      //                         }),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               padding: EdgeInsets.all(8.0),
      //               child: SizedBox.fromSize(
      //                 size: Size(80, 80),
      //                 child: ClipOval(
      //                   child: Material(
      //                     color: Colors.green,
      //                     child: InkWell(
      //                         splashColor: Colors.green,
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: <Widget>[
      //                             Icon(
      //                               Icons.inventory,
      //                               size: 50,
      //                             ),
      //                             Text(
      //                               "Add Inventory",
      //                               style: TextStyle(fontSize: 20),
      //                             ),
      //                           ],
      //                         ),
      //                         onTap: () {
      //                           Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                               builder: (context) => Inventory(),
      //                             ),
      //                           );
      //                         }),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               padding: EdgeInsets.all(8.0),
      //               child: SizedBox.fromSize(
      //                 size: Size(80, 80),
      //                 child: ClipOval(
      //                   child: Material(
      //                     color: Colors.green,
      //                     child: InkWell(
      //                         splashColor: Colors.green,
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: <Widget>[
      //                             Icon(
      //                               Icons.arrow_right,
      //                               size: 50,
      //                             ),
      //                             Text(
      //                               "More Details",
      //                               style: TextStyle(fontSize: 20),
      //                             ),
      //                           ],
      //                         ),
      //                         onTap: () {
      //                           Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                               builder: (context) => Inventory(),
      //                             ),
      //                           );
      //                         }),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Home',
        child: const Icon(Icons.home),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
