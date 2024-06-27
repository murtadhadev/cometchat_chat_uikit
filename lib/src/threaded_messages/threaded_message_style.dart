import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[ThreadedMessageStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatThreadedMessages]
class ThreadedMessageStyle extends BaseStyles {
  ///[closeIconTint] sets color for close icon
  final Color? closeIconTint;

  ///[titleStyle] sets TextStyle for title
  final TextStyle? titleStyle;

<<<<<<< HEAD
  const ThreadedMessageStyle(
      {double? width,
      double? height,
      Color? background,
      BoxBorder? border,
      double? borderRadius,
      Gradient? gradient,
      this.titleStyle,
      this.closeIconTint})
      : super(
            width: width,
            height: height,
            background: background,
            border: border,
            borderRadius: borderRadius,
            gradient: gradient);
=======
  const ThreadedMessageStyle({
    super.width,
    super.height,
    super.background,
    super.border,
    super.borderRadius,
    super.gradient,
    this.titleStyle,
    this.closeIconTint,
  });
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}
