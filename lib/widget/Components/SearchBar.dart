import 'package:flutter/material.dart';
import 'package:wallpaperapp/Screens/ViewCategory.dart';

class SearchBar extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();
  FocusNode node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Color(0xfff5f8fd), borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: node,
              controller: _controller,
              style: TextStyle(fontSize: 15.5),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                if (_controller.text.trim().length > 0) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  String query = _controller.text.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewCategory(
                              query: query,
                            )),
                  ).then((value) {
                  if(_controller.text.trim().isNotEmpty){
                      FocusScope.of(context).requestFocus(node);
                  }});
                }
              },
              decoration:
                  InputDecoration(hintText: "Search", border: InputBorder.none),
            ),
          ),
          InkWell(
            onTap: () {
              if (_controller.text.trim().length > 0) {
                FocusScope.of(context).requestFocus(FocusNode());
                String query = _controller.text.toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewCategory(
                            query: query,
                          )),
                ).then((value) {
                  if(_controller.text.trim().isNotEmpty){
                      FocusScope.of(context).requestFocus(node);
                  }});
              }
            },
            child: Icon(
              Icons.search,
            ),
          )
        ],
      ),
    );
  }
}
