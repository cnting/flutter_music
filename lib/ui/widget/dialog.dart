import 'package:flutter/material.dart';
import 'package:flutter_music/util/theme.dart';

showCommonDialog(BuildContext context, Widget child) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child:  Padding(
            padding: const EdgeInsets.all(15),
            child: child,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      });
}

showAskDialog(BuildContext context, String content,
    {String cancelText, String sureText, Function(bool) btnCallback}) {
  Widget child = Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          content,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text(
              cancelText ?? '取消',
              style: STheme.dialogBtnTextStyle(context),
            ),
            onPressed: () {
              if (btnCallback != null) {
                btnCallback(false);
              }
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text(
              sureText ?? '确定',
              style: STheme.dialogBtnTextStyle(context),
            ),
            onPressed: () {
              print('===>点击确定 btnCallback:$btnCallback');
              if (btnCallback != null) {
                btnCallback(true);
              }
              Navigator.pop(context);
            },
          ),
        ],
      )
    ],
  );
  showCommonDialog(context, child);
}
