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
        body: Card(
          color: Colors.grey,
          child: Row(
            children: <Widget>[
              Flexible(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                    TextFormField(
                      controller: adressController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.home),
                        border: OutlineInputBorder(),
                        labelText: 'Adress',
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      controller: telController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                        labelText: 'Telephone',
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    TextFormField(
                      controller: gebController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.language),
                        border: OutlineInputBorder(),
                        labelText: 'Birthdate',
                      ),
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
