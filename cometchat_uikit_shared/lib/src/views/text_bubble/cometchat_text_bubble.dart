import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cometchat_uikit_shared/cometchat_uikit_shared.dart';
import 'package:url_launcher/url_launcher.dart';

///[CometChatTextBubble] is a widget that gives text bubble
/// ```dart
///                 CometChatTextBubble(
///                        text: 'some text message',
///                        alignment: BubbleAlignment.left,
///                        theme: cometChatTheme,
///                        style: TextBubbleStyle(
///                            background: cometChatTheme.palette.getAccent100()),
///                      );
/// ```
class CometChatTextBubble extends StatelessWidget {
  CometChatTextBubble({
    Key? key,
    this.text,
    this.textMessage,
    this.style = const TextBubbleStyle(),
    this.ctheme,
    this.alignment,
    this.replyPreview,
  }) : super(key: key);

  ///[text] if message object is not passed then text should be passed
  final String? text;

  ///[style] manages the styling of this widget
  final TextBubbleStyle style;

  ///[theme] sets custom theme
  final CometChatTheme? ctheme;

  ///[alignment] of the bubble
  final BubbleAlignment? alignment;

  final TextMessage? textMessage;

  final Widget? replyPreview;

  final RegExp _emailRegex = RegExp(
    RegexConstants.emailRegexPattern,
    caseSensitive: false,
  );
  final RegExp _urlRegex = RegExp(RegexConstants.urlRegexPattern);

  final RegExp _phoneNumberRegex = RegExp(RegexConstants.phoneNumberRegexPattern);

  TextStyle getTextStyle(String word, CometChatTheme theme, BubbleAlignment? alignment) {
    if (_urlRegex.hasMatch(word) || _emailRegex.hasMatch(word) || _phoneNumberRegex.hasMatch(word)) {
      return TextStyle(
          color: alignment == BubbleAlignment.right ? Colors.white : theme.palette.getAccent(),
          fontWeight: theme.typography.body.fontWeight,
          fontSize: theme.typography.body.fontSize,
          fontFamily: theme.typography.body.fontFamily,
          decoration: TextDecoration.underline);
    } else {
      return style.textStyle ??
          TextStyle(
              color: alignment == BubbleAlignment.right ? Colors.white : theme.palette.getAccent(),
              fontWeight: theme.typography.body.fontWeight,
              fontSize: theme.typography.body.fontSize,
              fontFamily: theme.typography.body.fontFamily);
    }
  }

  Future<void> onTapUrl(String url) async {
    if (_urlRegex.hasMatch(url)) {
      if (!RegExp(r'^(https?:\/\/)').hasMatch(url)) {
        url = 'https://$url';
      }
      await launchUrl(Uri.parse(url));
    } else if (_emailRegex.hasMatch(url)) {
      await launchUrl(Uri.parse(('mailto:$url')));
    } else if (_phoneNumberRegex.hasMatch(url)) {
      await launchUrl(Uri.parse(('tel:$url')));
    }
  }

  @override
  Widget build(BuildContext context) {
    String? message;
    if (text != null) {
      message = text;
    }

    if (message == null) {
      return const SizedBox(height: 0, width: 0);
    }
    CometChatTheme theme = ctheme ?? cometChatTheme;

    List<String> words = message.split(' ');

    return Container(
        height: style.height,
        width: style.width,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: const Color(0xff141414).withOpacity(0.14),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(style.borderRadius ?? 14),
            color: style.gradient == null ? style.background ?? Colors.transparent : null,
            gradient: style.gradient),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (textMessage != null &&
                  textMessage!.metadata != null &&
                  textMessage!.metadata!.containsKey('reply-message'))
                replyPreview ??
                    const SizedBox(
                      height: 20,
                    ),
              RichText(
                text: TextSpan(
                    style: style.textStyle ??
                        TextStyle(
                            color: alignment == BubbleAlignment.right ? Colors.white : theme.palette.getAccent(),
                            fontWeight: theme.typography.body.fontWeight,
                            fontSize: theme.typography.body.fontSize,
                            fontFamily: theme.typography.body.fontFamily),
                    children: [
                      for (String word in words)
                        TextSpan(
                            text: word,
                            children: const [TextSpan(text: ' ', style: TextStyle(decoration: TextDecoration.none))],
                            style: getTextStyle(word, theme, alignment),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await onTapUrl(word);
                              })
                    ]),
              ),
            ],
          ),
        ));
  }
}
