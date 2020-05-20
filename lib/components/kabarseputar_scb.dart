import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:scbforparents/models/humasItem.dart';
import 'package:scbforparents/views/newsItem.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class KabarSeputarSCB extends StatefulWidget {
  @override
  _KabarSeputarSCBState createState() => _KabarSeputarSCBState();
}

class _KabarSeputarSCBState extends State<KabarSeputarSCB> {
  final String url =
      'https://cdn.contentful.com/spaces/n2o2oyh78lcv/environments/master';
  final String spaceId = 'n2o2oyh78lcv';
  final String accessToken = 'yNw9k6la9B3Q06h04menoajN6zNllx-ifEK1E8Ia5GU';
  List data;
  List items;
  List imageId;
//  List imageUrl;
  var  newsItem = [];
//  List newsUrl;

//  Future<String> loadJsonData() async {
//    var jsonText = await rootBundle.loadString('assets/kabarSeputarSCB.json');
//    setState(() {
//      data = json.decode(jsonText);
//    });
//    return 'success';
//  }

  Future<String> getBlogPost() async {
    List<Items> list = [];
    var fullUrl =
        '${url}/entries?select=fields.title,fields.gambarArtikel,fields.slug&content_type=blogPost&access_token=${accessToken}';
    var response = await http.get(fullUrl);
    setState(() {
      var decoded = json.decode(response.body);
      data = decoded['items'];
    });
    var item;
    for (item in data) {
      newsItem.add(item);
    }

//    for (var i in newsItem){
//      imageId = newsItem[i]['fields']['gambarArtikel']['sys']['id'];
//      var imageData =
//      await http.get('${url}/assets/${imageId}?access_token=${accessToken}');
//      var decode = json.decode(imageData.body);
//      var image = decode['fields'];
//      imageUrl = image['file']['url'];
//
//      newsUrl.add(imageUrl);
//      print(newsUrl);
//    }

    return 'success';
  }

  @override
  void initState() {
    super.initState();
    getBlogPost();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getBlogPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return listViewWidget();
          } else
            return CircularProgressIndicator();
        });
  }


  Widget listViewWidget() {
    return GridView.builder(
        physics: new NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.1,),
        itemBuilder: (context, position) {
//          if (newsUrl[position] != null){
//          return ClipRRect(
//              borderRadius: BorderRadius.circular(5.0),
//              child: Hero(
//                  tag: Text(
//                      '${newsItem[position]['fields']['title']}'),
//                  child: Material(
//                      child: InkWell(
//                        onTap: () {
//                          launch(
//                              'https://nezuko.cendekiabaznas.sch.id/kabarterkini/' +
//                                  '${newsItem[position]['fields']['slug']}' +
//                                  '/');
//                        },
//                        child: GridTile(
//                          footer: Opacity(
//                            opacity: 0.9,
//                            child: Container(
//                              height: MediaQuery
//                                  .of(context)
//                                  .size
//                                  .width / 9,
//                              color: Colors.green[50],
//                              child: ListTile(
//                                leading: Padding(
//                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
//                                  child: Text(
//                                    '${newsItem[position]['fields']['title']}',
//                                    maxLines: 2,
//                                    overflow: TextOverflow.ellipsis,
//                                    style: TextStyle(
//                                        color: Colors.black,
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 12),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                          child: Image.network(
//                            '${newsUrl[position]}',
//                            fit: BoxFit.cover,
//                          ),
//                        ),
//                      )
//                  )));
//                  } else
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Hero(
                            tag: Text(
                                '${newsItem[position]['fields']['title']}'),
                            child: Material(
                                child: InkWell(
                                  onTap: () {
                                    launch(
                                        'https://nezuko.cendekiabaznas.sch.id/kabarterkini/' +
                                            '${newsItem[position]['fields']['slug']}' +
                                            '/');
                                  },
                                  child: GridTile(
                                    footer: Opacity(
                                      opacity: 0.9,
                                      child: Container(
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .width / 9,
                                        color: Colors.green[50],
                                        child: ListTile(
                                          leading: Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                            child: Text(
                                              '${newsItem[position]['fields']['title']}',
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
                                    child: Image(image: AssetImage('images/Logo-SCB.png'),
//                            '${url}/assets/${itemBerita[position]['fields']['gambarArtikel']['sys']['id']}?access_token=${accessToken}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                            )));
        });
  }
}
//      Container(
//      child: ListView.builder(
//          physics: new NeverScrollableScrollPhysics(),
//          itemCount: 4,
//          padding: const EdgeInsets.all(2.0),
//          itemBuilder: (context, position) {
//            return Card(
//              child: InkWell(
//                  child: ListTile(
//                    onTap: () {launch('https://nezuko.cendekiabaznas.sch.id/kabarterkini/' + '${itemBerita[position]['fields']['slug']}' +'/');},
//                  title: Text(
//                    '${itemBerita[position]['fields']['title']}',
//                    style: TextStyle(
//                        fontSize: 18.0,
//                        color: Colors.black,
//                        fontWeight: FontWeight.bold,
//                    ),
//              ),
//                  ),)
//                );
//              },
//            ));

