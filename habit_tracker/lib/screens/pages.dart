import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String documentId;

  const MyHomePage({Key key, this.documentId}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController authorController = new TextEditingController();

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
      ),
      body: BookList(),
      // ADD (Create)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 16,
                  contentPadding: EdgeInsets.all(20),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(child: Text("Add Book", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),)),
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
                        child: Text("Author: "),
                      ),
                      TextField(
                        controller: authorController,
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

                    RaisedButton(
                      color: Colors.yellowAccent,
                      onPressed: () {
                        Map<String, dynamic> newBook =
                            new Map<String, dynamic>();
                        newBook["title"] = titleController.text;
                        newBook["author"] = authorController.text;

                        FirebaseFirestore.instance
                            .collection("books")
                            .doc(FirebaseAuth.instance.currentUser.uid)
                            .collection('books')
                            .add(newBook)
                            .whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Text(
                        "save",
                        style: TextStyle(color: Colors.black
                      ),
                    ),)
                  ],
                );
              });
        },
        tooltip: 'Add Book',
        backgroundColor: Colors.yellowAccent[700],
        child: Icon(Icons.add_outlined, color: Colors.black,),
      ),
    );
  }
}

// ignore: must_be_immutable
class BookList extends StatelessWidget {
  TextEditingController titleController = new TextEditingController();
  TextEditingController authorController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("books")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('books')
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
                                title: Text("Update Dilaog"),
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
                                      child: Text("Author: "),
                                    ),
                                    TextField(
                                      controller: authorController,
                                      decoration: InputDecoration(
                                        hintText: document['author'],
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
                                  RaisedButton(onPressed: () {
                                    Map<String, dynamic> updateBook =
                                        new Map<String, dynamic>();
                                    updateBook["title"] = titleController.text;
                                    updateBook["author"] =
                                        authorController.text;

                                    // Updae Firestore record information regular way
                                    FirebaseFirestore.instance
                                        .collection("books")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .collection('books')
                                        .doc(document.id)
                                        .update(updateBook)
                                        .whenComplete(() {
                                      Navigator.of(context).pop();
                                    });

                                    // Update firestore record information using a transaction to prevent any conflict in data changed from different sources
//                                         Firestore.instance.runTransaction((transaction) async {
// //                                          await transaction.update(document.reference, {'title': titleController.text, 'author': authorController.text })
//                                           await transaction.update(document.reference, updateBook)
//                                               .then((error){
//                                             Navigator.of(context).pop();
//                                           });
//                                         });
//                                       },

                                    child:
                                    Text(
                                      "update",
                                      style: TextStyle(color: Colors.white),
                                    );
                                  })
                                ],
                              );
                            });
                      },
                      title: new Text("Title: " + document['title']),
                      subtitle: new Text("Author:  " + document['author']),
                      trailing:
                          // Delete Button
                          InkWell(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection("books")
                              .doc(FirebaseAuth.instance.currentUser.uid)
                              .collection('books')
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
