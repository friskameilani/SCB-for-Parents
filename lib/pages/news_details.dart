import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  final newsDetailTitle;
  final newsDetailPicture;

  NewsDetails({
    this.newsDetailTitle,
    this.newsDetailPicture
  });

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
