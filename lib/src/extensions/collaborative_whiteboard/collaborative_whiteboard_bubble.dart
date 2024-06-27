import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[CometChatCollaborativeWhiteboardBubble] is a widget that is rendered as the content view for [CometChatCollaborativeWhiteboardExtension]
///
/// ```dart
/// CometChatCollaborativeWhiteboardBubble(
///      url: "https://example.com/collaborative-whiteboard",
///      title: "My Collaborative Whiteboard",
///      subtitle: "Edit with your team members",
///      icon: Icon(Icons.document),
///      buttonText: "Edit Now",
///      style: WhiteboardBubbleStyle(
///        background: Colors.grey,
///        iconTint: Colors.white,
///        dividerColor: Colors.black,
///        webViewAppBarColor: Colors.blueGrey,
///        webViewTitleStyle: TextStyle(
///          color: Colors.white,
///          fontWeight: FontWeight.bold,
///        ),
///        webViewBackIconColor: Colors.white,
///      ),
///      theme: CometChatTheme.light(),
///    );
/// ```
///
class CometChatCollaborativeWhiteBoardBubble extends StatelessWidget {
  const CometChatCollaborativeWhiteBoardBubble(
<<<<<<< HEAD
      {Key? key, required this.url, this.title, this.subtitle, this.icon, this.buttonText, this.style, this.ctheme})
      : super(key: key);
=======
      {super.key,
      required this.url,
      this.title,
      this.subtitle,
      this.icon,
      this.buttonText,
      this.style,
      this.theme});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[title] title to be displayed default is 'Collaborative Whiteboard'
  final String? title;

  ///[subtitle] subtitle to be displayed default is 'Open whiteboard to draw together'
  final String? subtitle;

  ///[icon] document icon to be shown on bubble
  final Widget? icon;

  ///[buttonText] button text to be shown default is 'Open Whiteboard'
  final String? buttonText;

  ///[style] whiteboard bubble styling properties
  final WhiteBoardBubbleStyle? style;

  ///[url] url should be passed to open webview
  final String? url;

  ///[theme] sets custom theme
<<<<<<< HEAD
  final CometChatTheme? ctheme;

  @override
  Widget build(BuildContext context) {
    CometChatTheme theme = ctheme ?? cometChatTheme;
    return Container(
      color: style?.background ?? Colors.transparent,
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 65 / 100),
=======
  final CometChatTheme? theme;

  @override
  Widget build(BuildContext context) {
    CometChatTheme theme = this.theme ?? cometChatTheme;
    return Container(
      color: style?.background ?? Colors.transparent,
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 65 / 100),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      child: Column(
        children: [
          ListTile(
            title: Text(
<<<<<<< HEAD
              title ?? Translations.of(context).collaborative_whiteboard,
=======
              title ?? Translations.of(context).collaborativeDocument,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              style: style?.titleStyle ??
                  TextStyle(
                      color: theme.palette.getAccent(),
                      fontSize: theme.typography.text1.fontSize,
                      fontWeight: theme.typography.text1.fontWeight),
            ),
            subtitle: Text(
<<<<<<< HEAD
              subtitle ?? Translations.of(context).open_whiteboard_subtitle,
=======
              subtitle ?? Translations.of(context).openWhiteboardSubtitle,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              style: style?.subtitleStyle ??
                  TextStyle(
                      color: theme.palette.getAccent600(),
                      fontSize: theme.typography.subtitle2.fontSize,
                      fontWeight: theme.typography.subtitle2.fontWeight),
            ),
            trailing: icon ??
                Image.asset(
                  AssetConstants.collaborativeWhiteboard,
                  package: UIConstants.packageName,
                  color: style?.iconTint ?? theme.palette.getAccent700(),
                ),
            tileColor: style?.background ?? theme.palette.getAccent50(),
          ),
          const SizedBox(
            height: 9,
          ),
          Divider(
            height: 0,
            color: style?.dividerColor ?? theme.palette.getAccent500(),
          ),
          GestureDetector(
            onTap: () {
              if (url != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CometChatWebView(
<<<<<<< HEAD
                            title: title ?? Translations.of(context).collaborative_whiteboard,
                            webViewUrl: url!,
                            appBarColor: style?.webViewAppBarColor ?? theme.palette.getBackground(),
                            webViewStyle: WebViewStyle(
                              backIconColor: style?.webViewBackIconColor ?? theme.palette.getPrimary(),
                              titleStyle: style?.webViewTitleStyle ??
                                  TextStyle(
                                      color: theme.palette.getAccent(),
                                      fontSize: theme.typography.heading.fontSize,
                                      fontWeight: theme.typography.heading.fontWeight),
=======
                            title: title ??
                                Translations.of(context).collaborativeDocument,
                            webViewUrl: url!,
                            appBarColor: style?.webViewAppBarColor ??
                                theme.palette.getBackground(),
                            webViewStyle: WebViewStyle(
                              backIconColor: style?.webViewBackIconColor ??
                                  theme.palette.getPrimary(),
                              titleStyle: style?.webViewTitleStyle ??
                                  TextStyle(
                                      color: theme.palette.getAccent(),
                                      fontSize:
                                          theme.typography.heading.fontSize,
                                      fontWeight:
                                          theme.typography.heading.fontWeight),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                            ))));
              }
            },
            child: SizedBox(
              height: 30,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
<<<<<<< HEAD
                  buttonText ?? Translations.of(context).open_whiteboard,
=======
                  buttonText ?? Translations.of(context).openWhiteboard,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                  style: style?.buttonTextStyle ??
                      TextStyle(
                          color: theme.palette.getPrimary(),
                          fontSize: theme.typography.name.fontSize,
                          fontWeight: theme.typography.name.fontWeight),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
