import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[MessageTranslationBubble] is a widget that is rendered as the content view for [MessageTranslationExtension]
///
/// ```dart
/// MessageTranslationBubble(
///   translatedText: "¡Hola mundo!",
///   alignment: BubbleAlignment.right,
///   style: MessageTranslationBubbleStyle(
///     translatedTextStyle: TextStyle(
///       fontSize: 16,
///       fontWeight: FontWeight.bold,
///       color: Colors.black,
///     ),
///   ),
/// );
///
/// ```
class MessageTranslationBubble extends StatelessWidget {
  const MessageTranslationBubble(
<<<<<<< HEAD
      {Key? key, this.translatedText = "", this.ctheme, required this.alignment, this.child, this.style})
      : super(key: key);
=======
      {super.key,
      this.translatedText = "",
      this.theme,
      required this.alignment,
      this.child,
      this.style});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[translatedText] translated version of messageText
  final String translatedText;

  ///[theme] sets custom theme
<<<<<<< HEAD
  final CometChatTheme? ctheme;
=======
  final CometChatTheme? theme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[alignment] of the bubble
  final BubbleAlignment alignment;

  ///[child] some child component
  final Widget? child;

  ///[style] styles this bubble
  final MessageTranslationBubbleStyle? style;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    CometChatTheme theme = ctheme ?? cometChatTheme;
=======
    CometChatTheme theme = this.theme ?? cometChatTheme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (child != null) child!,
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
          child: Text(
            translatedText,
            style: style?.translatedTextStyle ??
                TextStyle(
                    color: alignment == BubbleAlignment.right
                        ? Colors.white.withOpacity(.8)
                        : theme.palette.getAccent600(),
                    fontWeight: theme.typography.subtitle2.fontWeight,
                    fontSize: theme.typography.subtitle2.fontSize,
                    fontFamily: theme.typography.subtitle2.fontFamily),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
          child: Text(
            'Translated message.',
            style: style?.infoTextStyle ??
                TextStyle(
                    color: alignment == BubbleAlignment.right
                        ? Colors.white.withOpacity(.6)
                        : theme.palette.getAccent400(),
                    fontWeight: FontWeight.w400,
                    fontSize: theme.typography.caption2.fontSize,
                    fontFamily: theme.typography.caption2.fontFamily),
          ),
        ),
      ],
<<<<<<< HEAD
      // ),
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    );
  }
}
