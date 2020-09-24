import 'package:flutter/material.dart';
import 'package:flutter_test_assignment/datasource/news_datasource.dart';
import 'package:flutter_test_assignment/models/news_model.dart';
import 'package:flutter_test_assignment/ui/view/detail_page.dart';
import 'package:flutter_test_assignment/ui/view/side_menu.dart';

class SportNew extends StatefulWidget {
  @override
  _SportNewState createState() => _SportNewState();
}

class _SportNewState extends State<SportNew> {
  DataSource dataSource = DataSource();
  var isLoading = true;

  @override
  void initState() {
    dataSource.addListener(dataSourceDidChange);
    dataSource.fetchDataSports();
    super.initState();
  }

  void dataSourceDidChange() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      drawer: SideMenu(),
      body: dataSource.newsModel.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              itemCount: dataSource.newsModel.length,
              itemBuilder: buildItem,
            ),
    );
  }

  Widget appBar() {
    return AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sports',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Icon(Icons.refresh)
          ],
        ));
  }

  Widget buildItem(BuildContext context, int indexPath) {
    NewsModel newsModel = dataSource.objectAtIndexPath(indexPath);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          color: Colors.grey[900],
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        author: newsModel.author,
                        title: newsModel.title,
                        description: newsModel.description,
                        url: newsModel.url,
                        urlToImage: newsModel.urlToImage,
                        publishedAt: newsModel.publishedAt,
                        content: newsModel.content,
                      ),
                    ));
              },
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Image(
                      image: NetworkImage('${newsModel.urlToImage}'),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text('${newsModel.title}',
                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  SizedBox(height: 10.0)
                ],
              ),
              subtitle: Column(
                children: [
                  Text('${newsModel.description}',
                      style: TextStyle(color: Colors.white54, fontSize: 12.0)),
                  Container(
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share, color: Colors.white),
                          SizedBox(width: 20),
                          Text("Share", style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
