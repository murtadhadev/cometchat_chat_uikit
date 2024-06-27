import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[MessageExtensionTranslationDecorator] is a the view model for [MessageTranslationExtension] it contains all the relevant business logic
///it is also a sub-class of [DataSourceDecorator] which allows any extension to override the default methods provided by [MessagesDataSource]
class MessageExtensionTranslationDecorator extends DataSourceDecorator {
  String messageTranslationTypeConstant = 'message-translation';
  String translateMessage = "translateMessage";
  MessageTranslationConfiguration? configuration;

<<<<<<< HEAD
  MessageExtensionTranslationDecorator(DataSource dataSource, {this.configuration}) : super(dataSource);

  @override
  Widget getTextMessageContentView(
      TextMessage message, BuildContext context, BubbleAlignment alignment, CometChatTheme theme,
      {TextBubbleStyle? textStyle}) {
    return getContentView(message, context, alignment, theme);
  }

  @override
  List<CometChatMessageOption> getTextMessageOptions(
      User loggedInUser, BaseMessage messageObject, BuildContext context, Group? group) {
    List<CometChatMessageOption> textTemplateOptions =
        super.getTextMessageOptions(loggedInUser, messageObject, context, group);

    if (messageObject.metadata != null && messageObject.metadata!.containsKey('translated_message') == false) {
=======
  MessageExtensionTranslationDecorator(super.dataSource, {this.configuration});

  @override
  Widget getTextMessageContentView(TextMessage message, BuildContext context,
      BubbleAlignment alignment, CometChatTheme theme,
      {AdditionalConfigurations? additionalConfigurations}) {
    return getContentView(message, context, alignment, theme,
        additionalConfigurations: additionalConfigurations);
  }

  @override
  List<CometChatMessageOption> getTextMessageOptions(User loggedInUser,
      BaseMessage messageObject, BuildContext context, Group? group) {
    List<CometChatMessageOption> textTemplateOptions = super
        .getTextMessageOptions(loggedInUser, messageObject, context, group);

    if (messageObject.metadata != null &&
        messageObject.metadata!.containsKey('translated_message') == false) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      textTemplateOptions.add(getOption(context));
    }

    return textTemplateOptions;
  }

  @override
  String getId() {
    return "MessageTranslation";
  }

  CometChatMessageOption getOption(BuildContext context) {
    return CometChatMessageOption(
        id: translateMessage,
<<<<<<< HEAD
        title: configuration?.optionTitle ?? Translations.of(context).translate_message,
        icon: configuration?.optionIconUrl ?? AssetConstants.translate,
        packageName: configuration?.optionIconUrlPackageName ?? UIConstants.packageName,
        iconTint: configuration?.optionStyle?.iconTint,
        titleStyle: configuration?.optionStyle?.titleStyle,
        onClick: (BaseMessage message, CometChatMessageListControllerProtocol state) async {
=======
        title: configuration?.optionTitle ??
            Translations.of(context).translateMessage,
        icon: configuration?.optionIconUrl ?? AssetConstants.translate,
        packageName:
            configuration?.optionIconUrlPackageName ?? UIConstants.packageName,
        iconTint: configuration?.optionStyle?.iconTint,
        titleStyle: configuration?.optionStyle?.titleStyle,
        onClick: (BaseMessage message,
            CometChatMessageListControllerProtocol state) async {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          if (state is CometChatMessageListController) {
            _translateMessage(message, context, state);
          }
        });
  }

<<<<<<< HEAD
  _translateMessage(BaseMessage message, BuildContext context, CometChatMessageListController state) {
    CometChatTheme theme = cometChatTheme;
    if (message is TextMessage) {
      CometChat.callExtension(messageTranslationTypeConstant, 'POST', ExtensionUrls.translate, {
=======
  _translateMessage(BaseMessage message, BuildContext context,
      CometChatMessageListController state) {
    CometChatTheme theme = cometChatTheme;
    if (message is TextMessage) {
      CometChat.callExtension(
          messageTranslationTypeConstant, 'POST', ExtensionUrls.translate, {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        "msgId": message.id,
        "text": message.text,
        "languages": [Localizations.localeOf(context).languageCode]
      }, onSuccess: (Map<String, dynamic> res) {
        Map<String, dynamic>? data = res["data"];
        if (data != null && data.containsKey('translations')) {
<<<<<<< HEAD
          String? translatedMessage = data['translations']?[0]?['message_translated'];

          if (translatedMessage != null && translatedMessage.isNotEmpty && translatedMessage != message.text) {
            Map<String, dynamic> metadata = message.metadata ?? <String, dynamic>{};
=======
          String? translatedMessage =
              data['translations']?[0]?['message_translated'];

          if (translatedMessage != null &&
              translatedMessage.isNotEmpty &&
              translatedMessage != message.text) {
            Map<String, dynamic> metadata =
                message.metadata ?? <String, dynamic>{};
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            metadata.addAll({'translated_message': translatedMessage});
            message.metadata = metadata;
            state.updateElement(message);
          } else {
            _showDialogPopUp(
<<<<<<< HEAD
                "Selected language for translation is similar to the language of original message", theme, context);
=======
                "Selected language for translation is similar to the language of original message",
                theme,
                context);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          }
        }
      }, onError: (CometChatException e) {
        String error = getErrorTranslatedText(context, e.code);
        _showDialogPopUp(error, theme, context);
      });
    }
  }

<<<<<<< HEAD
  Widget getContentView(TextMessage message, BuildContext context, BubbleAlignment alignment, CometChatTheme theme) {
    Widget? child = super.getTextMessageContentView(message, context, alignment, theme);
    if (message.metadata != null && message.metadata!.containsKey('translated_message')) {
      return MessageTranslationBubble(
        translatedText: message.metadata?['translated_message'],
        ctheme: configuration?.theme ?? theme,
=======
  Widget getContentView(TextMessage message, BuildContext context,
      BubbleAlignment alignment, CometChatTheme theme,
      {AdditionalConfigurations? additionalConfigurations}) {
    Widget? child = super.getTextMessageContentView(
        message, context, alignment, theme,
        additionalConfigurations: additionalConfigurations);
    if (message.metadata != null &&
        message.metadata!.containsKey('translated_message')) {
      String? translatedText = message.metadata?['translated_message'];
      if (message.mentionedUsers.isNotEmpty &&
          translatedText != null &&
          translatedText.isNotEmpty) {
        translatedText = CometChatMentionsFormatter.getTextWithMentions(
            translatedText, message.mentionedUsers);
      }

      return MessageTranslationBubble(
        translatedText: translatedText ?? "",
        theme: configuration?.theme ?? theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        alignment: alignment,
        style: configuration?.style,
        child: child,
      );
    } else {
      return child;
    }
  }

  String getErrorTranslatedText(BuildContext context, String errorCode) {
    if (errorCode == "ERROR_INTERNET_UNAVAILABLE") {
<<<<<<< HEAD
      return Translations.of(context).error_internet_unavailable;
    } else {}

    return Translations.of(context).something_went_wrong_error;
=======
      return Translations.of(context).errorInternetUnavailable;
    } else {}

    return Translations.of(context).somethingWentWrongError;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

  _showDialogPopUp(String message, CometChatTheme theme, BuildContext context) {
    showCometChatConfirmDialog(
        context: context,
        messageText: Text(
          message,
          style: TextStyle(
              fontSize: theme.typography.title2.fontSize,
              fontWeight: theme.typography.title2.fontWeight,
              color: theme.palette.getAccent(),
              fontFamily: theme.typography.title2.fontFamily),
        ),
        style: ConfirmDialogStyle(
            backgroundColor: theme.palette.mode == PaletteThemeModes.light
                ? theme.palette.getBackground()
<<<<<<< HEAD
                : Color.alphaBlend(theme.palette.getAccent200(), theme.palette.getBackground()),
=======
                : Color.alphaBlend(theme.palette.getAccent200(),
                    theme.palette.getBackground()),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            shadowColor: theme.palette.getAccent300(),
            confirmButtonTextStyle: TextStyle(
                fontSize: theme.typography.text2.fontSize,
                fontWeight: theme.typography.text2.fontWeight,
                color: theme.palette.getPrimary())),
        confirmButtonText: Translations.of(context).okay,
        onConfirm: () {
          Navigator.pop(context);
        });
  }
}
