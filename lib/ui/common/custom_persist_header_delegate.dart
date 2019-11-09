import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomPersistHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double customMaxExtent;
  final double customMinExtent;
  final bool customShouldRebuild;

  CustomPersistHeaderDelegate({
    @required this.child,
    this.customMaxExtent = kToolbarHeight,
    this.customMinExtent = kToolbarHeight,
    this.customShouldRebuild = false,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      customShouldRebuild;
}
