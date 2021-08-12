import 'package:flutter/material.dart';
import 'package:wallpaperapp/Screens/ViewWallpaper.dart';
import 'package:wallpaperapp/model/wallpaper.dart';

class WallpaperItem extends StatelessWidget {
  final Wallpaper wallpaper;
  WallpaperItem({this.wallpaper});
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(wallpaper.src.small),
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 3.5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.grey.withOpacity(0.3),
          highlightColor: Colors.grey.withOpacity(0.1),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewWallpaper(wallpaper)));
          },
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(12),
            child: Container(
                child: Hero(
              tag: wallpaper.src.portrait,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    wallpaper.src.portrait,
                    key: ValueKey(wallpaper.src.small),
                    height: 190,
                    width: 130,
                    fit: BoxFit.cover,
                  )),
            )),
          ),
        ),
      ),
    );
  }
}
