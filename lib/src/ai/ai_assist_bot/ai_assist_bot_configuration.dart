import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';

///[AIAssistBotConfiguration] is a data class that has configuration properties
///to customize the functionality and appearance of [AIAssistBotExtension]
///
/// ```dart
///   AIAssistBotConfiguration(
///    style: AiConversationAssistBotStyle(),
///    theme: CometChatTheme(palette: Palette(),typography: Typography())
///  );
/// ```
///
///
class AIAssistBotConfiguration {
<<<<<<< HEAD

  AIAssistBotConfiguration({
    this.aiAssistBotStyle,
    this.title,
    this.apiConfiguration,
    this.unreadMessageThreshold = 30,
    this.theme,
    this.loadingStateText,
    this.errorStateText,
    this.emptyStateText,
    this.loadingIconUrl,
    this.loadingStateView,
    this.errorIconUrl,
    this.errorStateView,
    this.emptyStateView,
    this.emptyIconUrl,
    this.onCloseIconTap
  });
=======
  AIAssistBotConfiguration(
      {this.aiAssistBotStyle,
      this.title,
      this.apiConfiguration,
      this.unreadMessageThreshold = 30,
      this.theme,
      this.loadingStateText,
      this.errorStateText,
      this.emptyStateText,
      this.loadingIconUrl,
      this.loadingStateView,
      this.errorIconUrl,
      this.errorStateView,
      this.emptyStateView,
      this.emptyIconUrl,
      this.onCloseIconTap});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[aiAssistBotStyle] provides styling to the reply view
  final AIAssistBotStyle? aiAssistBotStyle;

  ///[theme] sets custom theme
  final CometChatTheme? theme;

  ///[emptyStateText] text to be displayed when the replies are empty
  final String? emptyStateText;

  ///[loadingStateText] text to be displayed when loading occur
  final String? loadingStateText;

  ///[errorStateText] text to be displayed when error occur
  final String? errorStateText;

  ///[emptyStateView] returns view for empty state
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

  ///[onCloseIconTap] used to set callback for close icon
  final Function()? onCloseIconTap;

  ///[title] set the title
  final String? title;

  ///[apiConfiguration] set the configuration
<<<<<<< HEAD
  final Future<Map<String, dynamic>> Function(User aiBot,  User? user,  Group? group)? apiConfiguration;
=======
  final Future<Map<String, dynamic>> Function(
      User aiBot, User? user, Group? group)? apiConfiguration;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[unreadMessageThreshold] set the unread message count
  final int? unreadMessageThreshold;

<<<<<<< HEAD


  /// Copies current [AIAssistBotConfiguration] with some changes
  AIAssistBotConfiguration copyWith({
    AIAssistBotStyle? aiAssistBotStyle,
    CometChatTheme? theme,
    String? emptyStateText,
    String? loadingStateText,
    String? errorStateText,
    Widget Function(List<String> replies, BuildContext context)? customView,
    Widget Function(List<String> replies, BuildContext context)?
        conversationStarterEmptyView,
    WidgetBuilder? emptyStateView,
    WidgetBuilder? loadingStateView,
    WidgetBuilder? errorStateView,
    String? errorIconUrl,
    String? emptyIconUrl,
    String? loadingIconUrl,
    Future<Map<String, dynamic>> Function(User aiBot, User? user,  Group? group)? apiConfiguration
  }) {
    return AIAssistBotConfiguration(
      aiAssistBotStyle:
      aiAssistBotStyle ?? aiAssistBotStyle,
=======
  /// Copies current [AIAssistBotConfiguration] with some changes
  AIAssistBotConfiguration copyWith(
      {AIAssistBotStyle? aiAssistBotStyle,
      CometChatTheme? theme,
      String? emptyStateText,
      String? loadingStateText,
      String? errorStateText,
      Widget Function(List<String> replies, BuildContext context)? customView,
      Widget Function(List<String> replies, BuildContext context)?
          conversationStarterEmptyView,
      WidgetBuilder? emptyStateView,
      WidgetBuilder? loadingStateView,
      WidgetBuilder? errorStateView,
      String? errorIconUrl,
      String? emptyIconUrl,
      String? loadingIconUrl,
      Future<Map<String, dynamic>> Function(
              User aiBot, User? user, Group? group)?
          apiConfiguration}) {
    return AIAssistBotConfiguration(
      aiAssistBotStyle: aiAssistBotStyle ?? aiAssistBotStyle,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      theme: theme ?? theme,
      emptyStateText: emptyStateText ?? this.emptyStateText,
      loadingStateText: loadingStateText ?? this.loadingStateText,
      errorStateText: errorStateText ?? this.errorStateText,
<<<<<<< HEAD
     // customView: customView ?? this.customView,
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      emptyStateView: emptyStateView ?? this.emptyStateView,
      loadingStateView: loadingStateView ?? this.loadingStateView,
      errorStateView: errorStateView ?? this.errorStateView,
      errorIconUrl: errorIconUrl ?? this.errorIconUrl,
      emptyIconUrl: emptyIconUrl ?? this.emptyIconUrl,
      loadingIconUrl: loadingIconUrl ?? this.loadingIconUrl,
      apiConfiguration: apiConfiguration ?? this.apiConfiguration,
    );
  }

  /// Merges current [AIAssistBotConfiguration] with [other]
<<<<<<< HEAD
  AIAssistBotConfiguration merge(
      AIAssistBotConfiguration? other) {
=======
  AIAssistBotConfiguration merge(AIAssistBotConfiguration? other) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (other == null) return this;
    return copyWith(
      aiAssistBotStyle: other.aiAssistBotStyle,
      theme: other.theme,
      emptyStateText: other.emptyStateText,
      loadingStateText: other.loadingStateText,
      errorStateText: other.errorStateText,
      emptyStateView: other.emptyStateView,
      loadingStateView: other.loadingStateView,
      errorStateView: other.errorStateView,
      errorIconUrl: other.errorIconUrl,
      emptyIconUrl: other.emptyIconUrl,
      loadingIconUrl: other.loadingIconUrl,
      apiConfiguration: other.apiConfiguration,
    );
  }
}
