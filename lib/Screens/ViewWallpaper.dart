import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaperapp/model/wallpaper.dart';

class ViewWallpaper extends StatefulWidget {
  Wallpaper wallpaper;

  ViewWallpaper(this.wallpaper);

  @override
  _ViewWallpaperState createState() => _ViewWallpaperState();
}

class _ViewWallpaperState extends State<ViewWallpaper> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
         tag: widget.wallpaper.src.portrait,
        child: Container(
          key: ValueKey(widget.wallpaper.src.small),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Positioned.fill(
                child: InteractiveViewer(
                  child: Image.network(
                    widget.wallpaper.src.portrait,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        _save();
                      },
                      child: Stack(
                        children: [
                          Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xff1C1B1B).withOpacity(0.8)),
                              child: Column(children: [
                                Text("Download",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.transparent,
                                        fontWeight: FontWeight.w600)),
                                Text('wallpaper will be saved',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ))
                              ])),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white54, width: 1),
                              gradient: LinearGradient(
                                  colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)]),
                            ),
                            child: Column(children: [
                              Text("Download",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              Text('wallpaper will be saved',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ))
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  _save() async {
    if (Platform.isAndroid) {
      await _askPermission();
    }
  }

  _askPermission() async {
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
              */
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.photos);
      if (permission != PermissionStatus.granted) {
        await PermissionHandler()
            .requestPermissions([PermissionGroup.photos]).then((value) => {
                  if (value[PermissionGroup.photos] == PermissionStatus.granted)
                    {_download()}
                });
      } else {
        _download();
      }
    } else {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        await PermissionHandler()
            .requestPermissions([PermissionGroup.storage]).then((value) => {
                  if (value[PermissionGroup.storage] ==
                      PermissionStatus.granted)
                    {_download()}
                });
      } else {
        _download();
      }
    }
  }

  _download() async {
    var response = await Dio().get(widget.wallpaper.src.portrait,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    Navigator.pop(context);
  }
}
