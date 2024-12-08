import 'package:cometchat_uikit_shared/cometchat_uikit_shared.dart';
import 'package:flutter/material.dart';

///[MessageBubbleStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatMessageBubble]
class MessageBubbleStyle extends BaseStyles {
  ///[MessageBubbleStyle] constructor requires [width], [height], [background], [border], [borderRadius], [gradient] and [contentPadding] while initializing.
  const MessageBubbleStyle(
      {super.width,
      super.height,
      super.background,
      super.border,
      super.borderRadius,
      super.gradient,
      this.widthFlex,
      this.contentPadding});

  ///[contentPadding] sets padding for the bubble
  final EdgeInsets? contentPadding;

  ///[widthFlex] gives flex to the message bubble
  final double? widthFlex;
}
