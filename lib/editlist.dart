import 'package:flutter/material.dart';

import 'db.dart';

class EditList extends StatefulWidget {
//  mylist({Key? key, required this.title}) : super(key: key);
//  final String title;

  @override
  _EditListState createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  final nameController = TextEditingController();
  final adressController = TextEditingController();
  final telController = TextEditingController();
  final emailController = TextEditingController();
  final gebController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit List'),
        ),
        body: SingleChildScrollView(
          child: Card(
            color: Colors.grey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: adressController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.home),
                    border: OutlineInputBorder(),
                    labelText: 'Adress',
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: telController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                    labelText: 'Telephone',
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: gebController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.language),
                    border: OutlineInputBorder(),
                    labelText: 'Birthdate',
                  ),
                ),
                SizedBox(height: 20),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    await DatabaseHelper.instance.add(
                      Personen(
                          name: nameController.text,
                          adress: adressController.text,
                          tel: telController.text,
                          email: emailController.text,
                          geb: gebController.text),
                    );
                    setState(
                      () {
                        nameController.clear();
                        adressController.clear();
                        telController.clear();
                        emailController.clear();
                        gebController.clear();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
