import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshWidget extends StatelessWidget {
  final Widget child;
  final Future Function() onRefresh;
  final GlobalKey<RefreshIndicatorState> keyRefresh;

  const RefreshWidget({
    Key? key,
    required this.child,
    required this.onRefresh,
    required this.keyRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? buildAndroidWidget() : buildIosWidget();
  }

  buildIosWidget() {
    return CustomScrollView(
      slivers: [
        Theme(
          data: ThemeData(
            cupertinoOverrideTheme: const CupertinoThemeData(
              brightness: Brightness.dark,
            ),
          ),
          child: CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
          ),
        ),
        SliverToBoxAdapter(
          child: child,
        )
      ],
    );
  }

  buildAndroidWidget() {
    return RefreshIndicator(
      backgroundColor: Colors.black,
      color: const Color(0xFFF9D3B4),
      child: child,
      onRefresh: onRefresh,
    );
  }
}
