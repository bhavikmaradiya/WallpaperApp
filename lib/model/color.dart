import 'package:flutter/material.dart';

class ColorModel {
  Color color;
  String colorName;

  ColorModel({this.colorName, this.color});

  Color get getColor => color;
}

List<ColorModel> getAllColors() {
  List<ColorModel> colors = new List();
  colors.add(new ColorModel(color: Colors.black87.withAlpha(200), colorName: "Black"));
  colors.add(new ColorModel(color: Colors.white, colorName: "White"));
  colors.add(new ColorModel(color: Colors.red.withAlpha(200), colorName: "Red"));
  colors.add(new ColorModel(color: Colors.yellow.withAlpha(200), colorName: "Yellow"));
  colors.add(new ColorModel(color: Colors.green.withAlpha(180), colorName: "Green"));
  colors.add(new ColorModel(color: Colors.blue.withAlpha(200), colorName: "Blue"));
  colors.add(new ColorModel(color: Colors.orange.withAlpha(200), colorName: "Orange"));
  colors.add(new ColorModel(color: Colors.pink.withAlpha(180), colorName: "Pink"));
  colors.add(new ColorModel(color: Colors.grey.shade400, colorName: "Grey"));
  colors.add(new ColorModel(color: Colors.lime.shade500, colorName: "Lime"));
  colors.add(new ColorModel(color: Colors.purple.shade400, colorName: "Purple"));
  colors.add(new ColorModel(color: Colors.brown.shade400, colorName: "Brown"));
  colors.add(new ColorModel(color: Color.fromRGBO(128, 128, 0, 100), colorName: "Olive"));
  colors.add(new ColorModel(color: Color.fromRGBO(0, 255, 255, 100), colorName: "Cyan"));
  colors.add(new ColorModel(color: Color.fromRGBO(195, 176, 145, 100), colorName: "Khaki"));
  colors.add(new ColorModel(color: Color.fromRGBO(255, 0, 255, 100), colorName: "Magenta"));
  colors.add(new ColorModel(color: Color.fromRGBO(1, 115, 144, 100), colorName: "Aquamarine"));
  colors.add(new ColorModel(color: Color.fromRGBO(192, 192, 192, 100), colorName: "Silver"));
  colors.add(new ColorModel(color: Color.fromRGBO(221, 195, 118, 100), colorName: "Gold"));
  colors.add(new ColorModel(color: Color.fromRGBO(0, 128, 128, 100), colorName: "Teal"));
  return colors;
}
