import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/util/colors.dart';

Widget bigDivider(){
  return Container(height: 10,color: CommonColors.bigDividerColor,);
}

Widget showLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}