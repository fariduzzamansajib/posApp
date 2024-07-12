import 'package:flutter/material.dart';
import 'package:pos/login.dart';
import 'package:pos/main.dart';

class Addproducts extends StatelessWidget {
  const Addproducts({super.key});

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

  String? dd = "Category";
  TextEditingController id = TextEditingController();
  TextEditingController barcode = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

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
                  controller: id,
                  decoration: InputDecoration(
                    labelText: "Product Id",
                    hintText: "Product Id",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular((10)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: TextField(
                  controller: barcode,
                  decoration: InputDecoration(
                    labelText: "Barcode",
                    hintText: "Barcode",
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
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    hintText: "Product Name",
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
                  controller: description,
                  decoration: InputDecoration(
                    labelText: "Description",
                    hintText: "Description",
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
                      borderRadius: BorderRadius.circular(10),
                        value: dd,
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                              child: Text(
                                "Category",
                              ),
                              value: "Category"),
                          DropdownMenuItem<String>(
                              child: Text(
                                "Food",
                              ),
                              value: "food"),
                          DropdownMenuItem<String>(
                              child: Text(
                                "Fruit",
                              ),
                              value: "fruit"),
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
                        "Add Products",
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
              builder: (context) => MyApp(),
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




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   int sum =0;
//
//   String? g = "";
//   String? dd = "web";
//
//   TextEditingController t1 = TextEditingController();
//   TextEditingController t2 = TextEditingController();
//   TextEditingController t3 = TextEditingController();
//
//   void _incrementCounter() {
//     setState(() {
//
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//       ),
//       body: Center(
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(20.0),
//               child: TextField(
//                 controller: t1,
//                 decoration: InputDecoration(
//                   labelText: "1st Number",
//                   hintText: "Input Number",
//                   icon: Icon(Icons.edit_square),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextField(
//                 // obscureText: true,
//                 controller: t2,
//                 decoration: InputDecoration(
//                   labelText: "2nd Number",
//                   hintText: "Input Number",
//                   icon: Icon(Icons.lock),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                 ),
//               ),
//             ),
//
//
//             SizedBox(
//               height: 10,
//             ),
//
//             ElevatedButton(
//               onPressed: () {
//                 int x = int.parse(t1.text);
//                 int y = int.parse(t2.text);
//                 if (dd== 'web') {
//                   sum = x + y;
//                 }else if(dd== 'image'){
//
//                   sum = x - y;
//                 }
//
//                 // t3.text= t1.text+t2.text;
//                 t3.text = sum.toString();
//
//                 SnackBar s = SnackBar(
//                   content: Text(sum.toString()),
//                 );
//                 ScaffoldMessenger.of(context).showSnackBar(s);
//                 setState(() {
//
//                 });
//               },
//               child: Container(
//                 child: Text(
//                   'Submit',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//                 padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
//                 decoration: BoxDecoration(),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blueAccent,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Text("Result: "+ sum.toString()),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//
//             Row(
//               children: [
//                 DropdownButton(
//                     value: dd,
//                     items: <DropdownMenuItem<String>>[
//                       DropdownMenuItem<String>(
//                         child: Text("Web"),
//                         value: "web",
//                       ),
//                       DropdownMenuItem<String>(
//                         child: Text("Image"),
//                         value: "image",
//                       ),
//                       DropdownMenuItem<String>(
//                         child: Text("News"),
//                         value: "news",
//                       ),
//                       DropdownMenuItem<String>(
//                         child: Text("Shopping"),
//                         value: "shopping",
//                       ),
//                     ],
//                     onChanged: (String? value) {
//                       setState(() {
//                         dd = value;
//                         SnackBar s = SnackBar(content: Text(dd.toString()));
//
//                         ScaffoldMessenger.of(context).showSnackBar(s);
//                       });
//                     }),
//               ],
//             ),
//
//             // ...Dropdwon End.......
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
