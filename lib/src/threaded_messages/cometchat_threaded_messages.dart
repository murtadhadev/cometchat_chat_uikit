import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cometchat_chat_uikit.dart';
import '../../cometchat_chat_uikit.dart' as cc;

///[CometChatThreadedMessages] is a widget that internally uses [CometChatListBase], [CometChatMessageList] and [CometChatMessageComposer]
///to display and create messages with respect to a certain parent message
/// ```dart
///   CometChatThreadedMessages(
///      parentMessage: BaseMessage(
///          receiverUid: 'receiverUid',
///          type: 'type',
///          receiverType: 'receiverType',
///          readAt: DateTime.now()),
///      loggedInUser: User(name: 'loggedInUser', uid: 'uid_of_loggedInUser'),
///      threadedMessagesStyle: ThreadedMessageStyle(),
///      );
/// ```
class CometChatThreadedMessages extends StatefulWidget {
<<<<<<< HEAD
  const CometChatThreadedMessages(
      {Key? key,
      required this.parentMessage,
      this.title,
      this.closeIcon,
      this.messageActionView,
      this.messageComposerConfiguration,
      this.messageListConfiguration,
      this.threadedMessagesStyle,
      this.hideMessageComposer,
      this.bubbleView,
      required this.loggedInUser,
      this.textStyle,
      this.theme})
      : super(key: key);
=======
  const CometChatThreadedMessages({
    super.key,
    required this.parentMessage,
    this.title,
    this.closeIcon,
    this.messageActionView,
    this.messageComposerConfiguration,
    this.messageListConfiguration,
    this.threadedMessagesStyle,
    this.hideMessageComposer,
    this.bubbleView,
    required this.loggedInUser,
    this.theme,
    this.messageComposerKey,
    this.messageComposerView,
    this.messageListView,
  });
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[parentMessage] parent message for thread
  final BaseMessage parentMessage;

  ///[title] to be shown at head
  final String? title;

  ///to update Close Icon
  final Widget? closeIcon;

  ///[bubbleView] bubble view for parent message
  final Widget Function(BaseMessage, BuildContext context)? bubbleView;

  ///[messageActionView] custom action view
  final Function(BaseMessage message, BuildContext context)? messageActionView;

  ///[messageListConfiguration] configuration class for [CometChatMessageList]
  final MessageListConfiguration? messageListConfiguration;

  ///[messageComposerConfiguration] configuration class for [CometChatMessageComposer]
  final MessageComposerConfiguration? messageComposerConfiguration;

  ///[threadedMessagesStyle] style parameter
  final ThreadedMessageStyle? threadedMessagesStyle;

  ///[hideMessageComposer] toggle visibility for message composer
  final bool? hideMessageComposer;

  ///[loggedInUser] get logged in user
  final User loggedInUser;

  ///[theme] can pass custom theme
  final CometChatTheme? theme;

<<<<<<< HEAD
  final TextStyle? textStyle;

  @override
  State<CometChatThreadedMessages> createState() => _CometChatThreadedMessagesState();
=======
  ///[messageComposerKey] key for message composer, We use this to get  the dimensions of the composer which we then use to set the placeholder for the composer in stack we are using to show the message list
  final GlobalKey? messageComposerKey;

  ///[messageComposerView] to set custom message composer
  final Widget Function(User? user, Group? group, BuildContext context,
      BaseMessage parentMessage)? messageComposerView;

  ///[messageListView] to set custom message list
  final Widget Function(User? user, Group? group, BuildContext context,
      BaseMessage parentMessage)? messageListView;

  @override
  State<CometChatThreadedMessages> createState() =>
      _CometChatThreadedMessagesState();
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}

class _CometChatThreadedMessagesState extends State<CometChatThreadedMessages> {
  late CometChatThreadedMessageController threadedMessageController;
  late CometChatTheme _theme;

  @override
  void initState() {
    super.initState();
    threadedMessageController = CometChatThreadedMessageController(
      widget.parentMessage,
      widget.loggedInUser,
    );
    _theme = widget.theme ?? cometChatTheme;
  }

<<<<<<< HEAD
  Widget getMessageComposer(CometChatThreadedMessageController controller, BuildContext context) {
    return CometChatMessageComposer(
        user: controller.user,
        group: controller.group,
        placeholderText: widget.messageComposerConfiguration?.placeholderText,
        parentMessageId: widget.parentMessage.id,
        hideLiveReaction: true,
        text: widget.messageComposerConfiguration?.text,
        attachmentIcon: widget.messageComposerConfiguration?.attachmentIcon,
        liveReactionIcon: widget.messageComposerConfiguration?.liveReactionIcon,
        deleteIcon: widget.messageComposerConfiguration?.deleteIcon,
        playIcon: widget.messageComposerConfiguration?.playIcon,
        recordIcon: widget.messageComposerConfiguration?.recordIcon,
        stopIcon: widget.messageComposerConfiguration?.stopIcon,
        pauseIcon: widget.messageComposerConfiguration?.pauseIcon,
        submitIcon: widget.messageComposerConfiguration?.submitIcon,
        disableTypingEvents: widget.messageComposerConfiguration?.disableTypingEvents ?? false,
        mediaRecorderStyle: widget.messageComposerConfiguration?.mediaRecorderStyle,
        hideVoiceRecording: widget.messageComposerConfiguration?.hideVoiceRecording ?? false,
        voiceRecordingIcon: widget.messageComposerConfiguration?.voiceRecordingIcon,
        ctheme: widget.messageComposerConfiguration?.theme ?? _theme,
        attachmentOptions: widget.messageComposerConfiguration?.attachmentOptions,
        attachmentIconURL: widget.messageComposerConfiguration?.attachmentIconURL,
        auxiliaryButtonsAlignment: widget.messageComposerConfiguration?.auxiliaryButtonsAlignment,
        customSoundForMessage: widget.messageComposerConfiguration?.customSoundForMessage,
        customSoundForMessagePackage: widget.messageComposerConfiguration?.customSoundForMessagePackage,
        disableSoundForMessages: widget.messageComposerConfiguration?.disableSoundForMessages ?? false,
        onChange: widget.messageComposerConfiguration?.onChange,
        onSendButtonTap: widget.messageComposerConfiguration?.onSendButtonTap,
        sendButtonView: widget.messageComposerConfiguration?.sendButtonView,
        auxiliaryButtonView: widget.messageComposerConfiguration?.auxiliaryButtonView,
        secondaryButtonView: widget.messageComposerConfiguration?.secondaryButtonView,
        liveReactionIconURL: widget.messageComposerConfiguration?.liveReactionIconURL,
        maxLine: widget.messageComposerConfiguration?.maxLine,
        footerView: widget.messageComposerConfiguration?.footerView,
        headerView: widget.messageComposerConfiguration?.headerView,
        messageComposerStyle: MessageComposerStyle(
          background: widget.messageComposerConfiguration?.messageComposerStyle?.background ??
              (widget.threadedMessagesStyle?.gradient != null
                  ? Colors.transparent
                  : widget.threadedMessagesStyle?.background),
          border: widget.messageComposerConfiguration?.messageComposerStyle?.border ??
              (widget.threadedMessagesStyle?.background != null || widget.threadedMessagesStyle?.gradient != null
                  ? null
                  : widget.threadedMessagesStyle?.border),
          borderRadius: widget.messageComposerConfiguration?.messageComposerStyle?.borderRadius ??
              widget.threadedMessagesStyle?.borderRadius,
          inputBackground: widget.messageComposerConfiguration?.messageComposerStyle?.inputBackground ??
              _theme.palette.getAccent100(),
          gradient: widget.messageComposerConfiguration?.messageComposerStyle?.gradient,
          height: widget.messageComposerConfiguration?.messageComposerStyle?.height,
          width: widget.messageComposerConfiguration?.messageComposerStyle?.width,
          attachmentIconTint: widget.messageComposerConfiguration?.messageComposerStyle?.attachmentIconTint,
          closeIconTint: widget.messageComposerConfiguration?.messageComposerStyle?.closeIconTint,
          dividerTint:
              widget.messageComposerConfiguration?.messageComposerStyle?.dividerTint ?? _theme.palette.getAccent500(),
          voiceRecordingIconTint: widget.messageComposerConfiguration?.messageComposerStyle?.voiceRecordingIconTint,
          inputTextStyle: widget.messageComposerConfiguration?.messageComposerStyle?.inputTextStyle,
          placeholderTextStyle: widget.messageComposerConfiguration?.messageComposerStyle?.placeholderTextStyle,
          sendButtonIcon: widget.messageComposerConfiguration?.messageComposerStyle?.sendButtonIcon,
          sendButtonIconTint: widget.messageComposerConfiguration?.messageComposerStyle?.sendButtonIconTint,
          contentPadding: widget.messageComposerConfiguration?.messageComposerStyle?.contentPadding ?? EdgeInsets.zero,
        ),
        aiOptionStyle: widget.messageComposerConfiguration?.aiOptionStyle,
        aiIconPackageName: widget.messageComposerConfiguration?.aiIconPackageName,
        aiIconURL: widget.messageComposerConfiguration?.aiIconURL,
        aiIcon: widget.messageComposerConfiguration?.aiIcon);
  }

  Widget getMessageList(
    CometChatThreadedMessageController controller,
    BuildContext context,
    ScrollController scrollController,
  ) {
    MessagesRequestBuilder? requestBuilder = widget.messageListConfiguration?.messagesRequestBuilder;
    if (requestBuilder != null) {
      requestBuilder.parentMessageId = widget.parentMessage.id;
    } else {
      requestBuilder = MessagesRequestBuilder()..parentMessageId = widget.parentMessage.id;
    }

    return CometChatMessageList(
      user: controller.user,
      group: controller.group,
      alignment: widget.messageListConfiguration?.alignment ?? ChatAlignment.standard,
      templates: widget.messageListConfiguration?.templates,
      replyEnabled: widget.messageListConfiguration?.replyEnabled ?? false,
      showDateSeperator: widget.messageListConfiguration?.replyEnabled ?? false,
      // stateCallBack: messageListStateCallBack,
      messagesRequestBuilder: requestBuilder,
      avatarView: widget.messageListConfiguration?.avatarView,
      footerView: widget.messageListConfiguration?.footerView,
      headerView: widget.messageListConfiguration?.headerView,
      datePattern: widget.messageListConfiguration?.datePattern,
      avatarStyle: widget.messageListConfiguration?.avatarStyle,
      dateSeparatorPattern: widget.messageListConfiguration?.dateSeparatorPattern,
      deliveredIcon: widget.messageListConfiguration?.deliveredIcon,
      emptyStateText: widget.messageListConfiguration?.emptyStateText,
      emptyStateView: widget.messageListConfiguration?.emptyStateView,
      errorStateText: widget.messageListConfiguration?.errorStateText,
      errorStateView: widget.messageListConfiguration?.errorStateView,
      hideError: widget.messageListConfiguration?.hideError,
      hideTimestamp: widget.messageListConfiguration?.hideTimestamp,
      waitIcon: widget.messageListConfiguration?.waitIcon,
      showAvatar: widget.messageListConfiguration?.showAvatar,
      loadingStateView: widget.messageListConfiguration?.loadingStateView,
      disableSoundForMessages: true,
      messageListStyle: widget.messageListConfiguration?.messageListStyle ??
          MessageListStyle(
              contentPadding: widget.messageListConfiguration?.messageListStyle?.contentPadding ?? EdgeInsets.zero),

      sentIcon: widget.messageListConfiguration?.sentIcon,
      readIcon: widget.messageListConfiguration?.readIcon,
      scrollToBottomOnNewMessages: widget.messageListConfiguration?.scrollToBottomOnNewMessages,
      newMessageIndicatorText: widget.messageListConfiguration?.newMessageIndicatorText,
      timestampAlignment: widget.messageListConfiguration?.timestampAlignment ?? TimeAlignment.bottom,
      customSoundForMessages: widget.messageListConfiguration?.customSoundForMessages,
      customSoundForMessagePackage: widget.messageListConfiguration?.customSoundForMessagePackage,
      // snackBarConfiguration: widget.messageListConfiguration?.snackBarConfiguration,
      // eventStreamController: controller.messageListEventStreamController,
      messageInformationConfiguration: widget.messageListConfiguration?.messageInformationConfiguration,
      controller: widget.messageListConfiguration?.controller ?? scrollController,
      theme: widget.messageListConfiguration?.theme ?? _theme,
      disableReceipt: widget.messageListConfiguration?.disableReceipt,
      dateSeparatorStyle: widget.messageListConfiguration?.dateSeparatorStyle,
    );
  }

  getThreadMessageHeader(CometChatThreadedMessageController controller, BuildContext context) {
=======
  Widget getMessageComposer(
      CometChatThreadedMessageController controller, BuildContext context) {
    GlobalKey key = widget.messageComposerKey ?? controller.messageComposerKey;

    if (controller.composerPlaceHolder == null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller.getComposerPlaceHolder();
      });
    }

    return widget.messageComposerView != null
        ? widget.messageComposerView!(
            controller.user, controller.group, context, widget.parentMessage)
        : CometChatMessageComposer(
            user: controller.user,
            group: controller.group,
            placeholderText:
                widget.messageComposerConfiguration?.placeholderText,
            parentMessageId: widget.parentMessage.id,
            hideLiveReaction: true,
            attachmentIcon: widget.messageComposerConfiguration?.attachmentIcon,
            liveReactionIcon:
                widget.messageComposerConfiguration?.liveReactionIcon,
            deleteIcon: widget.messageComposerConfiguration?.deleteIcon,
            playIcon: widget.messageComposerConfiguration?.playIcon,
            recordIcon: widget.messageComposerConfiguration?.recordIcon,
            stopIcon: widget.messageComposerConfiguration?.stopIcon,
            pauseIcon: widget.messageComposerConfiguration?.pauseIcon,
            submitIcon: widget.messageComposerConfiguration?.submitIcon,
            disableTypingEvents:
                widget.messageComposerConfiguration?.disableTypingEvents ??
                    false,
            mediaRecorderStyle:
                widget.messageComposerConfiguration?.mediaRecorderStyle,
            hideVoiceRecording:
                widget.messageComposerConfiguration?.hideVoiceRecording ??
                    false,
            voiceRecordingIcon:
                widget.messageComposerConfiguration?.voiceRecordingIcon,
            theme: widget.messageComposerConfiguration?.theme ?? _theme,
            attachmentOptions:
                widget.messageComposerConfiguration?.attachmentOptions,
            attachmentIconURL:
                widget.messageComposerConfiguration?.attachmentIconURL,
            auxiliaryButtonsAlignment:
                widget.messageComposerConfiguration?.auxiliaryButtonsAlignment,
            customSoundForMessage:
                widget.messageComposerConfiguration?.customSoundForMessage,
            customSoundForMessagePackage: widget
                .messageComposerConfiguration?.customSoundForMessagePackage,
            disableSoundForMessages:
                widget.messageComposerConfiguration?.disableSoundForMessages ??
                    false,
            onChange: widget.messageComposerConfiguration?.onChange,
            onSendButtonTap:
                widget.messageComposerConfiguration?.onSendButtonTap,
            sendButtonView: widget.messageComposerConfiguration?.sendButtonView,
            auxiliaryButtonView:
                widget.messageComposerConfiguration?.auxiliaryButtonView,
            secondaryButtonView:
                widget.messageComposerConfiguration?.secondaryButtonView,
            liveReactionIconURL:
                widget.messageComposerConfiguration?.liveReactionIconURL,
            maxLine: widget.messageComposerConfiguration?.maxLine,
            footerView: widget.messageComposerConfiguration?.footerView,
            headerView: widget.messageComposerConfiguration?.headerView,
            messageComposerStyle: MessageComposerStyle(
              background: widget.messageComposerConfiguration
                      ?.messageComposerStyle?.background ??
                  (widget.threadedMessagesStyle?.gradient != null
                      ? Colors.transparent
                      : widget.threadedMessagesStyle?.background),
              border: widget.messageComposerConfiguration?.messageComposerStyle
                      ?.border ??
                  (widget.threadedMessagesStyle?.background != null ||
                          widget.threadedMessagesStyle?.gradient != null
                      ? null
                      : widget.threadedMessagesStyle?.border),
              borderRadius: widget.messageComposerConfiguration
                      ?.messageComposerStyle?.borderRadius ??
                  widget.threadedMessagesStyle?.borderRadius,
              inputBackground: widget.messageComposerConfiguration
                      ?.messageComposerStyle?.inputBackground ??
                  _theme.palette.getAccent100(),
              gradient: widget
                  .messageComposerConfiguration?.messageComposerStyle?.gradient,
              height: widget
                  .messageComposerConfiguration?.messageComposerStyle?.height,
              width: widget
                  .messageComposerConfiguration?.messageComposerStyle?.width,
              attachmentIconTint: widget.messageComposerConfiguration
                  ?.messageComposerStyle?.attachmentIconTint,
              closeIconTint: widget.messageComposerConfiguration
                  ?.messageComposerStyle?.closeIconTint,
              dividerTint: widget.messageComposerConfiguration
                      ?.messageComposerStyle?.dividerTint ??
                  _theme.palette.getAccent500(),
              voiceRecordingIconTint: widget.messageComposerConfiguration
                  ?.messageComposerStyle?.voiceRecordingIconTint,
              inputTextStyle: widget.messageComposerConfiguration
                  ?.messageComposerStyle?.inputTextStyle,
              placeholderTextStyle: widget.messageComposerConfiguration
                  ?.messageComposerStyle?.placeholderTextStyle,
              sendButtonIcon: widget.messageComposerConfiguration
                  ?.messageComposerStyle?.sendButtonIcon,
              sendButtonIconTint: widget.messageComposerConfiguration
                  ?.messageComposerStyle?.sendButtonIconTint,
              contentPadding: widget.messageComposerConfiguration
                      ?.messageComposerStyle?.contentPadding ??
                  EdgeInsets.zero,
              messageInputPadding: widget.messageComposerConfiguration
                      ?.messageComposerStyle?.messageInputPadding ??
                  const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
            ),
            aiOptionStyle: widget.messageComposerConfiguration?.aiOptionStyle,
            aiIconPackageName:
                widget.messageComposerConfiguration?.aiIconPackageName,
            aiIconURL: widget.messageComposerConfiguration?.aiIconURL,
            aiIcon: widget.messageComposerConfiguration?.aiIcon,
            messageComposerKey: key,
            disableMentions:
                widget.messageComposerConfiguration?.disableMentions,
            textFormatters: widget.messageComposerConfiguration?.textFormatters,
            onError: widget.messageComposerConfiguration?.onError,
            text: widget.messageComposerConfiguration?.text,
            stateCallBack: widget.messageComposerConfiguration?.stateCallBack,
            textEditingController:
                widget.messageComposerConfiguration?.textEditingController,
          );
  }

  Widget getMessageList(
      CometChatThreadedMessageController controller, BuildContext context) {
    MessagesRequestBuilder? requestBuilder =
        widget.messageListConfiguration?.messagesRequestBuilder;
    if (requestBuilder != null) {
      requestBuilder.parentMessageId = widget.parentMessage.id;
    } else {
      requestBuilder = MessagesRequestBuilder()
        ..parentMessageId = widget.parentMessage.id;
    }

    return widget.messageListView != null
        ? widget.messageListView!(
            controller.user, controller.group, context, widget.parentMessage)
        : CometChatMessageList(
            user: controller.user,
            group: controller.group,
            alignment: widget.messageListConfiguration?.alignment ??
                ChatAlignment.standard,
            templates: widget.messageListConfiguration?.templates,
            messagesRequestBuilder: requestBuilder,
            footerView: widget.messageListConfiguration?.footerView,
            headerView: widget.messageListConfiguration?.headerView,
            datePattern: widget.messageListConfiguration?.datePattern,
            avatarStyle: widget.messageListConfiguration?.avatarStyle,
            dateSeparatorPattern:
                widget.messageListConfiguration?.dateSeparatorPattern,
            deliveredIcon: widget.messageListConfiguration?.deliveredIcon,
            emptyStateText: widget.messageListConfiguration?.emptyStateText,
            emptyStateView: widget.messageListConfiguration?.emptyStateView,
            errorStateText: widget.messageListConfiguration?.errorStateText,
            errorStateView: widget.messageListConfiguration?.errorStateView,
            hideError: widget.messageListConfiguration?.hideError,
            hideTimestamp: widget.messageListConfiguration?.hideTimestamp,
            waitIcon: widget.messageListConfiguration?.waitIcon,
            showAvatar: widget.messageListConfiguration?.showAvatar,
            loadingStateView: widget.messageListConfiguration?.loadingStateView,
            disableSoundForMessages: true,
            messageListStyle:
                widget.messageListConfiguration?.messageListStyle ??
                    MessageListStyle(
                        contentPadding: widget.messageListConfiguration
                                ?.messageListStyle?.contentPadding ??
                            const EdgeInsets.all(8)),
            sentIcon: widget.messageListConfiguration?.sentIcon,
            readIcon: widget.messageListConfiguration?.readIcon,
            scrollToBottomOnNewMessages:
                widget.messageListConfiguration?.scrollToBottomOnNewMessages,
            newMessageIndicatorText:
                widget.messageListConfiguration?.newMessageIndicatorText,
            timestampAlignment:
                widget.messageListConfiguration?.timestampAlignment ??
                    TimeAlignment.bottom,
            customSoundForMessages:
                widget.messageListConfiguration?.customSoundForMessages,
            customSoundForMessagePackage:
                widget.messageListConfiguration?.customSoundForMessagePackage,
            messageInformationConfiguration: widget
                .messageListConfiguration?.messageInformationConfiguration,
            controller: widget.messageListConfiguration?.controller,
            theme: widget.messageListConfiguration?.theme ?? _theme,
            disableReceipt: widget.messageListConfiguration?.disableReceipt,
            dateSeparatorStyle:
                widget.messageListConfiguration?.dateSeparatorStyle,
            disableMentions: widget.messageListConfiguration?.disableMentions,
            onError: widget.messageListConfiguration?.onError,
            reactionsConfiguration:
                widget.messageListConfiguration?.reactionsConfiguration,
            emojiKeyboardStyle:
                widget.messageListConfiguration?.emojiKeyboardStyle,
            addReactionIconTap:
                widget.messageListConfiguration?.addReactionIconTap,
            addReactionIcon: widget.messageListConfiguration?.addReactionIcon,
            reactionsStyle: widget.messageListConfiguration?.reactionsStyle,
            textFormatters: widget.messageListConfiguration?.textFormatters,
            reactionListConfiguration:
                widget.messageListConfiguration?.reactionListConfiguration,
            disableReactions: widget.messageListConfiguration?.disableReactions,
            favoriteReactions:
                widget.messageListConfiguration?.favoriteReactions,
          );
  }

  getThreadMessageHeader(
      CometChatThreadedMessageController controller, BuildContext context) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (widget.bubbleView != null) {
      return widget.bubbleView!(controller.parentMessage, context);
    } else {
      return const SizedBox();
    }
  }

<<<<<<< HEAD
  Widget getActionView(CometChatThreadedMessageController controller, BuildContext context, CometChatTheme theme) {
=======
  Widget getActionView(CometChatThreadedMessageController controller,
      BuildContext context, CometChatTheme theme) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (widget.messageActionView != null) {
      return widget.messageActionView!(widget.parentMessage, context);
    }

<<<<<<< HEAD
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 8,
      ),
      child: Column(
        children: [
          //const Divider(),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                'Comments',
                style: widget.textStyle?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Text(
                'Most relevant',
                style: widget.textStyle?.copyWith(
                  fontSize: 14,
                  color: const Color(0XFF888888),
                ),
              )
            ],
          ),
          // Row(children: [
          //   Text(
          //     "${controller.replyCount} ${widget.parentMessage.replyCount > 1 ? cc.Translations.of(context).replies : cc.Translations.of(context).reply}",
          //     style: TextStyle(
          //         fontSize: theme.typography.text1.fontSize,
          //         fontWeight: theme.typography.text1.fontWeight,
          //         color: theme.palette.getAccent600()),
          //   )
          // ]),
          //const Divider()
          const SizedBox(
            height: 4,
          ),
        ],
      ),
=======
    return Column(
      children: [
        const Divider(),
        Row(children: [
          Text(
            "${controller.replyCount} ${widget.parentMessage.replyCount > 1 ? cc.Translations.of(context).replies : cc.Translations.of(context).reply}",
            style: TextStyle(
                fontSize: theme.typography.text1.fontSize,
                fontWeight: theme.typography.text1.fontWeight,
                color: theme.palette.getAccent600()),
          )
        ]),
        const Divider()
      ],
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    );
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final scrollController = ScrollController();
    return CometChatListBase(
        title: widget.title ?? cc.Translations.of(context).thread,
        hideSearch: true,
        hideAppBar: true,
        backIcon: widget.closeIcon,
        showBackButton: true,
        ctheme: _theme,
=======
    return CometChatListBase(
        title: widget.title ?? cc.Translations.of(context).thread,
        hideSearch: true,
        backIcon: widget.closeIcon,
        showBackButton: true,
        theme: _theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        style: ListBaseStyle(
          background: widget.threadedMessagesStyle?.gradient == null
              ? widget.threadedMessagesStyle?.background
              : Colors.transparent,
          titleStyle: widget.threadedMessagesStyle?.titleStyle,
          gradient: widget.threadedMessagesStyle?.gradient,
          height: widget.threadedMessagesStyle?.height,
          width: widget.threadedMessagesStyle?.width,
          backIconTint: widget.threadedMessagesStyle?.closeIconTint,
          border: widget.threadedMessagesStyle?.border,
          borderRadius: widget.threadedMessagesStyle?.borderRadius,
<<<<<<< HEAD
=======
          padding: EdgeInsets.zero,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        ),
        container: GetBuilder(
            init: threadedMessageController,
            tag: threadedMessageController.tag,
            builder: (CometChatThreadedMessageController value) {
              return Stack(
                children: [
<<<<<<< HEAD
                  SingleChildScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          //----message list-----
                          getThreadMessageHeader(value, context),

                          getActionView(value, context, _theme),

                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    FocusScopeNode currentFocus = FocusScope.of(context);

                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                  },
                                  child: getMessageList(value, context, scrollController))),

                          //-----message composer-----
                          //if (widget.hideMessageComposer != true) getMessageComposer(value, context)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: widget.hideMessageComposer != true
                        ? SafeArea(child: getMessageComposer(value, context))
                        : const SizedBox.shrink(),
                  )
=======
                  Column(
                    children: [
                      //----message list-----
                      Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: getThreadMessageHeader(value, context)),

                      Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: getActionView(value, context, _theme)),

                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              child: getMessageList(value, context))),

                      if (widget.hideMessageComposer != true &&
                          value.composerPlaceHolder != null)
                        value.composerPlaceHolder ?? const SizedBox(),
                    ],
                  ),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            children: [
                              if (widget.hideMessageComposer != true)
                                getMessageComposer(value, context)
                            ],
                          ))),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                ],
              );
            }));
  }
}
