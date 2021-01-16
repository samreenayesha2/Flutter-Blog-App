import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'PostDetailsPage.dart';

// ignore: must_be_immutable
//uploadind to git
class PostDetails extends StatefulWidget {
  DocumentSnapshot snapshot;

  PostDetails({this.snapshot});
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Post Details"),
        backgroundColor: Colors.green,
      ),
      body: new Card(
        elevation: 10.0,
        margin: EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    new CircleAvatar(
                      child: new Text(widget.snapshot.data()['title'][0]),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text(
                      widget.snapshot.data()['title'],
                      style: TextStyle(fontSize: 22.0, color: Colors.green),
                    )
                  ],
                )),
            new SizedBox(
              height: 10.0,
            ),
            new Container(
              margin: EdgeInsets.all(10.0),
              child: new Text(
                widget.snapshot.data()['content'],
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            new Container(
                margin: EdgeInsets.all(10.0),
                child: new Text(
                  widget.snapshot.data()['Rating'],
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}
