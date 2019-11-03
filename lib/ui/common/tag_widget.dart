import 'package:flutter/cupertino.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/res/colors.dart';

class TagWidget extends StatelessWidget {
  final String tagName;

  const TagWidget({
    Key key,
    this.tagName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30.0,
        decoration: BoxDecoration(
          color: _isDark ? colorWhite_dark : colorBlack_light,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Text(tagName ?? '',
                style: TextStyle(
                  fontSize: 14.0,
                  color: _isDark ? colorDark_dark : colorWhite_light,
                )),
          ),
        ),
      ),
    );
  }
}
