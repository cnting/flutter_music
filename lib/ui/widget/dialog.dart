import 'package:flutter/material.dart';

showCommonDialog(BuildContext context, Widget child) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: child,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      });
}
