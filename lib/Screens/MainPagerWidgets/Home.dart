import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaperapp/widget/Components/SearchBar.dart';
import 'package:wallpaperapp/widget/Components/Trending.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
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
              child: Column(children: <Widget>[Trending()]),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
