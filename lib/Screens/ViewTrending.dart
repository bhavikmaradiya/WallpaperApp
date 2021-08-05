import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaperapp/model/wallpaper.dart';
import 'package:wallpaperapp/widget/Components/WallpaperItem.dart';

class ViewTrending extends StatefulWidget {
  @override
  _ViewTrendingState createState() => _ViewTrendingState();
}

class _ViewTrendingState extends State<ViewTrending> {
  List<Wallpaper> wallpapers = new List();
  int pageCount = 1;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    
    getInitialPhotos(pageCount);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        getInitialPhotos(pageCount);
        print("end");
      }
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.50,
                        fontSize: 29,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 3),
                      child: Text(
                        (() {
                          if (wallpapers.length > 0) {
                            return "${wallpapers.length}+ wallpapers available";
                          }
                          return "";
                        })(),
                        style: TextStyle(
                          color: Colors.black,
                          wordSpacing: 0.50,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              wallpapers.length > 0
                  ? Expanded(
                      child: Container(
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: StaggeredGridView.countBuilder(
                          controller: _controller,
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          crossAxisSpacing: 1,
                          scrollDirection: Axis.vertical,
                          mainAxisSpacing: 0.50,
                          itemCount: wallpapers.length,
                          staggeredTileBuilder: (index) {
                            return StaggeredTile.count(
                                1, index.isEven ? 1.2 : 1.8);
                          },
                          itemBuilder: (context, index) {
                            if (wallpapers[index].id != null) {
                              return WallpaperItem(
                                wallpaper: wallpapers[index],
                              );
                            } else {
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                margin: EdgeInsets.symmetric(horizontal: 3.5),
                                child: Container(
                                    child: SizedBox(
                                  width: 190,
                                  height: 190,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Lottie.asset(
                                        'assets/walkinganimation.json'),
                                  )),
                                )),
                              );
                            }
                          },
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        padding: EdgeInsets.all(25),
                        child: Lottie.asset('assets/walkinganimation.json'),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void getInitialPhotos(int page) async {
    if (page > 1 && wallpapers.isNotEmpty && wallpapers[wallpapers.length - 1].id != null) {
      wallpapers.add(Wallpaper(id: null));
      setState(() {});
    }
    var res = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=5&page=$page"),
        headers: {"Authorization": API_KEY});

    Map<String, dynamic> jsonData = jsonDecode(res.body);
    if (page == 1) {
      wallpapers.clear();
    }
    if (wallpapers.isNotEmpty && wallpapers[wallpapers.length - 1].id == null) {
      wallpapers.removeAt(wallpapers.length - 1);
    }
    jsonData['photos'].forEach((item) {
      wallpapers.add(Wallpaper.fromJson(item));
    });
    pageCount++;
    print(jsonData['photos']);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    setState(() {});
  }
}
