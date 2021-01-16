import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:async/async.dart';
import 'dart:async';
import 'PostDetailsPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Post");
// ignore_for_file: cancel_subscriptions
  @override
  void initState() {
    super.initState();

    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.docs;
      });
    });
  }

  passData(DocumentSnapshot snap) {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) => PostDetails(
              snapshot: snap,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Blog App"),
        backgroundColor: Colors.redAccent,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Code with ydc"),
              accountEmail: new Text("ydc@gmail.com"),
              decoration: new BoxDecoration(color: Colors.pink),
            ),
            new ListTile(
              title: new Text("First Page"),
              leading: new Icon(
                Icons.cake,
                color: Colors.purple,
              ),
            ),
            new ListTile(
              title: new Text("Second Page"),
              leading: new Icon(
                Icons.search,
                color: Colors.redAccent,
              ),
            ),
            new ListTile(
              title: new Text("Third Page"),
              leading: new Icon(
                Icons.cached,
                color: Colors.orange,
              ),
            ),
            new ListTile(
              title: new Text("Fourth Page"),
              leading: new Icon(
                Icons.menu,
                color: Colors.green,
              ),
            ),
            new Divider(
              height: 10.0,
              color: Colors.black,
            ),
            new ListTile(
              title: new Text("close"),
              trailing: new Icon(
                Icons.close,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      body: new ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context, index) {
            return new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              child: new Container(
                padding: EdgeInsets.all(10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new CircleAvatar(
                      child: new Text(snapshot[index].data()['title'][0]),
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Container(
                      width: 210.0,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new InkWell(
                            child: new Text(
                              snapshot[index].data()['title'],
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.green),
                              maxLines: 1,
                            ),
                            onTap: () {
                              passData(snapshot[index]);
                            },
                          ),
                          new SizedBox(
                            height: 5.0,
                          ),
                          new Text(
                            snapshot[index].data()['content'],
                            maxLines: 2,
                          ),
                          new Text(
                            snapshot[index].data()['Rating'],
                            style: TextStyle(fontSize: 22.0, color: Colors.red),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
