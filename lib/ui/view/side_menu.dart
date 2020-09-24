import 'package:flutter/material.dart';
import 'package:flutter_test_assignment/ui/view/home_page.dart';
import 'package:flutter_test_assignment/ui/view/sports_page.dart';
import 'package:flutter_test_assignment/ui/view/tech_page.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Widget container() {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.white60,
                size: 20,
              ),
              title: Text("Discover",
                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
              onTap: () {},
            ),
            Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/person1.png"),
                    fit: BoxFit.fill),
              ),
            ),
            Text(
              "Topics",
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            container(),
            Divider(color: Colors.white),
            ListTile(
              leading: Icon(Icons.book, color: Colors.white),
              title: Text("All News",
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.blur_circular, color: Colors.white),
              title: Text("World",
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.flag, color: Colors.white),
              title: Text("India",
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TechNew()));
              },
            ),
            ListTile(
              leading: Icon(Icons.games, color: Colors.white),
              title: Text("Sports",
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SportNew()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return drawer();
  }
}
