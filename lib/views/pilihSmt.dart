
import 'package:flutter/material.dart';
import 'nilaiAkademikSemester.dart';
import 'nilaiAsramaSemester.dart';

class PilihSmt extends StatefulWidget{
  PilihSmt(this.argument);
  final String argument;
  @override
  PilihSmtState createState() => new PilihSmtState();
}

class PilihSmtState extends State<PilihSmt> {
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0); // warna hijau sesuai yang di figma
  var scbgreen2 = Color.fromRGBO(1, 83, 47, 1); // warna hijau lebih tua
  var icons = [Icons.school, Icons.home];
  var arguments = ['Akademik', 'Asrama'];

  Icon iconChooser(){
    if(widget.argument == arguments[0]){
      return Icon(icons[0], size: 45, color: Colors.white);
    }
    else return Icon(icons[1], size: 45, color: Colors.white);
  }
  
  MaterialPageRoute selector(int semester){
    if(widget.argument == arguments[0])  
      return MaterialPageRoute(builder: (context)=>NilaiAkademikSmt(semester.toString()));
    else 
      return MaterialPageRoute(builder: (context)=>NilaiAsramaSmt(semester.toString()));
  }

  String classChooser(int i){
    String a;
    if(i == 0) a = "VII";
    else if(i == 1) a = "VIII";
    else a ="IX";
    return a;
  }

  Container cardBuilder(int i){
    return Container(
      child: Card(
        elevation: 5,
        color: scbgreen,
          child: new InkWell(
            onTap: (){
              Navigator.push(context, selector(i+1));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                iconChooser(),
                SizedBox(height: 10,),
                Text(
                  'Semester '+(i%2 + 1).toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  ListView builder(){
    var a = <Widget>[];
    for (int i=0; i<3; i++){
      a.add(Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Kelas '+classChooser(i),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              Divider(
                color: scbgreen,
                thickness: 1,
              )
            ],
        )
        ));
      a.add(GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(15,0,15,15),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.height / 600,
          physics: ScrollPhysics(),
          children: <Widget>[
            cardBuilder(i*2),
            cardBuilder(i*2 + 1),
          ],
        ),
        );
    }
    return ListView(
      children: a
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text("Rapor "+widget.argument),
        centerTitle: true,
        backgroundColor: scbgreen2,
      ),
      body: builder(),
    );
  }
}