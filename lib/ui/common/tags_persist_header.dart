import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/ui/common/tag_widget.dart';

class TagsPersistHeaderSliver extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              TagWidget(tagName: 'Summer'),
              TagWidget(tagName: 'T-Shirts'),
              TagWidget(tagName: 'Sleeveless'),
              TagWidget(tagName: 'Crop tops'),
              TagWidget(tagName: 'Shirts'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
