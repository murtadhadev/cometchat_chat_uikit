import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[AISmartRepliesView] is a widget that is rendered as the content view for [AISmartRepliesExtension]
///
///```dart
/// AiSmartReplyView(
///   style: AiSmartReplyStyle(
///     replyTextStyle: TextStyle(
///       color: Colors.black,
///       fontWeight: FontWeight.bold,
///       fontSize: 14,
///     ),
///   ),
///   theme: CometChatTheme(),
/// );
/// ```
///

class AISmartRepliesView extends StatefulWidget {
<<<<<<< HEAD
  const AISmartRepliesView({
    Key? key,
    this.user,
    this.group,
    this.style,
    this.theme,
    this.onError,
    this.emptyStateText,
    this.errorStateText,
    this.customView,
    this.loadingStateText,
    this.loadingIconUrl,
    this.loadingStateView,
    this.errorIconUrl,
    this.errorStateView,
    this.emptyStateView,
    this.emptyIconUrl,
    this.loadingIconPackageName,
    this.emptyIconPackageName,
    this.errorIconPackageName,
    this.apiConfiguration
  }) : super(key: key);
=======
  const AISmartRepliesView(
      {super.key,
      this.user,
      this.group,
      this.style,
      this.theme,
      this.onError,
      this.emptyStateText,
      this.errorStateText,
      this.customView,
      this.loadingStateText,
      this.loadingIconUrl,
      this.loadingStateView,
      this.errorIconUrl,
      this.errorStateView,
      this.emptyStateView,
      this.emptyIconUrl,
      this.loadingIconPackageName,
      this.emptyIconPackageName,
      this.errorIconPackageName,
      this.apiConfiguration});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[style] provides styling to the reply view
  final AISmartRepliesStyle? style;

  ///[theme] sets custom theme
  final CometChatTheme? theme;

  ///[user] user object to show replies
  final User? user;

  ///[group] group object to show replies
  final Group? group;

  ///[emptyStateText] text to be displayed when the replies are empty
  final String? emptyStateText;

  ///[errorStateText] text to be displayed when we get an error
  final String? errorStateText;

  ///[onError] callback triggered in case any error happens when fetching replies
  final OnError? onError;

  ///[customView] gives smartReply view
  final Widget Function(List<String> replies, BuildContext context)? customView;

  ///[loadingStateText] text to be displayed when loading occur
  final String? loadingStateText;

  ///[emptyStateView] returns view fow empty state
  final WidgetBuilder? emptyStateView;

  ///[loadingStateView] returns view for loading state
  final WidgetBuilder? loadingStateView;

  ///[errorStateView] returns view for error state
  final WidgetBuilder? errorStateView;

  ///[errorIconUrl] used to set the error icon
  final String? errorIconUrl;

  ///[emptyIconUrl] used to set the empty icon
  final String? emptyIconUrl;

  ///[loadingIconUrl] used to set the loading icon
  final String? loadingIconUrl;

  ///[loadingIconPackageName] package name for loading icon to be displayed when loading state
  final String? loadingIconPackageName;

  ///[errorIconPackageName] package name for error icon to be displayed when error occur
  final String? errorIconPackageName;

  ///[emptyIconPackageName] package name for empty icon to be displayed when empty state
  final String? emptyIconPackageName;

  ///[apiConfiguration] sets the api configuration for smart replies
<<<<<<< HEAD
  final Map<String , dynamic>? apiConfiguration;



=======
  final Map<String, dynamic>? apiConfiguration;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  @override
  State<AISmartRepliesView> createState() => _AISmartRepliesViewState();
}

class _AISmartRepliesViewState extends State<AISmartRepliesView> {
  List<String> _replies = [];

  bool isLoading = false;

  bool isError = false;

  late CometChatTheme _theme;

  @override
  void initState() {
<<<<<<< HEAD
    // TODO: implement initState
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    getReply();
    super.initState();
  }

  getReply() async {
    _theme = widget.theme ?? cometChatTheme;
    _replies = await getReplies();
  }

  Future<List<String>> getReplies() async {
    setState(() {
      isLoading = true;
    });
    String receiverId = "";
    String receiverType = "";
    if (widget.user != null) {
      receiverId = widget.user!.uid;
      receiverType = CometChatReceiverType.user;
    } else if (widget.group != null) {
      receiverId = widget.group!.guid;
      receiverType = CometChatReceiverType.group;
    }
    Map<String, String> smartReplies = {};
    List<String> aiReplies = [];
    await CometChat.getSmartReplies(receiverId, receiverType,
<<<<<<< HEAD
        configuration: widget.apiConfiguration,
        onSuccess: (reply) {
=======
        configuration: widget.apiConfiguration, onSuccess: (reply) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      smartReplies = reply;
      if (smartReplies.containsKey("negative")) {
        aiReplies.add(smartReplies["negative"] ?? "");
      }
      if (smartReplies.containsKey("positive")) {
        aiReplies.add(smartReplies["positive"] ?? "");
      }
      if (smartReplies.containsKey("neutral")) {
        aiReplies.add(smartReplies["neutral"] ?? "");
      }
    }, onError: (error) {
      if (kDebugMode) {
        debugPrint("Error in AI smart replies : ${error.message}");
      }
      setState(() {
        isError = true;
      });
    });
    setState(() {
      isLoading = false;
    });
    return aiReplies;
  }

  Widget _getOnError(BuildContext context, CometChatTheme theme) {
    if (widget.errorStateView != null) {
      return Center(
        child: widget.errorStateView!(context),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              widget.errorIconUrl ?? AssetConstants.repliesError,
<<<<<<< HEAD
              package: widget.errorIconPackageName?? UIConstants.packageName,
=======
              package: widget.errorIconPackageName ?? UIConstants.packageName,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              color:
                  widget.style?.emptyIconTint ?? _theme.palette.getAccent700(),
            ),
            Text(
              widget.errorStateText ??
<<<<<<< HEAD
                  Translations.of(context).something_went_wrong_error,
=======
                  Translations.of(context).somethingWentWrongError,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              style: widget.style?.errorTextStyle ??
                  TextStyle(
                    fontSize: _theme.typography.title1.fontSize,
                    fontWeight: _theme.typography.title1.fontWeight,
                    color: _theme.palette.getAccent400(),
                  ),
            ),
          ],
        ),
      );
    }
  }

  Widget _getEmptyView(BuildContext context) {
    if (widget.emptyStateView != null) {
      return Center(child: widget.emptyStateView!(context));
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            widget.emptyIconUrl ?? AssetConstants.repliesEmpty,
<<<<<<< HEAD
            package:widget.emptyIconPackageName?? UIConstants.packageName,
=======
            package: widget.emptyIconPackageName ?? UIConstants.packageName,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            color: widget.style?.emptyIconTint ?? _theme.palette.getAccent700(),
          ),
          Center(
            child: Text(
<<<<<<< HEAD
              widget.emptyStateText ??
                  Translations.of(context).no_messages_found,
=======
              widget.emptyStateText ?? Translations.of(context).noMessagesFound,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              style: widget.style?.emptyTextStyle ??
                  TextStyle(
                    fontSize: _theme.typography.title1.fontSize,
                    fontWeight: _theme.typography.title1.fontWeight,
                    color: _theme.palette.getAccent400(),
                  ),
            ),
          ),
        ],
      );
    }
  }

  Widget _getLoadingIndicator() {
    if (widget.loadingStateView != null) {
      return Center(child: widget.loadingStateView!(context));
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.loadingIconUrl ?? AssetConstants.spinner,
<<<<<<< HEAD
            package:widget.loadingIconPackageName?? UIConstants.packageName,
=======
            package: widget.loadingIconPackageName ?? UIConstants.packageName,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            color:
                widget.style?.loadingIconTint ?? _theme.palette.getAccent600(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.loadingStateText ??
<<<<<<< HEAD
                Translations.of(context).generating_replies,
=======
                Translations.of(context).generatingReplies,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            style: widget.style?.loadingTextStyle ??
                TextStyle(
                    fontSize: _theme.typography.subtitle1.fontSize,
                    fontWeight: _theme.typography.subtitle1.fontWeight,
                    color: _theme.palette.getAccent()),
          ),
        ],
      );
    }
  }

  onClickReply(String reply) async {
    Map<String, dynamic> id = {};
    String receiverId = "";
    if (widget.user != null) {
      receiverId = widget.user!.uid;
    } else if (widget.group != null) {
      receiverId = widget.group!.guid;
    }
    id['uid'] = receiverId;
    id['guid'] = receiverId;
    CometChatUIEvents.hidePanel(id, CustomUIPosition.composerBottom);

    CometChatUIEvents.ccComposeMessage(reply, MessageEditStatus.inProgress);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.maxFinite,
      color: widget.style?.backgroundColor ?? _theme.palette.getBackground(),
      child: isLoading
<<<<<<< HEAD
          // --- on Loading ---
          ? _getLoadingIndicator()
          :
          // ---on error---
          isError
              ? _getOnError(context, _theme)
              :
              // --- empty replies state ----
              _replies.isEmpty
                  ? _getEmptyView(context)
                  // ---- View of smart replies ------
=======
          ? _getLoadingIndicator()
          : isError
              ? _getOnError(context, _theme)
              : _replies.isEmpty
                  ? _getEmptyView(context)
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                  : (widget.customView != null)
                      ? widget.customView!(_replies, context)
                      : SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListView.separated(
                                itemCount: _replies.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, int item) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 8, right: 8, bottom: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        onClickReply(_replies[item]);
                                      },
                                      child: Text(
                                        _replies[item],
                                        style: widget.style?.replyTextStyle ??
                                            TextStyle(
                                              fontSize: _theme
                                                  .typography.title2.fontSize,
                                              fontWeight: _theme
                                                  .typography.title2.fontWeight,
                                              color:
                                                  _theme.palette.getAccent800(),
                                            ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (_, int i) {
                                  return Divider(
                                    color: widget.style?.dividerTint ??
                                        _theme.palette.getAccent500(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
    );
  }
}
