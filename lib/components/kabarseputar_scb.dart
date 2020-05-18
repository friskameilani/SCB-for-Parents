import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:scbforparents/models/humasItems.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scbforparents/controllers/humasApi.dart';
import 'package:http/http.dart' as http;

// class KabarSeputarSCB extends StatelessWidget {
// final String query = r"""
//                  query ($skip: Int!, $limit:Int!) {
//                    allContentfulBlogPost(
//                    sort: {fields: title, order: DESC}
//                    skip : $skip
//                    limit: $limit
//                    ) {
//                      edges {
//                        node {
//                          id
//                          title
//                          slug
//                          publishedDate
//                          gambarArtikel{
//                            file{url}
//                          }
//                        }
//                      }
//                    }
//                  }
//                """;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("GraphlQL Client"),
//         ),
//         body: Query(
//           options: QueryOptions(
//             documentNode: gql(query),
//           ),
//           builder: (QueryResult result,
//               {VoidCallback refetch, FetchMore fetchMore}) {
//             if (result.loading) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (result.data == null) {
//               return Text("No Data Found !");
//             } else {
//               print(result.data);
//               return ListView.builder(
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     title: Text(result.data['edges']['node'][index]['title']),
//                   );
//                 },
//                 itemCount: result.data['edges']['node'].length,
//               );
//             }
//           },
//         ));
//   }
// }

class KabarSeputarSCB extends StatefulWidget {
  @override
  _KabarSeputarSCBState createState() => _KabarSeputarSCBState();
}

class _KabarSeputarSCBState extends State<KabarSeputarSCB> {
  final String url =
      'https://cdn.contentful.com/spaces/n2o2oyh78lcv/environments/master/';
  final String accessToken = 'yNw9k6la9B3Q06h04menoajN6zNllx-ifEK1E8Ia5GU';

  Future _getBlogPost() async {
    List<Items> list = [];
    var fullUrl =
        '${url}entries?select=fields.title&content_type=blogPost&access_token=${accessToken}';
    var response = await http.get(fullUrl);
    var decoded = json.decode(response.body);
    var items = decoded['items'];
    // print('items');
    // print(items);
    // var test = items.map((json) => print(json)).toList();
    // print('test');
    // print(test);
    // print(items.map((json) => Items.fromJson(json)).toList());
    // list = items.map<Items>((json) => Items.fromJson(json)).toList();
    for (Map i in items) {
      list.add(Items.fromJson(i));
    }
    // print("List: ${list}");
    return list;
  }

  // List data = [];

  // Future<String> loadJsonData() async {
  //   var jsonText = await rootBundle.loadString('assets/kabarSeputarSCB.json');
  //   setState(() {
  //     data = json.decode(jsonText);
  //   });
  //   return 'success';
  // }

  @override
  void initState() {
    super.initState();
    _getBlogPost();
    // this.loadJsonData();
  }

  // @override
  // Widget build(BuildContext context) {
  //   // return GridView.builder(
  //   //   physics: new NeverScrollableScrollPhysics(),
  //   //   itemCount: data.length,
  //   //   gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
  //   //     crossAxisCount: 2,
  //   //     crossAxisSpacing: 10,
  //   //     mainAxisSpacing: 10,
  //   //     childAspectRatio: 1.1,
  //   //   ),
  //   //   itemBuilder: (BuildContext context, int index) {
  //   //     return SingleNews(
  //   //       newsTitle: data[index]['judul'],
  //   //       newsPicture: data[index]['newsPhoto'],
  //   //       newsURL: data[index]['url'],
  //   //     );
  //   //   },
  //   // );
  // }

  Widget listViewWidget(List<Items> article) {
    return Container(
      child: ListView.builder(
          itemCount: 4,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return Card(
                child: ListTile(
              title: Text(
                '${article[position].fields}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              //   leading: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: SizedBox(
              //       child: article[position].urlToImage == null
              //           ? Image(
              //               image: AssetImage('images/no_image_available.png'),
              //             )
              //           : Image.network('${article[position].urlToImage}'),
              //       height: 100.0,
              //       width: 100.0,
              //     ),
              //   ),
              //   onTap: () => _onTapItem(context, article[position]),
              // ),
            ));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(5.0),
    //   child: Hero(
    //     tag: newsTitle,
    //     child: Material(
    //       child: InkWell(
    //         onTap: _launchURL,
    //         child: GridTile(
    //           footer: Opacity(
    //             opacity: 0.9,
    //             child: Container(
    //               height: MediaQuery.of(context).size.width / 9,
    //               color: Colors.green[50],
    //               child: ListTile(
    //                 leading: Padding(
    //                   padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
    //                   child: Text(
    //                     newsTitle,
    //                     maxLines: 2,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: TextStyle(
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 12),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           child: Image.network(
    //             newsPicture,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: FutureBuilder(
          future: _getBlogPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return listViewWidget(snapshot.data);
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

// class SingleNews extends StatelessWidget {
//   final newsTitle;
//   final newsPicture;
//   final newsURL;

//   SingleNews({
//     this.newsTitle,
//     this.newsPicture,
//     this.newsURL,
//   });

//   _launchURL() async {
//     if (await canLaunch(newsURL)) {
//       await launch(newsURL);
//     } else {
//       throw 'Could not launch $newsURL';
//     }
//   }
