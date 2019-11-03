import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/common/list_view_type.dart';
import 'package:shop_app/ui/res/colors.dart';

class FilterPersistHeaderSliver extends SliverPersistentHeaderDelegate {
  final ListViewType viewType;
  final VoidCallback onChangeViewType;

  FilterPersistHeaderSliver({
    this.viewType,
    this.onChangeViewType,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            FlatButton(
              textColor: _isDark ? colorWhite_dark : colorBlack_light,
              child: Row(
                children: <Widget>[
                  Icon(Icons.filter_list),
                  Text('Фильтр'),
                ],
              ),
              onPressed: () {},
            ),
            Spacer(),
            FlatButton(
              textColor: _isDark ? colorWhite_dark : colorBlack_light,
              child: Row(
                children: <Widget>[
                  Icon(Icons.sort_by_alpha),
                  Text('Сортировка'),
                ],
              ),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(viewType == ListViewType.grid
                  ? Icons.view_list
                  : Icons.view_module),
              onPressed: onChangeViewType,
            ),
          ],
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
