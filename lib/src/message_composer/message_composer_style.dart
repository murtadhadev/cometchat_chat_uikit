import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[MessageComposerStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatMessageComposer]
class MessageComposerStyle extends BaseStyles {
  const MessageComposerStyle({
    this.inputBackground,
    this.inputTextStyle,
    this.inputGradient,
    this.placeholderTextStyle,
    this.sendButtonIcon,
    this.attachmentIconTint,
    this.sendButtonIconTint,
    this.closeIconTint,
    this.dividerTint,
    this.voiceRecordingIconTint,
    this.contentPadding,
    this.aiIconTint,
<<<<<<< HEAD
    this.replyTitle,
    this.replySubTitle,
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
    this.messageInputPadding,
    super.width,
    super.height,
    super.background,
    super.border,
    super.borderRadius,
    super.gradient,
  });
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[inputBackground] background color of text field
  final Color? inputBackground;

  ///[inputTextStyle] provides style to input text
  final TextStyle? inputTextStyle;

  ///[inputGradient] provides gradient background to the input field
  final Gradient? inputGradient;

  ///[placeholderTextStyle] hint text style
  final TextStyle? placeholderTextStyle;

  ///[sendButtonIcon] custom send button icon
  final Widget? sendButtonIcon;

  ///[attachmentIconTint] provides color to the attachment Icon/widget
  final Color? attachmentIconTint;

  ///[sendButtonIconTint] provides color to the sendButton Icon/widget
  final Color? sendButtonIconTint;

  ///[closeIconTint] provides color to the close Icon/widget
  final Color? closeIconTint;

  ///[dividerTint] provides color to the divider
  final Color? dividerTint;

  ///[voiceRecordingIconTint] provides color to the voice recording icon
  final Color? voiceRecordingIconTint;

  ///[contentPadding] sets the content padding for message composer
  final EdgeInsetsGeometry? contentPadding;

  ///[aiIconTint] sets the tint to ai icon
  final Color? aiIconTint;

<<<<<<< HEAD
  final TextStyle? replyTitle;
  final TextStyle? replySubTitle;
=======
  ///[messageInputPadding] sets the padding to the message input field
  final EdgeInsets? messageInputPadding;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}
