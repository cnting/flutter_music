import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/util/colors.dart';

class BigDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      color: CommonColors.bigDividerColor,
    );
  }
}

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

Future<T> showLoaderOverlay<T>(BuildContext context, Future<T> data,
    {Duration timeout = const Duration(seconds: 5)}) {
  assert(data != null);

  final Completer<T> completer = Completer.sync();

  final entry = OverlayEntry(builder: (context) {
    return AbsorbPointer(
      child: SafeArea(
        child: Center(
          child: Container(
            height: 160,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Center(
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  });
  Overlay.of(context).insert(entry);
  data
      .then((value) {
        completer.complete(value);
      })
      .timeout(timeout)
      .catchError((e, s) {
        completer.completeError(e, s);
      })
      .whenComplete(() {
        entry.remove();
      });
  return completer.future;
}
