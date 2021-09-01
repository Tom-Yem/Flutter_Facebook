import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false})
      : super(key: key);

  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? Border(
                bottom: BorderSide(color: Palette.facebookBlue, width: 3.0),
              )
            : Border(
                top: BorderSide(color: Palette.facebookBlue, width: 3.0),
              ),
      ),
      tabs: icons
          .asMap()
          .map(
            (i, icon) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  icon,
                  color: i == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
