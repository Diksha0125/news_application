import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  var author;
  var title;
  var description;
  var url;
  var urlToImage;
  var publishedAt;
  var content;

  DetailPage(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget screenView(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned.fill(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                    child: Image(
                        image: NetworkImage(widget.urlToImage),
                        fit: BoxFit.cover))),
            Expanded(child: Container(color: Colors.grey))
          ],
        ),
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.black.withOpacity(0.8),
          Colors.black.withOpacity(0.4),
          Colors.black.withOpacity(0.2)
        ])),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40.0),
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20.0),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 24.0)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            child: Text(
                                widget.author.substring(0, 1).toUpperCase())),
                        Text(
                          widget.author,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          widget.publishedAt,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.2),
        height: MediaQuery.of(context).size.height / 1.6,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40.0),
                Text(widget.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 22.0, color: Colors.white60)),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenView(context),
    );
  }
}
