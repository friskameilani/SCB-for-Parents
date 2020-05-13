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
  List data = [];

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
      physics: new NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.1,
      ),
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
    return ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
      child: Hero(
          tag: newsTitle,
          child: Material(
            child: InkWell(
              onTap: _launchURL,
              child: GridTile(
                footer: Opacity(
                  opacity: 0.9,
                  child: Container(
                    height: MediaQuery.of(context).size.width /9,
                    color: Colors.green[50],
                    child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Text(
                          newsTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
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
