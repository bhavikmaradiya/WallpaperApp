import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/model/BottomNavigationBarProvider.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return ChangeNotifierProvider<BottomNavigationBarProvider>(
        create: (context) => BottomNavigationBarProvider(),
        child: Consumer<BottomNavigationBarProvider>(
          builder: (context, model, _) => Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              elevation: 1,
              backgroundColor: Colors.grey.shade200,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: model.currentPos,
              onTap: (index) {
                model.currentPos = index;
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Feather.home,
                      size: 20,
                    ),
                    title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesome.th_large, size: 20),
                    title: Text('Category')),
              ],
            ),
            body: SafeArea(
              child: PageView(
                children: model.screen,
                physics: NeverScrollableScrollPhysics(),
                controller: model.controller,
              ),
            ),
          ),
        ));
  }
}
