import 'package:flutter/material.dart';

import '../../models/Articles/recentArticle_model.dart';

class UploadWidget extends StatelessWidget {
  final double? iconSize;
  final bool isSelected;
  final RecentArticleModel item;
  final Color? backgroundColor;
  final Duration animationDuration;
  final Curve curve;

  const UploadWidget({
    Key? key,
    required this.item,
    this.isSelected = false,
    this.backgroundColor,
    required this.animationDuration,
    this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        height: 360,
        padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
        margin: EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFFFFFFFF)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage(item.image),
                        fit: BoxFit.cover)), //NetworkImage(item.image),
                width: 283,
                height: 210),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    item.category,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Color(0xFF0A1D65)),
                  ),
                ),
                Container(
                  width: 150,
                  margin: EdgeInsets.only(top: 3, bottom: 3),
                  child: Row(
                    children: [
                      Icon(Icons.timelapse, color: Color(0xFF0A1D65)),
                      Text("  " + item.date,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              color: Color(0xFF0A1D65))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(item.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          color: Color(0xFF0A1D65))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(item.summary,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: Color(0xFF0A1D65))),
                )
              ],
            )
          ],
        ));
  }
}
