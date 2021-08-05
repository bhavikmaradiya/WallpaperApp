import 'package:flutter/cupertino.dart';
import 'package:wallpaperapp/Screens/MainPagerWidgets/Category.dart';
import 'package:wallpaperapp/Screens/MainPagerWidgets/Home.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _currentPos = 0;
  List<Widget> screen = [Home(), Category()];

  PageController controller = PageController(initialPage: 0);

  set currentPos(int pos) {
    this._currentPos = pos;
    controller.animateToPage(_currentPos, duration: Duration(milliseconds:60), curve: Curves.linear);
    notifyListeners();
  }
  int get currentPos => this._currentPos;
  Widget get currentWidget => this.screen[this._currentPos];
}
