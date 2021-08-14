import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaperapp/model/color.dart';
import 'package:wallpaperapp/model/view_categorynotifier.dart';
import 'package:wallpaperapp/widget/Components/WallpaperItem.dart';

class ViewCategory extends StatelessWidget {
  final String query;
  final ColorModel color;
  const ViewCategory({this.query, this.color});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewCategoryNotifier(),
      child: Body(query, color),
    );
  }
}

class Body extends StatefulWidget {
  final String query;
  final ColorModel color;

  const Body(this.query, this.color);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
   
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var notifier = Provider.of<ViewCategoryNotifier>(context, listen: false);
      notifier.getInitialPhotos(widget.query, widget.color);
      notifier.controller.addListener(() {
        if (notifier.controller.position.pixels ==
            notifier.controller.position.maxScrollExtent) {
          notifier.getInitialPhotos(widget.query, widget.color);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewCategoryNotifier>(
      builder: (context, state, child) => Material(
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
                        widget.query != null
                            ? widget.query
                            : widget.color.colorName,
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
                            if (state.wallpapers.length > 0) {
                              return state
                                          .wallpapers[
                                              state.wallpapers.length - 1]
                                          .id ==
                                      null
                                  ? "${state.wallpapers.length - 1}+ wallpapers available"
                                  : "${state.wallpapers.length}+ wallpapers available";
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
                state.wallpapers.length > 0
                    ? Expanded(
                        child: Container(
                          clipBehavior: Clip.none,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: StaggeredGridView.countBuilder(
                            controller: state.controller,
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            crossAxisSpacing: 1,
                            scrollDirection: Axis.vertical,
                            mainAxisSpacing: 0.50,
                            itemCount: state.wallpapers.length,
                            staggeredTileBuilder: (index) {
                              return StaggeredTile.count(
                                  1, index.isEven ? 1.2 : 1.8);
                            },
                            itemBuilder: (context, index) {
                              if (state.wallpapers[index].id != null) {
                                return WallpaperItem(
                                  wallpaper: state.wallpapers[index],
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
      ),
    );
  }
}
