import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///[CometChatCollaborativeWebView] is widget that renders a WebView
class CometChatCollaborativeWebView extends StatefulWidget {
  const CometChatCollaborativeWebView(
<<<<<<< HEAD
      {Key? key,
=======
      {super.key,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      required this.title,
      required this.webviewUrl,
      this.titleStyle,
      this.backIcon,
      this.appBarColor,
<<<<<<< HEAD
      this.backIconColor})
      : super(key: key);
=======
      this.backIconColor});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[title] of the page
  final String title;

  ///[titleStyle]  text style
  final TextStyle? titleStyle;

  ///WebView package use [webviewUrl] to render page
  final String webviewUrl;

  ///[backIcon] displays back  Icon
  final Icon? backIcon;

  ///[appBarColor] , default is Color(0xffFFFFFF)
  final Color? appBarColor;

  ///[backIconColor] , default is Color(0xff3399FF)
  final Color? backIconColor;

  @override
<<<<<<< HEAD
  _CometChatCollaborativeWebViewState createState() =>
=======
  State<CometChatCollaborativeWebView> createState() =>
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      _CometChatCollaborativeWebViewState();
}

class _CometChatCollaborativeWebViewState
    extends State<CometChatCollaborativeWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColor ?? const Color(0xffFFFFFF),
        elevation: 0,
        toolbarHeight: 56,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: widget.backIcon ??
              Icon(
                Icons.close,
                size: 24,
                color: widget.backIconColor ?? const Color(0xff3399FF),
              ),
        ),
        title: Text(
          widget.title,
          style: widget.titleStyle ??
              const TextStyle(
                  color: Color(0xff141414),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
        ),
      ),
      body: WebViewWidget(
<<<<<<< HEAD
          // initialUrl: widget.webviewUrl,
          controller: WebViewController()
            ..loadRequest(Uri.parse(widget.webviewUrl))
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
          // javascriptMode: ,
          ),
=======
          controller: WebViewController()
            ..loadRequest(Uri.parse(widget.webviewUrl))
            ..setJavaScriptMode(JavaScriptMode.unrestricted)),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    );
  }
}
