import 'package:flutter/material.dart';
import 'package:pos/main.dart';

class MoreAbout extends StatefulWidget {
  const MoreAbout({super.key});

  @override
  State<MoreAbout> createState() => _MoreAboutState();
}

class _MoreAboutState extends State<MoreAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Center(
            child: Column(
              children: [
                Text("App Name: Pos App",style: TextStyle(fontSize: 30,color: Colors.black),),
                Text("Company: Fs it ltd.",style: TextStyle(fontSize: 30,color: Colors.black),),
                Text("Version: 1.0",style: TextStyle(fontSize: 30,color: Colors.black),),
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
