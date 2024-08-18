import 'package:flutter/material.dart';
import 'package:pos/db-class/product.dart';
import 'package:pos/db-class/profile.dart';
import 'package:pos/main.dart';
import 'package:pos/navbar.dart';

class Cardview extends StatelessWidget {
  const Cardview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card View',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key});

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {

  List<Profile> stList = [
    Profile("Sajib", "Owner", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJI70GOV94uadGHnBqfK7ytybiFZjsLDYA3Q&s"),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Profile View"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: stList.length,
        itemBuilder: (BuildContext context, int index){
          return Center(
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.amber[100],
              child: SizedBox(
                width: 300,
                height: 500,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(stList[index].name.toString()),
                      ),
                      SizedBox(height: 10,),

                      Text(stList[index].name.toString(),style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                      SizedBox(height: 10,),

                      Text(stList[index].details.toString(),style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),

                      SizedBox(height: 20,),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Back To Home"),

                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyApp(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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