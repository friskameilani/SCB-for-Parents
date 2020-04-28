
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
  var icons = [Icons.school, Icons.home];
  var arguments = ['Akademik', 'Asrama'];

  Icon iconChooser(){
    if(widget.argument == arguments[0]){
      return Icon(icons[0], size: 40, color: Colors.white);
    }
    else return Icon(icons[1], size: 40, color: Colors.white);
  }
  
  MaterialPageRoute selector(int semester){
    if(widget.argument == arguments[0])  
      return MaterialPageRoute(builder: (context)=>NilaiAkademikSmt(semester.toString()));
    else 
      return MaterialPageRoute(builder: (context)=>NilaiAsramaSmt(semester.toString()));
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
        backgroundColor: scbgreen,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Text(
              'Kelas VII',
              textAlign: TextAlign.left,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(15,0,15,15),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.height / 400,
            physics: ScrollPhysics(),
            children: <Widget>[
              Container(
                height: 60,
                child: Card(
                  elevation: 5,
                  color: scbgreen,
                  child: new InkWell(
                    onTap: (){
                      Navigator.push(context, selector(1));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        iconChooser(),
                        SizedBox(height: 10,),
                        Text(
                            'Semester 1',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                child: Card(
                  elevation: 5,
                  color: scbgreen,
                  child: new InkWell(
                    onTap: (){
                      
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        iconChooser(),
                        SizedBox(height: 10,),
                        Text(
                            'Semester 2',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
              'Kelas VIII',
              textAlign: TextAlign.left,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(15,0,15,15),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.height / 400,
            physics: ScrollPhysics(),
            children: <Widget>[
              Container(
                child: Card(
                  elevation: 5,
                  color: scbgreen,
                  child: new InkWell(
                    onTap: (){
                      
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        iconChooser(),
                        SizedBox(height: 10,),
                        Text(
                            'Semester 1',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Card(
                  elevation: 5,
                  color: scbgreen,
                  child: new InkWell(
                    onTap: (){
                      
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        iconChooser(),
                        SizedBox(height: 10,),
                        Text(
                            'Semester 2',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
              'Kelas IX',
              textAlign: TextAlign.left,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(15,0,15,15),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.height / 400,
            physics: ScrollPhysics(),
            children: <Widget>[
              Container(
                child: Card(
                  elevation: 5,
                  color: scbgreen,
                  child: new InkWell(
                    onTap: (){
                      
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        iconChooser(),
                        SizedBox(height: 10,),
                        Text(
                            'Semester 1',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                child: Card(
                  elevation: 5,
                  color: scbgreen,
                  child: new InkWell(
                    onTap: (){
                      
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        iconChooser(),
                        SizedBox(height: 10,),
                        Text(
                            'Semester 2',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]
      )
    );
  }
}