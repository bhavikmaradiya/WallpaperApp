import 'package:flutter/material.dart';
import 'package:wallpaperapp/Screens/ViewCategory.dart';
import 'package:wallpaperapp/model/color.dart';

class ColorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //     child: Text("",
          //         textAlign: TextAlign.start,
          //         style: TextStyle(
          //             color: Colors.black87,
          //             fontWeight: FontWeight.bold,
          //             letterSpacing: 0.50,
          //             fontSize: 19.5))),
          SizedBox(
            height: 2,
          ),
          Container(
              height: 55, width: double.infinity, child: getColorListView())
        ],
      ),
    );
  }

  ListView getColorListView() {
    List<ColorModel> colors = getAllColors();
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 5),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.symmetric(horizontal: 3.5),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.grey.withOpacity(0.3),
              highlightColor: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewCategory(
                            color: colors[index],
                          )),
                );
              },
              child: Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors[index].getColor,
                  ),
                  height: 50,
                  width: 45,
                ),
              ),
            ),
          ),
        );
      },
      itemCount: colors.length,
    );
  }
}
