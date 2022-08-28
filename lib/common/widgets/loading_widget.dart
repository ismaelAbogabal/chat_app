import 'dart:io';

import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.withBackground = false})
      : super(key: key);

  final bool withBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: withBackground ? Theme.of(context).scaffoldBackgroundColor : null,
      alignment: Alignment.center,
      child: const MiniLoadingWidget(),
    );
  }
}

/// return only loading widget
class MiniLoadingWidget extends StatelessWidget {
  const MiniLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const CircularProgressIndicator()
        : const CupertinoActivityIndicator();
  }
}
