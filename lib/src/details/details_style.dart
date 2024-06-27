import 'package:flutter/material.dart';

import '../../cometchat_chat_uikit.dart';

///[DetailsStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatDetails]
class DetailsStyle extends BaseStyles {
  const DetailsStyle(
      {this.titleStyle,
      this.closeIconTint,
      this.privateGroupIconBackground,
      this.protectedGroupIconBackground,
      this.onlineStatusColor,
      double? width,
<<<<<<< HEAD
      double? height,
      Color? background,
      Gradient? gradient,
      Border? border})
      : super(
            height: height,
            background: background,
            gradient: gradient,
            border: border);
=======
      super.height,
      super.background,
      super.gradient,
      Border? super.border});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[titleStyle] provides styling for title text
  final TextStyle? titleStyle;

  ///[closeIconTint] provide color to close button
  final Color? closeIconTint;

  ///[privateGroupIconBackground] provides background color for status indicator if group is private
  final Color? privateGroupIconBackground;

  ///[protectedGroupIconBackground] provides background color for status indicator if group is protected
  final Color? protectedGroupIconBackground;

  ///[onlineStatusColor] set online status color
  final Color? onlineStatusColor;
}
