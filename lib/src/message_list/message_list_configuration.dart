import 'package:flutter/material.dart';

import '../../cometchat_chat_uikit.dart';

///[MessageListConfiguration] is a data class that has configuration properties
///to customize the functionality and appearance of [CometChatMessageList]
///can be used by a component where [CometChatMessageList] is a child component
///
/// ```dart
///
/// MessageListConfiguration(
///      messageListStyle: MessageListStyle(),
///      avatarStyle: AvatarStyle(),
///      templates: MessagesDataSource().getAllMessageTemplates(),
///      alignment: ChatAlignment.standard
///    );
///
/// ```
///
///
class MessageListConfiguration {
  const MessageListConfiguration({
    this.messagesRequestBuilder,
    this.messageListStyle,
    this.controller,
    this.emptyStateText,
    this.errorStateText,
    this.loadingStateView,
    this.emptyStateView,
    this.errorStateView,
    this.hideError,
    this.avatarStyle,
    this.disableSoundForMessages,
    this.customSoundForMessages,
    this.customSoundForMessagePackage,
    this.readIcon,
    this.deliveredIcon,
    this.sentIcon,
    this.waitIcon,
<<<<<<< HEAD
    this.replyIcon,
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    this.alignment,
    this.showAvatar,
    this.datePattern,
    this.hideTimestamp,
    this.timestampAlignment,
    this.templates,
    this.newMessageIndicatorText,
    this.scrollToBottomOnNewMessages,
    this.onThreadRepliesClick,
    this.headerView,
    this.footerView,
<<<<<<< HEAD
    this.avatarView,
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    this.dateSeparatorPattern,
    this.onError,
    this.theme,
    this.disableReceipt = false,
<<<<<<< HEAD
    this.replyEnabled = true,
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    this.messageInformationConfiguration,
    this.dateSeparatorStyle,
    this.reactionListConfiguration,
    this.disableReactions,
    this.favoriteReactions,
    this.reactionsStyle,
    this.addReactionIcon,
    this.addReactionIconTap,
    this.emojiKeyboardStyle,
<<<<<<< HEAD
    this.selfColor,
    this.otherColor,
    this.showDateSeperator = true,
    this.showBottomInfo = false,
=======
    this.textFormatters,
    this.disableMentions,
    this.reactionsConfiguration,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  });

  ///[messagesRequestBuilder] custom request builder for fetching messages
  final MessagesRequestBuilder? messagesRequestBuilder;

  ///[messageListStyle] sets style
  final MessageListStyle? messageListStyle;

  ///[controller] sets controller for the list
  final ScrollController? controller;

  ///[emptyStateText] text to be displayed when the list is empty
  final String? emptyStateText;

  ///[errorStateText] text to be displayed when error occur
  final String? errorStateText;

  ///[loadingStateView] returns view fow loading state
  final WidgetBuilder? loadingStateView;

  ///[emptyStateView] returns view fow empty state
  final WidgetBuilder? emptyStateView;

  ///[errorStateView] returns view fow error state behind the dialog
  final WidgetBuilder? errorStateView;

  ///[hideError] toggle visibility of error dialog
  final bool? hideError;

<<<<<<< HEAD
  final bool showDateSeperator;

=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  ///[avatarStyle] set style for avatar visible in leading view of message bubble
  final AvatarStyle? avatarStyle;

  final bool? disableSoundForMessages;

  ///asset url to Sound
  final String? customSoundForMessages;

  ///if sending sound url from other package pass package name here
  final String? customSoundForMessagePackage;

  ///custom read icon visible at read receipt
  final Widget? readIcon;

  ///custom message delivered icon
  final Widget? deliveredIcon;

  /// custom sent icon visible at read receipt
  final Widget? sentIcon;

  ///custom wait icon visible at read receipt
  final Widget? waitIcon;

<<<<<<< HEAD
  final Widget? replyIcon;

  final Widget? avatarView;

=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  ///used to set the alignment of messages in CometChatMessageList. It can be either "leftAligned" or "standard"
  final ChatAlignment? alignment;

  ///toggle visibility for avatar
  final bool? showAvatar;

<<<<<<< HEAD
  final bool replyEnabled;

=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  ///datePattern custom date pattern visible in receipts
  final String Function(BaseMessage message)? datePattern;

  ///[hideTimestamp] set style for avatar
  final bool? hideTimestamp;

  ///[timestampAlignment] set style for avatar
  final TimeAlignment? timestampAlignment;

  ///[templates] set message type allowed
  final List<CometChatMessageTemplate>? templates;

  ///[newMessageIndicatorText] set style for avatar
  final String? newMessageIndicatorText;

  ///Should scroll to bottom on new message?, by default false
  final bool? scrollToBottomOnNewMessages;

  ///call back for click on thread indicator
  final ThreadRepliesClick? onThreadRepliesClick;

  ///[footerView] sets custom widget to footer
  ///
  /// typically name is shown
<<<<<<< HEAD
  final Widget? Function(BuildContext, {User? user, Group? group, int? parentMessageId})? headerView;
=======
  final Widget? Function(BuildContext,
      {User? user, Group? group, int? parentMessageId})? headerView;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[footerView] sets custom widget to footer
  ///
  /// typically time and read receipt is shown
<<<<<<< HEAD
  final Widget? Function(BuildContext, {User? user, Group? group, int? parentMessageId})? footerView;
=======
  final Widget? Function(BuildContext,
      {User? user, Group? group, int? parentMessageId})? footerView;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[dateSeparatorPattern] pattern for  date separator
  final String Function(DateTime)? dateSeparatorPattern;

  ///[onError] callback triggered in case any error happens when fetching users
  final OnError? onError;

  ///[theme] sets custom theme
  final CometChatTheme? theme;

  ///[disableReceipt] controls visibility of read receipts
  final bool? disableReceipt;

  ///[messageInformationConfiguration] set configuration for message Information
  final MessageInformationConfiguration? messageInformationConfiguration;

  ///[dateSeparatorStyle] sets style for date separator
  final DateStyle? dateSeparatorStyle;

  ///[reactionListConfiguration] sets configuration properties for reaction list
  final ReactionListConfiguration? reactionListConfiguration;

  ///[disableReactions] toggle visibility of reactions
  final bool? disableReactions;

  ///[addReactionIcon] sets custom icon for adding reaction
  final Widget? addReactionIcon;

  ///[addReactionIconTap] sets custom onTap for adding reaction
  final Function(BaseMessage)? addReactionIconTap;

  ///[reactionsStyle] is a parameter used to set the style for the reactions
  final ReactionsStyle? reactionsStyle;

  ///[favoriteReactions] is a list of frequently used reactions
  final List<String>? favoriteReactions;

  ///[emojiKeyboardStyle] is a parameter used to set the style for the emoji keyboard
  final EmojiKeyboardStyle? emojiKeyboardStyle;

<<<<<<< HEAD
  final Color? selfColor;
  final Color? otherColor;
  final bool showBottomInfo;
=======
  ///[textFormatters] is a list of text formatters for message bubbles with type text
  final List<CometChatTextFormatter>? textFormatters;

  ///[disableMentions] disables formatting of mentions in the subtitle of the conversation
  final bool? disableMentions;

  ///[reactionsConfiguration] sets configuration properties for reactions
  final ReactionsConfiguration? reactionsConfiguration;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}
