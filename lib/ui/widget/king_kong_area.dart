import 'package:flutter/material.dart';
import 'package:flutter_music/util/colors.dart';

class KingKongIcon extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onPressed;

  const KingKongIcon(this.title, this.iconData, this.onPressed);

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(top: 10),
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
}
