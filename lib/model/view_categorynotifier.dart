import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/color.dart';
import 'package:wallpaperapp/model/wallpaper.dart';

class ViewCategoryNotifier extends ChangeNotifier {
  List<Wallpaper> wallpapers = [];
  int pageCount = 1;
  ScrollController controller = new ScrollController();
  void notify() => notifyListeners();

  void getInitialPhotos(String val, ColorModel col) async {
    String query = val;
    String color = col != null ? col.colorName : null;
    String url;
    if (query != null) {
      print(query);
      url =
          "https://api.pexels.com/v1/search?query=$query&per_page=5&page=$pageCount";
    } else {
      print(color);
      url =
          "https://api.pexels.com/v1/search?query=$color&color=$color&per_page=5&page=$pageCount";
    }
    if (pageCount > 1 &&
        wallpapers.isNotEmpty &&
        wallpapers[wallpapers.length - 1].id != null) {
      wallpapers.add(Wallpaper(id: null));
      notifyListeners();
    }
    var res =
        await http.get(Uri.parse(url), headers: {"Authorization": API_KEY});
    Map<String, dynamic> jsonData = jsonDecode(res.body);
    if (pageCount == 1) {
      wallpapers.clear();
    }
    print(jsonData);
    if (wallpapers.isNotEmpty && wallpapers[wallpapers.length - 1].id == null) {
      wallpapers.removeAt(wallpapers.length - 1);
    }
    jsonData['photos'].forEach((item) {
      if (!wallpapers.contains(Wallpaper.fromJson(item)))
        wallpapers.add(Wallpaper.fromJson(item));
    });
    pageCount++;
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    notifyListeners();
  }
}
