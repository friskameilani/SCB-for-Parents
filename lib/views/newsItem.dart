import 'package:flutter/material.dart';
import 'package:scbforparents/models/humasItem.dart';

class NewsItem extends StatefulWidget {
  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  var scbgreen2 = Color.fromRGBO(1, 83, 47, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Kabar Terkini SCB"),
          centerTitle: true,
          backgroundColor: scbgreen2,
        ),
      body: ListView(
        children: [
          Container(child: Text("JUDUL")),
          Container(child: Text("content",))
        ],
      )
    );
  }
}

