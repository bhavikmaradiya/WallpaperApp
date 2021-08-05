import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaperapp/widget/Components/ColorsList.dart';
import 'package:wallpaperapp/widget/Components/GridItem.dart';
import 'package:wallpaperapp/widget/Components/PoppedCategoryList.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with AutomaticKeepAliveClientMixin {

      @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.5),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              child: Text('Explore',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ))),
          SizedBox(
            height: 13,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: <Widget>[
                ColorsList(),
                SizedBox(height: 5),
                PoppedCategoryList(),
                SizedBox(height: 7),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  color: Colors.transparent,
                  child: GridView.count(
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    childAspectRatio: 3,
                    physics: ScrollPhysics(),
                    mainAxisSpacing: 13,
                    crossAxisSpacing: 13,
                    crossAxisCount: 2,
                    children: [
                      GridItem('assets/abstract.jpg', "Abstract", "200+"),
                      GridItem('assets/minimal.jpg', "Minimal", "200+"),
                      GridItem('assets/nature.jpg', "Nature", "200+"),
                      GridItem('assets/texture.jpg', "Texture", "200+"),
                      GridItem('assets/art.jpg', "Art", "200+"),
                      GridItem('assets/car.jpg', "Car", "200+"),
                      GridItem('assets/fitness.jpg', "Fitness", "200+"),
                      GridItem('assets/mountain.jpg', "Mountain", "200+"),
                      GridItem('assets/desert.jpg', "Desert", "200+"),
                      GridItem('assets/food.jpg', "Food", "200+"),
                      GridItem('assets/quote.jpg', "Quotes", "200+"),
                      
                    ],
                  ),
                ),
                SizedBox(height: 20),
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

