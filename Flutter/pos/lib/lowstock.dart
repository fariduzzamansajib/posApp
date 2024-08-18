import 'package:flutter/material.dart';

class Lowstock extends StatefulWidget {
  const Lowstock({super.key});

  @override
  State<Lowstock> createState() => _LowstockState();
}

class _LowstockState extends State<Lowstock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [



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
    );
  }
}
