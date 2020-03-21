import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class KabarSeputarSCB extends StatefulWidget {
  @override
  _KabarSeputarSCBState createState() => _KabarSeputarSCBState();
}

class _KabarSeputarSCBState extends State<KabarSeputarSCB> {
  List data;
  Future<String> loadJsonData() async{
    var jsonText= await rootBundle.loadString('assets/kabarSeputarSCB.json');
    setState(() {
      data = json.decode(jsonText);
    });
    return 'success';
  }

  @override
  void initState(){
    super.initState ();
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleNews(
          newsTitle: data[index]['judul'],
          newsPicture: data[index]['newsPhoto'],
          newsURL: data[index]['url'],
        );
      },
    );
  }
}

class SingleNews extends StatelessWidget {
  final newsTitle;
  final newsPicture;
  final newsURL;

  SingleNews({
    this.newsTitle,
    this.newsPicture,
    this.newsURL,
  });

  _launchURL() async {
    if (await canLaunch(newsURL)) {
      await launch(newsURL);
    } else {
      throw 'Could not launch $newsURL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: newsTitle,
          child: Material(
            child: InkWell(
              onTap: _launchURL,
              child: GridTile(
                footer: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(
                      newsTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                    ),
                  ),
                ),
                child: Image.network(
                  newsPicture,
                  fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
    );
  }
}
