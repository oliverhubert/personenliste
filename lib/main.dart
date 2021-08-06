import 'package:flutter/material.dart';

import 'personlist.dart';
import 'editlist.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  title: 'Liste',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _items = [
    EditList(),
    PersonList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_file_rename_outline_sharp),
            label: 'Edit List',
            //        backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_present_sharp),
            label: 'Person List',
            //        backgroundColor: Colors.yellow,
          ),
        ],
      ),
      body: _items[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
