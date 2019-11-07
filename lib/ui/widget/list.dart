import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subTitle;
  final Function onPressed;
  final double dividePaddingLeft;
  final double itemHeight;

  const CustomListTile(
      {this.icon,
      this.title,
      this.subTitle,
      this.onPressed,
      this.dividePaddingLeft = 0,
      this.itemHeight = 55});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: itemHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: dividePaddingLeft,
                    alignment: Alignment.center,
                    child: icon,
                  ),
                  Text(
                    title,
                  ),
                  if (subTitle != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '($subTitle)',
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: dividePaddingLeft, bottom: 0),
              child: const Divider(),
            ),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
