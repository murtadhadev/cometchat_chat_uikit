import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

class UIStyle extends BaseStyles {
  UIStyle({
    this.iconTint,
    this.titleStyle,
    this.activeTitleStyle,
    this.activeBackground,
    this.activeIconColor,
    this.barBackgroundColor,
<<<<<<< HEAD
    double? width,
    double? height,
    Color? background,
    Gradient? gradient,
    Border? border,
  }) : super(
            width: width,
            height: height,
            background: background,
            gradient: gradient,
            border: border);
=======
    super.width,
    super.height,
    super.background,
    super.gradient,
    Border? super.border,
  });
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[iconTint] customize color of tab item icon
  final Color? iconTint;

  ///[titleStyle]	used to set style to the title
  final TextStyle? titleStyle;

  ///[activeTitleStyle] used to set text style of the active tab item
  final TextStyle? activeTitleStyle;

  ///[activeIconColor] used to set icon color of the active tab item
  final Color? activeIconColor;

  ///[activeBackground] Color activeBackground used to set background color of the active tab item
  final Color? activeBackground;

  ///[barBackgroundColor]	used to set background color of the bottom navigation bar
  final Color? barBackgroundColor;
}
