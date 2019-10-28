import 'package:flutter/material.dart';
import 'package:flutter_music/config/util/colors.dart';

Widget kingKongIcon(
    BuildContext context, String title, IconData iconData, Function onPressed) {
  return GestureDetector(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Icon(
            iconData,
            size: 23,
            color: CommonColors.kingKongIconColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            title,
            style: TextStyle(color: CommonColors.kingKongTextColor),
          ),
        )
      ],
    ),
    onTap: onPressed,
  );
}
