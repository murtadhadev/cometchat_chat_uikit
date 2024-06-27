import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[MessageHeaderStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatMessageHeader]
class MessageHeaderStyle extends BaseStyles {
  ///message header style components
  const MessageHeaderStyle({
    this.backButtonIconTint,
    this.onlineStatusColor,
    this.subtitleTextStyle,
    this.typingIndicatorTextStyle,
<<<<<<< HEAD
    double? width,
    double? height,
    Color? background,
    BoxBorder? border,
    double? borderRadius,
    Gradient? gradient,
  }) : super(
            width: width,
            height: height,
            background: background,
            border: border,
            borderRadius: borderRadius,
            gradient: gradient);
=======
    super.width,
    super.height,
    super.background,
    super.border,
    super.borderRadius,
    super.gradient,
  });
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[backButtonIconTint] provides color to back button
  final Color? backButtonIconTint;

  ///[typingIndicatorTextStyle] is text style for setting typing indicator text
  final TextStyle? typingIndicatorTextStyle;

  ///[subtitleTextStyle] is textStyle for setting subtitle text style
  final TextStyle? subtitleTextStyle;

  ///[onlineStatusColor] sets online status color
  final Color? onlineStatusColor;
}
