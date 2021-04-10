import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/welcome.dart';

class MyHomePage extends StatefulWidget {
  final String documentId;

  const MyHomePage({Key key, this.documentId}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "HABIT TRACKER",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
        )),
        backgroundColor: Colors.yellowAccent[700],
        actions: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((res) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()),
                        (Route<dynamic> route) => false);
                  });
                },
              )),
        ],
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: HabitList(),
      )),
      // ADD (Create)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 16,
                  contentPadding: EdgeInsets.all(20),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Text(
                        "Add Habit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Title: ",
                          style: TextStyle(),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextField(
                        controller: titleController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("description: "),
                      ),
                      TextField(
                        controller: descriptionController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Undo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    //Add Button

                    // ignore: deprecated_member_use
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        color: Colors.yellowAccent,
                        onPressed: () {
                          Map<String, dynamic> newHabit =
                              new Map<String, dynamic>();
                          newHabit["title"] = titleController.text;
                          newHabit["description"] = descriptionController.text;
                          newHabit['date'] = DateTime.now();

                          FirebaseFirestore.instance
                              .collection("Habits")
                              .doc(FirebaseAuth.instance.currentUser.uid)
                              .collection('Habits')
                              .add(newHabit)
                              .whenComplete(() {
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "save",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                );
              });
        },
        tooltip: 'Add Habit',
        backgroundColor: Colors.yellowAccent[700],
        child: Icon(
          Icons.add_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HabitList extends StatelessWidget {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Habits")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('Habits')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            return new ListView(
              padding: EdgeInsets.only(bottom: 80),
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Edit Habits"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Title: ",
                                      textAlign: TextAlign.start,
                                    ),
                                    TextField(
                                      controller: titleController,
                                      decoration: InputDecoration(
                                        hintText: document['title'],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("description: "),
                                    ),
                                    TextField(
                                      controller: descriptionController,
                                      decoration: InputDecoration(
                                        hintText: document['description'],
                                      ),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: RaisedButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Undo",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  // Update Button

                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                        color: Colors.yellowAccent,
                                        onPressed: () {
                                          Map<String, dynamic> updateHabit =
                                              new Map<String, dynamic>();
                                          updateHabit["title"] =
                                              titleController.text;
                                          updateHabit["description"] =
                                              descriptionController.text;

                                          // Updae Firestore record information regular way
                                          FirebaseFirestore.instance
                                              .collection("Habits")
                                              .doc(FirebaseAuth
                                                  .instance.currentUser.uid)
                                              .collection('Habits')
                                              .doc(document.id)
                                              .update(updateHabit)
                                              .whenComplete(() {
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Text(
                                          "update",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  )
                                ],
                              );
                            });
                      },
                      title: new Text(document['title'], style: TextStyle(color: Colors.yellowAccent[700], fontWeight: FontWeight.bold),),
                      
                      subtitle: new Text(document['description']),
                      trailing:
                          // Delete Button
                          InkWell(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection("Habits")
                              .doc(FirebaseAuth.instance.currentUser.uid)
                              .collection('Habits')
                              .doc(document.id)
                              .delete()
                              .catchError((e) {
                            print(e);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Icon(Icons.delete),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
