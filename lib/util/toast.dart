import 'package:flutter/material.dart';

void toast(BuildContext context, String msg) {
  SnackBar snackBar = SnackBar(
    content: Text(msg),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
