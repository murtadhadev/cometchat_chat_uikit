import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

import '../ai_utils.dart';

///[AIConversationSummaryView] is a widget that is rendered as the content view for [AIConversationSummaryView]
///```dart
/// AIConversationSummaryView(
///   style: AiConversationStarterStyle(),
///   user: User(),
///   emptyStateText: Text("Error occurred"),
///   loadingStateView: Text("Loading..."),
///   theme: CometChatTheme(),
///   )
/// ```

class AIConversationSummaryView extends StatefulWidget {
<<<<<<< HEAD
  const AIConversationSummaryView({
    Key? key,
    this.user,
    this.group,
    this.aiConversationSummaryStyle,
    this.title,
    this.customView,
    this.errorIconUrl,
    this.theme,
    this.loadingStateText,
    this.loadingIconUrl,
    this.loadingStateView,
    this.errorStateView,
    this.emptyStateView,
    this.emptyIconUrl,
    this.onCloseIconTap,
    this.emptyStateText,
    this.errorStateText,
    this.errorIconPackageName,
    this.emptyIconPackageName,
    this.loadingIconPackageName,
    this.apiConfiguration
  }) : super(key: key);
=======
  const AIConversationSummaryView(
      {super.key,
      this.user,
      this.group,
      this.aiConversationSummaryStyle,
      this.title,
      this.customView,
      this.errorIconUrl,
      this.theme,
      this.loadingStateText,
      this.loadingIconUrl,
      this.loadingStateView,
      this.errorStateView,
      this.emptyStateView,
      this.emptyIconUrl,
      this.onCloseIconTap,
      this.emptyStateText,
      this.errorStateText,
      this.errorIconPackageName,
      this.emptyIconPackageName,
      this.loadingIconPackageName,
      this.apiConfiguration});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  /// set [User] object, one is mandatory either [user] or [group]
  final User? user;

  ///set [Group] object, one is mandatory either [user] or [group]
  final Group? group;

  final String? title;

  ///[aiConversationSummaryStyle] provides styling to the reply chips/bubbles
  final AIConversationSummaryStyle? aiConversationSummaryStyle;

  ///[theme] sets custom theme
  final CometChatTheme? theme;

  ///[loadingStateText] text to be displayed when loading occur
  final String? loadingStateText;

  ///[customView] gives conversation starter view
  final Widget Function(String summary, BuildContext context)? customView;

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

  ///[onCloseIconTap] used to set the loading icon
  final Function(Map<String, dynamic> id)? onCloseIconTap;

  ///[configuration] used to set the error state text
  final String? errorStateText;

  ///[loadingStateText] used to set the empty state text
  final String? emptyStateText;

  ///[errorIconPackageName] used to set the error icon package name
  final String? errorIconPackageName;

  ///[loadingIconPackageName] used to set the loading icon package name
  final String? loadingIconPackageName;

  ///[emptyIconPackageName] used to set the empty icon package name
  final String? emptyIconPackageName;

  ///[apiConfiguration] sets the api configuration for ai summary view
<<<<<<< HEAD
  final Map<String , dynamic>? apiConfiguration;


=======
  final Map<String, dynamic>? apiConfiguration;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  @override
  State<AIConversationSummaryView> createState() =>
      _AIConversationSummaryViewState();
}

class _AIConversationSummaryViewState extends State<AIConversationSummaryView>
    with WidgetsBindingObserver {
  String _summary = "";

  bool isLoading = false;

  bool isError = false;

  bool isKeyboardOpen = false;

  CometChatTheme _theme = cometChatTheme;

  late DecoratedContainerStyle defaultContainerStyle;

<<<<<<< HEAD

  @override
  void initState() {

    _theme = widget.theme??cometChatTheme;
=======
  @override
  void initState() {
    _theme = widget.theme ?? cometChatTheme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    getSummary();
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    defaultContainerStyle = DecoratedContainerStyle(
        background: _theme.palette.getBackground(),
        titleStyle: TextStyle(
<<<<<<< HEAD
          color:_theme.palette.getAccent(),
          fontWeight:_theme.typography.name.fontWeight,
=======
          color: _theme.palette.getAccent(),
          fontWeight: _theme.typography.name.fontWeight,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          fontSize: _theme.typography.name.fontSize,
          fontFamily: _theme.typography.name.fontFamily,
        ),
        contentStyle: TextStyle(
          color: _theme.palette.getAccent700(),
<<<<<<< HEAD
          fontWeight:_theme.typography.body.fontWeight,
          fontSize: _theme.typography.body.fontSize,
          fontFamily: _theme.typography.body.fontFamily,
        )
    );
=======
          fontWeight: _theme.typography.body.fontWeight,
          fontSize: _theme.typography.body.fontSize,
          fontFamily: _theme.typography.body.fontFamily,
        ));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final value = WidgetsBinding
        .instance.platformDispatcher.views.first.viewInsets.bottom;
    if (value > 0 != isKeyboardOpen) {
      setState(() {
        isKeyboardOpen = !isKeyboardOpen;
      });
    }
  }

  getSummary() async {
    _theme = widget.theme ?? cometChatTheme;
    await getSummaryFromSDK();
  }

  Future<void> getSummaryFromSDK() async {
    setState(() {
      isLoading = true;
    });
    _summary = "";
    String receiverId = "";
    String receiverType = "";
    if (widget.user != null) {
      receiverId = widget.user!.uid;
      receiverType = CometChatReceiverType.user;
    } else if (widget.group != null) {
      receiverId = widget.group!.guid;
      receiverType = CometChatReceiverType.group;
    }
    await CometChat.getConversationSummary(receiverId, receiverType,
<<<<<<< HEAD
        configuration: widget.apiConfiguration,
        onSuccess: (summary2) {
=======
        configuration: widget.apiConfiguration, onSuccess: (summary2) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      _summary = summary2;
      setState(() {});
    }, onError: (error) {
      if (kDebugMode) {
        debugPrint("Error in AI conversation Summary : ${error.message}");
      }
      isError = true;
      setState(() {});
    });
    isLoading = false;
    setState(() {});
  }

<<<<<<< HEAD

=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  Widget _getOnError(BuildContext context, CometChatTheme theme) {
    if (widget.errorStateView != null) {
      return Center(
        child: widget.errorStateView!(context),
      );
    } else {
<<<<<<< HEAD
      return AIUtils.getOnError(context, theme, backgroundColor:
      widget.aiConversationSummaryStyle?.backgroundColor, shadowColor:
      widget.aiConversationSummaryStyle?.shadowColor , errorIconUrl:  widget.errorIconUrl,
          errorIconTint: widget.aiConversationSummaryStyle?.errorIconTint,
          errorStateText: widget.errorStateText,
          errorTextStyle: widget.aiConversationSummaryStyle?.errorTextStyle,
          errorIconPackageName: widget.errorIconPackageName
      );
=======
      return AIUtils.getOnError(context, theme,
          backgroundColor: widget.aiConversationSummaryStyle?.backgroundColor,
          shadowColor: widget.aiConversationSummaryStyle?.shadowColor,
          errorIconUrl: widget.errorIconUrl,
          errorIconTint: widget.aiConversationSummaryStyle?.errorIconTint,
          errorStateText: widget.errorStateText,
          errorTextStyle: widget.aiConversationSummaryStyle?.errorTextStyle,
          errorIconPackageName: widget.errorIconPackageName);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
  }

  Widget _getEmptyView(BuildContext context, CometChatTheme theme) {
    if (widget.emptyStateView != null) {
      return widget.emptyStateView!(context);
    } else {
<<<<<<< HEAD
      return AIUtils.getEmptyView(context, theme, backgroundColor:
      widget.aiConversationSummaryStyle?.backgroundColor, shadowColor:
      widget.aiConversationSummaryStyle?.shadowColor , emptyIconUrl:  widget.emptyIconUrl,
          emptyIconTint: widget.aiConversationSummaryStyle?.emptyIconTint,
          emptyStateText: widget.emptyStateText,
          emptyTextStyle: widget.aiConversationSummaryStyle?.emptyTextStyle,
          emptyIconPackageName: widget.emptyIconPackageName
      );
=======
      return AIUtils.getEmptyView(context, theme,
          backgroundColor: widget.aiConversationSummaryStyle?.backgroundColor,
          shadowColor: widget.aiConversationSummaryStyle?.shadowColor,
          emptyIconUrl: widget.emptyIconUrl,
          emptyIconTint: widget.aiConversationSummaryStyle?.emptyIconTint,
          emptyStateText: widget.emptyStateText,
          emptyTextStyle: widget.aiConversationSummaryStyle?.emptyTextStyle,
          emptyIconPackageName: widget.emptyIconPackageName);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
  }

  Widget _getLoadingIndicator(BuildContext context, CometChatTheme theme) {
    if (widget.loadingStateView != null) {
      return widget.loadingStateView!(context);
    } else {
<<<<<<< HEAD
      return AIUtils.getLoadingIndicator(context, theme, backgroundColor:
      widget.aiConversationSummaryStyle?.backgroundColor, shadowColor:
      widget.aiConversationSummaryStyle?.shadowColor , loadingIconUrl:  widget.loadingIconUrl,
          loadingIconTint: widget.aiConversationSummaryStyle?.loadingIconTint,
          loadingStateText: widget.loadingStateText??Translations.of(context).generating_summary,
          loadingTextStyle: widget.aiConversationSummaryStyle?.loadingTextStyle,
          loadingIconPackageName: widget.loadingIconPackageName
      );
=======
      return AIUtils.getLoadingIndicator(context, theme,
          backgroundColor: widget.aiConversationSummaryStyle?.backgroundColor,
          shadowColor: widget.aiConversationSummaryStyle?.shadowColor,
          loadingIconUrl: widget.loadingIconUrl,
          loadingIconTint: widget.aiConversationSummaryStyle?.loadingIconTint,
          loadingStateText: widget.loadingStateText ??
              Translations.of(context).generatingSummary,
          loadingTextStyle: widget.aiConversationSummaryStyle?.loadingTextStyle,
          loadingIconPackageName: widget.loadingIconPackageName);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
  }

  onClickClosButton(String reply) async {
    Map<String, dynamic> id = {};
    String receiverId = "";
    if (widget.user != null) {
      receiverId = widget.user!.uid;
    } else if (widget.group != null) {
      receiverId = widget.group!.guid;
    }
    id['uid'] = receiverId;
    id['guid'] = receiverId;
    CometChatUIEvents.hidePanel(id, CustomUIPosition.composerTop);

    CometChatUIEvents.ccComposeMessage(reply, MessageEditStatus.inProgress);
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD



    return (!isKeyboardOpen)
        ? isLoading
            // --- on Loading ---
            ? _getLoadingIndicator( context, _theme)
            :
            // ---on error---
            isError
                ? _getOnError(context, _theme)
                :
                // --- empty replies state ----
                _summary.isEmpty
=======
    return (!isKeyboardOpen)
        ? isLoading
            ? _getLoadingIndicator(context, _theme)
            : isError
                ? _getOnError(context, _theme)
                : _summary.isEmpty
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                    ? _getEmptyView(context, _theme)
                    : (widget.customView != null)
                        ? widget.customView!(_summary, context)
                        : SizedBox(
                            child: CometChatDecoratedContainer(
<<<<<<< HEAD
                              title: Translations.of(context).conversation_summary,
                              content: _summary,
                              closeIconTint: _theme.palette.getAccent(),
                              style: widget.aiConversationSummaryStyle?.decoratedContainerSummaryStyle!=null?
                              widget.aiConversationSummaryStyle?.decoratedContainerSummaryStyle!.merge(defaultContainerStyle): defaultContainerStyle,
                              onCloseIconTap: (){
                                Map<String, dynamic> idMap =  UIEventUtils.createMap(widget.user?.uid,widget.group?.guid, 0);
                                if(widget.onCloseIconTap!=null){
                                  widget.onCloseIconTap!(idMap);
                                }else{
                                  CometChatUIEvents.hidePanel(idMap, CustomUIPosition.composerTop);
=======
                              title:
                                  Translations.of(context).conversationSummary,
                              content: _summary,
                              closeIconTint: _theme.palette.getAccent(),
                              style: widget.aiConversationSummaryStyle
                                          ?.decoratedContainerSummaryStyle !=
                                      null
                                  ? widget.aiConversationSummaryStyle
                                      ?.decoratedContainerSummaryStyle!
                                      .merge(defaultContainerStyle)
                                  : defaultContainerStyle,
                              onCloseIconTap: () {
                                Map<String, dynamic> idMap =
                                    UIEventUtils.createMap(widget.user?.uid,
                                        widget.group?.guid, 0);
                                if (widget.onCloseIconTap != null) {
                                  widget.onCloseIconTap!(idMap);
                                } else {
                                  CometChatUIEvents.hidePanel(
                                      idMap, CustomUIPosition.composerTop);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                                }
                              },
                            ),
                          )
        : const SizedBox();
  }
}
