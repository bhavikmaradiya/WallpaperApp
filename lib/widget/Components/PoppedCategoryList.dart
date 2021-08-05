import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/Screens/ViewCategory.dart';
import 'package:wallpaperapp/model/PopedCategory.dart';

class PoppedCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          build3dCategory(
              PopedCategory(
                  name: "Space",
                  subtitle: 'Wallpapers',
                  image: 'assets/astronaut.png',
                  color: Color.fromRGBO(38, 66, 116, 100)),
              context),
          build3dCategory(
              PopedCategory(
                  name: "Animal",
                  subtitle: 'Wallpapers',
                  image: 'assets/dog.png',
                  color: Color.fromRGBO(147, 122, 84, 100)),
              context),
          build3dCategory(
              PopedCategory(
                  name: "Flower",
                  subtitle: 'Wallpapers',
                  image: 'assets/rose.png',
                  color: Color.fromRGBO(233, 167, 173, 100)),
              context),
          build3dCategory(
              PopedCategory(
                  name: "Bird",
                  subtitle: 'Wallpapers',
                  image: 'assets/flamingo2.png',
                  color: Color.fromRGBO(253, 111, 92, 100)),
              context),
          build3dCategory(
              PopedCategory(
                  name: "Superhero",
                  subtitle: 'Wallpapers',
                  image: 'assets/ironman.png',
                  color: Color.fromRGBO(170, 33, 36, 100)),
              context)
        ],
      ),
    );
  }

  Widget build3dCategory(PopedCategory category, BuildContext context) {
    return Container(
      width: 170,
      height: 255,
      padding: EdgeInsets.only(left: 2, right: 2, bottom: 10),
      margin: EdgeInsets.only(top: 7, left: 2, right: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
           splashColor: Colors.grey.withOpacity(0),
              highlightColor: Colors.grey.withOpacity(0),
          onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewCategory(
                    query: category.name,
                  )),
          );
    },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: category.color,
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: 170,
                  height: 220,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category.name,
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      Text('Wallpapers',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ))
                    ],
                  ),
                ),
              ),
              Positioned(
                top: category.name == "Bird" ? 1.5 : -5,
                left: category.name == "Bird" ? 4 : 0,
                child: Image(
                    image: AssetImage(category.image),
                    width: category.name == "Bird" ? 170 : 185,
                    height: category.name == "Bird" ? 170 : 185),
              )
            ],
          ),
        ),
      ),
    );
  }
}
