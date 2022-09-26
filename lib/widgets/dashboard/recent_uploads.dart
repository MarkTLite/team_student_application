import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../models/Articles/recentArticle_model.dart';
import 'article_widget.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class CustomTrendingBar extends StatelessWidget {
  CustomTrendingBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 20,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.items,
    this.onItemSelected,
    this.curve = Curves.linear,
    this.column = false,
  }) : super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<RecentArticleModel>? items;
  final ValueChanged<int>? onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;
  final bool column;

// ScrollBehavior can be set for a specific widget.
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: containerHeight,
      padding: const EdgeInsets.only(bottom: 10),
      child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView(
            controller: controller,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal, // scrollable
            padding: const EdgeInsets.all(10),
            children: items!.map((item) {
              var index = items!.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected!(index),
                child: UploadWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: Color(0xFF222232),
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          )),
    );
  }
}
