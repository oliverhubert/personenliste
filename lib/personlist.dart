import 'package:flutter/material.dart';

import 'db.dart';

class PersonList extends StatefulWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  int? selectedId;
  // final textController = TextEditingController();  update
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Person List"),
        ),
        body: Center(
          child: FutureBuilder<List<Personen>>(
            future: DatabaseHelper.instance.getPersonen(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Personen>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Daten werden geladen...'));
              }

              return snapshot.data!.isEmpty
                  ? Center(child: Text('Keine Daten vorhanden.'))
                  : ListView(
                      children: snapshot.data!.map((personen) {
                        if (selectedId == personen.id) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      color: Colors.grey,
                                      alignment: Alignment.center,
                                      child: Text('Details:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.black)),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      color: Colors.grey,
                                      alignment: Alignment.center,
                                      child: Text(personen.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.black)),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      color: Colors.grey,
                                      alignment: Alignment.center,
                                      child: Text(personen.geb,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.black)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      color: Colors.grey,
                                      alignment: Alignment.center,
                                      child: Text(personen.adress,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.black)),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      color: Colors.grey,
                                      alignment: Alignment.center,
                                      child: Text(personen.email,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.black)),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      color: Colors.grey,
                                      alignment: Alignment.center,
                                      child: Text(personen.tel,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.black)),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                tooltip: 'delete',
                                onPressed: () {
                                  setState(() {
                                    DatabaseHelper.instance
                                        .remove(personen.id!);
                                  });
                                },
                              ),
                            ],
                          );
                        } else
                          return Center(
                            child: Card(
                              color: selectedId == personen.id
                                  ? Colors.red
                                  : Colors.grey,
                              child: ListTile(
                                title: Text(personen.name),
                                subtitle: Text(personen.adress),
                                onTap: () {
                                  setState(() {
                                    selectedId = personen.id;
                                  });
                                  /*                         Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details()),
                                  );  */
                                },
                                onLongPress: () {
                                  setState(() {
                                    DatabaseHelper.instance
                                        .remove(personen.id!);
                                  });
                                },
                              ),
                            ),
                          );
                      }).toList(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
