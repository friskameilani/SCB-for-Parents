import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  CardText({
    this.big,
    this.small
  });

  String big;
  String small;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
                small, 
                style: TextStyle(
                  fontSize: 12
                ),
               ),
               SizedBox(height: 6,),
               Text(
                 big,
                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
               ),
               SizedBox(height: 10,),
      ],
      
    );
  }
}