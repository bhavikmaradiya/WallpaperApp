import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/Screens/ViewTrending.dart';
import 'package:wallpaperapp/model/wallpaper.dart';
import 'WallpaperItem.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() {
    return _TrendingState();
  }
}

class _TrendingState extends State<Trending> {
  List<Wallpaper> wallpapers = new List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        child: Text("Popular",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.50,
                                fontSize: 19.5))),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewTrending()),
                            );
                          },
                          child: Text("See all",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.5)),
                        ))
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  height: 215,
                  child: buildListView(),
                )
              ],
            );
          } else
            return Container(
                height: 215,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 130,
                      height: 190,
                      margin: EdgeInsets.symmetric(horizontal: 3.5),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white,),
                         
                        ),
                      ),
                    );
                  },
                ));
        },
        future: getInitialPhotos(),
      ),
    );
  }

  Future<List<Wallpaper>> getInitialPhotos() async {
    var res = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=10"),
        headers: {"Authorization": API_KEY});

    Map<String, dynamic> jsonData = jsonDecode(res.body);
    print(jsonData);
    wallpapers.clear();
    jsonData['photos'].forEach((item) {
      wallpapers.add(Wallpaper.fromJson(item));
    });
    return wallpapers;
  }

  ListView buildListView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 7),
      shrinkWrap: true,
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemCount: wallpapers.length,
      itemBuilder: (context, index) {
        return WallpaperItem(
          wallpaper: wallpapers[index],
        );
      },
    );
  }
}
