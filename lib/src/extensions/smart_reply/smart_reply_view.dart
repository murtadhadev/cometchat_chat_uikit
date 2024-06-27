import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[SmartReplyView] is a widget that is rendered as the content view for [SmartReplyExtension]
///
///```dart
/// SmartReplyView(
///   replies: ['Yes', 'No', 'Maybe'],
///   style: SmartReplyStyle(
///     replyBackgroundColor: Colors.grey[200]!,
///     replyTextStyle: TextStyle(
///       color: Colors.black,
///       fontWeight: FontWeight.bold,
///       fontSize: 14,
///     ),
///   ),
///   onCloseTap: () {
///     print('Closing smart reply view');
///   },
///   onClick: (reply) {
///     print('Selected reply: $reply');
///   },
///   theme: CometChatTheme(),
/// );
/// ```
///
class SmartReplyView extends StatelessWidget {
  const SmartReplyView(
<<<<<<< HEAD
      {Key? key, required this.replies, this.style, required this.onCloseTap, this.onClick, this.ctheme})
      : super(key: key);
=======
      {super.key,
      required this.replies,
      this.style,
      required this.onCloseTap,
      this.onClick,
      this.theme});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[replies] list of replies generated from extension or passed by developer
  final List<String> replies;

  ///[style] provides styling to the reply chips/bubbles
  final SmartReplyStyle? style;

  ///[onCloseTap] overrides the default functionality of closing the reply view
  final void Function() onCloseTap;

  ///[onClick] overrides the default functionality of selecting the tapped reply
  final void Function(String)? onClick;

  ///[theme] sets custom theme
<<<<<<< HEAD
  final CometChatTheme? ctheme;

  @override
  Widget build(BuildContext context) {
    //List<String> replies = replies;
    CometChatTheme theme = ctheme ?? cometChatTheme;
=======
  final CometChatTheme? theme;

  @override
  Widget build(BuildContext context) {
    List<String> replies = this.replies;
    CometChatTheme theme = this.theme ?? cometChatTheme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    if (replies.isEmpty) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }

    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (String reply in replies)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    if (onClick != null) {
                      onClick!(reply);
                    }
                  },
                  child: Chip(
<<<<<<< HEAD
                    backgroundColor: style?.replyBackgroundColor ?? theme.palette.getBackground(),
                    elevation: 4,
                    shadowColor: style?.shadowColor ?? theme.palette.getBackground().withOpacity(0.8),
=======
                    backgroundColor: style?.replyBackgroundColor ??
                        theme.palette.getBackground(),
                    elevation: 4,
                    shadowColor: style?.shadowColor ??
                        theme.palette.getBackground().withOpacity(0.8),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                    label: Text(
                      reply,
                      style: style?.replyTextStyle ??
                          TextStyle(
                              fontSize: theme.typography.subtitle1.fontSize,
                              fontWeight: theme.typography.subtitle1.fontWeight,
                              color: theme.palette.getAccent()),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  onCloseTap();
                },
                child: Image.asset(
                  AssetConstants.close,
                  package: UIConstants.packageName,
<<<<<<< HEAD
                  color: style?.closeIconColor ?? theme.palette.getAccent().withOpacity(0.40),
=======
                  color: style?.closeIconColor ??
                      theme.palette.getAccent().withOpacity(0.40),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
