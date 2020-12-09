import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/src/bubble_selection_painter.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isActive;
  final double bubbleRadius;
  final double maxBubbleRadius;
  final Color bubbleColor;
  final Color activeColor;
  final Color inactiveColor;
  final IconData iconData;
  final Widget iconItem;
  final double iconScale;
  final double iconSize;
  final VoidCallback onTap;

  NavigationBarItem({
    this.isActive,
    this.bubbleRadius,
    this.maxBubbleRadius,
    this.bubbleColor,
    this.activeColor,
    this.inactiveColor,
    this.iconItem,
    this.iconData,
    this.iconScale,
    this.iconSize,
    this.onTap,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: BubblePainter(
            bubbleRadius: isActive ? bubbleRadius : 0,
            bubbleColor: bubbleColor,
            maxBubbleRadius: maxBubbleRadius,
          ),
          child: InkWell(
            child: Transform.scale(
              scale: isActive ? iconScale : 1,
              child: IconTheme(
                data: IconThemeData(
                  color: isActive ? activeColor : inactiveColor,
                  size: iconSize,
                ),
                child: iconItem == null ?
                  Icon(iconData) :
                  DefaultTextStyle(
                    style: TextStyle(color: isActive ? activeColor : inactiveColor),
                    child: iconItem
                  ),
              ),
            ),
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class GapItem extends StatelessWidget {
  final double width;

  GapItem({this.width});

  @override
  Widget build(BuildContext context) => Container(width: width);
}
