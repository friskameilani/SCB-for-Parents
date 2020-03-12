// TODO Implement this library.
import 'package:flutter/material.dart';
import 'opsiRapor.dart';

class AkademikPilihSmt extends StatefulWidget {
  @override
  _AkademikPilihSmtState createState() => _AkademikPilihSmtState();
}

class _AkademikPilihSmtState extends State<AkademikPilihSmt> {
  var smtList = [
    {
      "judul": "Jelang UNBK, SCB Cek Kesiapan Sarana dan Prasarana",
      "picture": Icons.school,
    },
    {
      "judul": "Al-Yaumu Ma'al Quran SCB",
      "picture": "images/Logo-SCB.png",
    },
  ];
  for (int i=1; i<=6; i++){
    smtList[i-1] = 
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: newsList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleNews(
          newsTitle: newsList[index]['judul'],
          newsPicture: newsList[index]['picture'],
        );
      },
    );
  }
}

class SingleNews extends StatelessWidget {
  final newsTitle;
  final newsPicture;

  SingleNews({
    this.newsTitle,
    this.newsPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: newsTitle,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (context) => new NewsDetails(
                        newsDetailTitle: newsTitle,
                        newsDetailPicture: newsPicture,)
                      )),
              child: GridTile(
                footer: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(
                      newsTitle,
                      style: TextStyle(fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
                child: Image.asset(
                    newsPicture,
                    fit: BoxFit.cover,),),
            ),
          )
      ),
    );
  }
}