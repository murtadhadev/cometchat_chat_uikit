import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[MessageListStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatMessageList]
class MessageListStyle extends BaseStyles {
  const MessageListStyle({
    this.loadingIconTint,
    this.emptyTextStyle,
    this.errorTextStyle,
    this.contentPadding,
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

  ///[loadingIconTint] provides color to loading icon
  final Color? loadingIconTint;

  ///[emptyTextStyle] provides styling for text to indicate message list is empty
  final TextStyle? emptyTextStyle;

  ///[errorTextStyle] provides styling for text to indicate some error has occured while fetching the message list
  final TextStyle? errorTextStyle;

  final EdgeInsetsGeometry? contentPadding;
}
