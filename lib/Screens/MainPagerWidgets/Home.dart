import 'package:flutter/material.dart';
import 'package:wallpaperapp/widget/Components/SearchBar.dart';
import 'package:wallpaperapp/widget/Components/HomeCategory.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin{

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Wallpaper",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Rubik')),
                  TextSpan(
                      text: "App",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                          fontFamily: 'Rubik'))
                ]),
              )),
          SearchBar(),
          SizedBox(
            height: 13,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: <Widget>[
                HomeCategory("Popular"),
                SizedBox(
                  height: 13,
                ),
                HomeCategory("Love"),
                SizedBox(
                  height: 13,
                ),
                HomeCategory("Artistic"),
                SizedBox(
                  height: 13,
                ),
                HomeCategory("Adventures"),
                SizedBox(
                  height: 13,
                ),
                HomeCategory("Backgrounds"),
                SizedBox(
                  height: 15,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
