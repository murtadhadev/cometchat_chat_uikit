import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:get/get.dart';

///
/// [CometChatMessageComposer] component allows users to
/// send messages and attachments to the chat, participating in the conversation.
///
/// ```dart
///  CometChatMessageComposer(
///        user: User(uid: 'uid', name: 'name'),
///        group: Group(guid: 'guid', name: 'name', type: 'public'),
///        messageComposerStyle: MessageComposerStyle(),
///        stateCallBack: (CometChatMessageComposerController state) {},
///        customSoundForMessage: 'asset url',
///        disableSoundForMessages: true,
///        hideLiveReaction: false,
///        placeholderText: 'Message',
///      );
///
/// ```
///
///
///

//ignore: must_be_immutable
class CometChatMessageComposer extends StatelessWidget {
  CometChatMessageComposer({
    super.key,
    this.user,
    this.group,
    this.messageComposerStyle = const MessageComposerStyle(),
    this.placeholderText,
    bool hideLiveReaction = false,
    bool disableTypingEvents = false,
    bool disableSoundForMessages = false,
    this.parentMessageId = 0,
    String? customSoundForMessage,
    String? customSoundForMessagePackage,
    this.auxiliaryButtonView,
    ComposerWidgetBuilder? headerView,
    ComposerWidgetBuilder? footerView,
    this.secondaryButtonView,
    this.sendButtonView,
    ComposerActionsBuilder? attachmentOptions,
    this.text,
    this.onChange,
    this.maxLine,
    this.auxiliaryButtonsAlignment,
    String? liveReactionIconURL,
    this.attachmentIconURL,
    void Function(CometChatMessageComposerController)? stateCallBack,
    this.theme,
    this.attachmentIcon,
    this.liveReactionIcon,
    OnError? onError,
    this.recordIcon,
    this.playIcon,
    this.deleteIcon,
    this.stopIcon,
    this.submitIcon,
    this.mediaRecorderStyle,
    this.pauseIcon,
    Function(BuildContext, BaseMessage, PreviewMessageMode?)? onSendButtonTap,
    this.hideVoiceRecording,
    this.voiceRecordingIcon,
    this.aiIcon,
    this.aiIconURL,
    this.aiIconPackageName,
    this.aiOptionStyle,
    List<CometChatTextFormatter>? textFormatters,
    this.disableMentions,
    this.messageComposerKey,
    this.textEditingController,
  })  : assert(user != null || group != null,
            "One of user or group should be passed"),
        assert(user == null || group == null,
            "Only one of user or group should be passed"),
        cometChatMessageComposerController = CometChatMessageComposerController(
            parentMessageId: parentMessageId,
            disableSoundForMessages: disableSoundForMessages,
            customSoundForMessage: customSoundForMessage,
            customSoundForMessagePackage: customSoundForMessagePackage,
            group: group,
            user: user,
            text: text,
            disableTypingEvents: disableTypingEvents,
            hideLiveReaction: hideLiveReaction,
            attachmentOptions: attachmentOptions,
            liveReactionIconURL: liveReactionIconURL,
            stateCallBack: stateCallBack,
            footerView: footerView,
            headerView: headerView,
            onSendButtonTap: onSendButtonTap,
            onError: onError,
            aiOptionStyle: aiOptionStyle,
            theme: theme,
            textFormatters: textFormatters,
            textEditingController: textEditingController,
            disableMentions: disableMentions
        );

  ///sets [user] for message composer
  final User? user;

  ///set [group] for message composer
  final Group? group;

  ///[messageComposerStyle] message composer style
  final MessageComposerStyle messageComposerStyle;

  ///[auxiliaryButtonView] ui component to be forwarded to message input component
  final ComposerWidgetBuilder? auxiliaryButtonView;

  ///[secondaryButtonView] ui component to be forwarded to message input component
  final ComposerWidgetBuilder? secondaryButtonView;

  ///[sendButtonView] ui component to be forwarded to message input component
  final Widget? sendButtonView;

  ///[text] initial text for the input field
  final String? text;

  ///[placeholderText] hint text for input field
  final String? placeholderText;

  ///[onChange] callback to handle change in value of text in the input field
  final Function(String)? onChange;

  ///[maxLine] maximum lines allowed to increase in the input field
  final int? maxLine;

  ///[auxiliaryButtonsAlignment] controls position auxiliary button view
  final AuxiliaryButtonsAlignment? auxiliaryButtonsAlignment;

  ///[cometChatMessageComposerController] contains the business logic
  final CometChatMessageComposerController cometChatMessageComposerController;

  ///[attachmentIconURL] path of the icon to show in the attachments button
  final String? attachmentIconURL;

  ///[theme] sets the theme for this component
  final CometChatTheme? theme;

  ///[attachmentIcon] custom attachment icon
  final Widget? attachmentIcon;

  ///[liveReactionIcon] custom live reaction icon
  final Widget? liveReactionIcon;

  ///[recordIcon] provides icon to the start Icon/widget
  final Widget? recordIcon;

  ///[playIcon] provides icon to the play Icon/widget
  final Widget? playIcon;

  ///[deleteIcon] provides icon to the close Icon/widget
  final Widget? deleteIcon;

  ///[stopIcon] provides icon to the stop Icon/widget
  final Widget? stopIcon;

  ///[submitIcon] provides icon to the submit Icon/widget
  final Widget? submitIcon;

  ///[pauseIcon] provides icon to the play Icon/widget
  final Widget? pauseIcon;

  ///[mediaRecorderStyle] provides style to the media recorder
  final MediaRecorderStyle? mediaRecorderStyle;

  ///[hideVoiceRecording] provides option to hide voice recording
  final bool? hideVoiceRecording;

  ///[voiceRecordingIcon] provides icon to the voice recording Icon/widget
  final Widget? voiceRecordingIcon;

  final int parentMessageId;

  ///[attachmentIcon] custom ai icon
  final Widget? aiIcon;

  ///[aiIconURL] path of the icon to show in the ai button
  final String? aiIconURL;

  ///[aiIconPackageName] package name to show icon from
  final String? aiIconPackageName;

  ///set the style for ai options
  final AIOptionsStyle? aiOptionStyle;

  ///[disableMentions] disables mentions in the composer
  final bool? disableMentions;

  ///[messageComposerKey] key to identify the message composer
  final GlobalKey? messageComposerKey;

  ///[textEditingController] controls the state of the text field
  final TextEditingController? textEditingController;

  late Map<String, dynamic> composerId = {};

  Widget _getSendButton(
      CometChatTheme theme, CometChatMessageComposerController value) {
    if (value.textEditingController != null &&
        value.textEditingController!.text.isEmpty &&
        value.hideLiveReaction != true) {
      return IconButton(
        padding: const EdgeInsets.all(0),
        constraints: const BoxConstraints(),
        icon: liveReactionIcon ??
            Image.asset(AssetConstants.heart,
                package: UIConstants.packageName,
                color: theme.palette.getError()),
        onPressed: () async {
          if (value.hideLiveReaction != true) {
            try {
              value.sendLiveReaction();
            } catch (_) {}
            await Future.delayed(
                const Duration(milliseconds: LiveReactionConstants.timeout));
          }
        },
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal:4.0,vertical: 4),
        child: CircleAvatar(
          backgroundColor: Color(0xffB08F52),
          child: sendButtonView ??
              IconButton(
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(),
                  icon: Center(
                    child: messageComposerStyle.sendButtonIcon ??
                        Image.asset(
                          AssetConstants.send,
                          package: UIConstants.packageName,
                          color: Colors.white
                              // : messageComposerStyle.sendButtonIconTint ??
                              //     theme.palette.getPrimary(),
                        ),
                  ),
                  onPressed: value.onSendButtonClick),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final CometChatTheme theme = this.theme ?? cometChatTheme;

    if (group != null) {
      composerId['guid'] = group!.guid;
    } else if (user != null) {
      composerId['uid'] = user!.uid;
    }

    final List<CometChatMessageComposerAction> elementList =
        CometChatUIKit.getDataSource().getAIOptions(
            user, group, theme, context, composerId, aiOptionStyle);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Column(
          key: messageComposerKey,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: messageComposerStyle.gradient == null
                        ? messageComposerStyle.background ??
                            theme.palette.getBackground()
                        : null,
                    gradient: messageComposerStyle.gradient),
                padding: messageComposerStyle.contentPadding ??
                    const EdgeInsets.only(bottom: 10),
                child: GetBuilder(
                    init: cometChatMessageComposerController,
                    tag: cometChatMessageComposerController.tag,
                    dispose: (GetBuilderState<CometChatMessageComposerController>
                            state) =>
                        Get.delete<CometChatMessageComposerController>(
                            tag: state.controller?.tag),
                    builder: (CometChatMessageComposerController value) {
                      value.context = context;
                      if (value.getAttachmentOptionsCalled == false) {
                        value.getAttachmentOptionsCalled = true;
                        value.getAttachmentOptions(theme, context);
                      }
                      value.initializeHeaderAndFooterView();
                      return Column(
                        children: [
                          //-----message preview container-----

                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              if (value.messagePreviewTitle != null &&
                                  value.messagePreviewTitle!.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      bottom: (value.preview != null ? 8 : 0)),
                                  child: CometChatMessagePreview(
                                    messagePreviewTitle:
                                        value.messagePreviewTitle!,
                                    messagePreviewSubtitle:
                                        value.messagePreviewSubtitle ?? '',
                                    onCloseClick: value.onMessagePreviewClose,
                                    style: CometChatMessagePreviewStyle(
                                        messagePreviewTitleStyle: TextStyle(
                                            color: theme.palette.getAccent600(),
                                            fontSize:
                                                theme.typography.text2.fontSize,
                                            fontWeight:
                                                theme.typography.text2.fontWeight,
                                            fontFamily: theme
                                                .typography.text2.fontFamily),
                                        messagePreviewSubtitleStyle: TextStyle(
                                            color: theme.palette.getAccent600(),
                                            fontSize:
                                                theme.typography.text2.fontSize,
                                            fontWeight:
                                                theme.typography.text2.fontWeight,
                                            fontFamily: theme
                                                .typography.text2.fontFamily),
                                        closeIconColor:
                                            messageComposerStyle.closeIconTint ??
                                                theme.palette.getAccent500(),
                                        messagePreviewBorder: Border(
                                            left: BorderSide(
                                                color:
                                                    theme.palette.getAccent100(),
                                                width: 3))),
                                  ),
                                ),
                              if (value.preview != null) value.preview!,
                            ],
                          ),

                          //-----
                          Container(
                            decoration: BoxDecoration(
                              border: messageComposerStyle.border,
                              borderRadius: BorderRadius.all(Radius.circular(
                                  messageComposerStyle.borderRadius ?? 8.0)),
                            ),
                            child: Column(
                              children: [
                                if (value.header != null) value.header!,
                                Padding(
                                  padding: messageComposerStyle
                                          .messageInputPadding ??
                                      const EdgeInsets.symmetric(horizontal: 16),
                                  child: CometChatMessageInput(
                                    text: text,
                                    textEditingController:
                                        value.textEditingController,
                                    placeholderText: placeholderText,
                                    maxLine: maxLine,
                                    onChange: onChange ?? value.onChange,
                                    primaryButtonView:
                                        _getSendButton(theme, value),
                                    secondaryButtonView: secondaryButtonView !=
                                            null
                                        ? secondaryButtonView!(
                                            context,
                                            value.user,
                                            value.group,
                                            value.composerId)
                                        : IconButton(
                                            padding: const EdgeInsets.all(0),
                                            constraints: const BoxConstraints(),
                                            icon: Icon(Icons.photo_library_outlined),
                                            onPressed: () async {
                                              value.showBottomActionSheet(
                                                  theme, context);
                                            }),
                                    auxiliaryButtonsAlignment:
                                        auxiliaryButtonsAlignment ??
                                            AuxiliaryButtonsAlignment.right,
                                    auxiliaryButtonView: auxiliaryButtonView !=
                                            null
                                        ? auxiliaryButtonView!(
                                            context,
                                            value.user,
                                            value.group,
                                            value.composerId)
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              //-----show emoji keyboard-----

                                              CometChatUIKit.getDataSource()
                                                  .getAuxiliaryOptions(
                                                      value.user,
                                                      value.group,
                                                      context,
                                                      value.composerId,
                                                      theme)
                                                ..paddingAll(0.0)
                                                ..marginAll(0.0),

                                              if (elementList.isNotEmpty)
                                                IconButton(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    constraints:
                                                        const BoxConstraints(),
                                                    icon: aiIcon ??
                                                        Image.asset(
                                                          aiIconURL ??
                                                              AssetConstants.ai,
                                                          package:
                                                              aiIconPackageName ??
                                                                  UIConstants
                                                                      .packageName,
                                                          color: messageComposerStyle
                                                                  .aiIconTint ??
                                                              theme.palette
                                                                  .getAccent700(),
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                    onPressed: () {
                                                      value.aiButtonTap(
                                                          theme,
                                                          context,
                                                          value.composerId);
                                                    }),

                                              //-----show voice recording-----
                                              if (hideVoiceRecording != true)
                                                IconButton(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    constraints:
                                                        const BoxConstraints(),
                                                    icon: voiceRecordingIcon ??
                                                        Image.asset(
                                                          AssetConstants
                                                              .microphone,
                                                          package: UIConstants
                                                              .packageName,
                                                          color: messageComposerStyle
                                                                  .voiceRecordingIconTint ??
                                                              theme.palette
                                                                  .getAccent700(),
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                    onPressed: () {
                                                      showModalBottomSheet<void>(
                                                        context: context,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        builder: (BuildContext
                                                            context) {
                                                          return CometChatMediaRecorder(
                                                            submitIcon:
                                                                submitIcon,
                                                            startIcon: recordIcon,
                                                            playIcon: playIcon,
                                                            pauseIcon: pauseIcon,
                                                            closeIcon: deleteIcon,
                                                            stopIcon: stopIcon,
                                                            mediaRecorderStyle:
                                                                mediaRecorderStyle,
                                                            theme: theme,
                                                            onSubmit: value
                                                                .sendMediaRecording,
                                                          );
                                                        },
                                                      );
                                                    }),
                                            ],
                                          ),
                                    style: MessageInputStyle(
                                        dividerTint:
                                            messageComposerStyle.dividerTint ??
                                                theme.palette.getAccent500(),
                                        background: messageComposerStyle
                                                .inputBackground ??
                                            theme.palette.getAccent100(),
                                        gradient:
                                            messageComposerStyle.inputGradient,
                                        textStyle:
                                            messageComposerStyle.inputTextStyle,
                                        placeholderTextStyle: messageComposerStyle
                                            .placeholderTextStyle),
                                    focusNode: value.focusNode,
                                  ),
                                ),
                                if (value.footer != null) value.footer!,
                              ],
                            ),
                          ),
                        ],
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
