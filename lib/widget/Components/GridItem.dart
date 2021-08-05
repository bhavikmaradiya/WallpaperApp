import 'package:flutter/material.dart';
import 'package:wallpaperapp/Screens/ViewCategory.dart';

class GridItem extends StatelessWidget {
  String image;
  String title;
  String subtitle;

  GridItem(this.image, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2),
                  blurRadius: 7.0,
                ),
              ]),
      child: Material(
        color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(7),
              splashColor: Colors.grey.withOpacity(0.3),
              highlightColor: Colors.grey.withOpacity(0.1),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewCategory(
                          query: title,
                        )),
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
             
              child: Row(
                children: [
                  Container(
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover),
                      )),
                 SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withAlpha(180),
                                    fontWeight: FontWeight.w600)),
                            Text(subtitle,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ))
                          ]),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  // Stack(children: [
  //       Positioned.fill(
  //           child: Container(
  //               height: 55,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(5),
  //                   color: Colors.white,
  //                   boxShadow: [
  //                     new BoxShadow(
  //                       color: Colors.black26,
  //                       offset: Offset(0.0, 2),
  //                       blurRadius: 7.0,
  //                     ),
  //                   ]))),
  //       Positioned(
  //         top: 5,
  //         left: 5,
  //         bottom: 5,
  //         child: ClipRRect(
  //             borderRadius: BorderRadius.circular(5),
  //             child: Image.asset(
  //               image,
  //               height: 50,
  //               width: 50,
  //               fit: BoxFit.cover,
  //             )),
  //       ),
  //       Positioned(
  //           left: 57,
  //           top: 5,
  //           bottom: 5,
  //           child: Padding(
  //             padding: const EdgeInsets.only(left: 5.0, top: 2,bottom: 2),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Expanded(
  //                   child: Text(title,
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                           fontSize: 15,
  //                           color: Colors.black.withAlpha(180),
  //                           fontWeight: FontWeight.w600)),
  //                 ),
  //                 SizedBox(height: 1,),
  //                 Expanded(
  //                                     child: Text(subtitle,
  //                       style: TextStyle(
  //                         color: Colors.black38,
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 12,
  //                       )),
  //                 )
  //               ],
  //             ),
  //           ))
  //     ]),

}
