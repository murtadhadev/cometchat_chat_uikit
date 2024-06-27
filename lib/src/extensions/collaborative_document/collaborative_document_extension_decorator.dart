import 'package:flutter/material.dart';
import '../../../../../cometchat_chat_uikit.dart';

///[CollaborativeDocumentExtensionDecorator] is a the view model for [CollaborativeDocumentExtension] it contains all the relevant business logic
///it is also a sub-class of [DataSourceDecorator] which allows any extension to override the default methods provided by [MessagesDataSource]
class CollaborativeDocumentExtensionDecorator extends DataSourceDecorator {
  String collaborativeDocumentExtensionTypeConstant = ExtensionType.document;
  CollaborativeDocumentConfiguration? configuration;

  User? loggedInUser;

<<<<<<< HEAD
  CollaborativeDocumentExtensionDecorator(DataSource dataSource, {this.configuration}) : super(dataSource) {
=======
  CollaborativeDocumentExtensionDecorator(super.dataSource,
      {this.configuration}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    getLoggedInUser();
  }

  getLoggedInUser() async {
    loggedInUser = await CometChat.getLoggedInUser();
  }

  @override
  String getId() {
    return "CollaborativeDocument";
  }

  @override
  List<String> getAllMessageTypes() {
    List<String> ab = super.getAllMessageTypes();
    ab.add(collaborativeDocumentExtensionTypeConstant);

    return ab;
  }

  @override
  List<String> getAllMessageCategories() {
    List<String> categoryList = super.getAllMessageCategories();
    if (!categoryList.contains(MessageCategoryConstants.custom)) {
      categoryList.add(MessageCategoryConstants.custom);
    }
    return categoryList;
  }

  @override
<<<<<<< HEAD
  List<CometChatMessageTemplate> getAllMessageTemplates({CometChatTheme? theme}) {
    CometChatTheme theme0 = theme ?? cometChatTheme;

    List<CometChatMessageTemplate> templateList = super.getAllMessageTemplates(theme: theme0);
=======
  List<CometChatMessageTemplate> getAllMessageTemplates(
      {CometChatTheme? theme}) {
    CometChatTheme theme0 = theme ?? cometChatTheme;

    List<CometChatMessageTemplate> templateList =
        super.getAllMessageTemplates(theme: theme0);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    templateList.add(getTemplate(theme: theme0));

    return templateList;
  }

  @override
  List<CometChatMessageComposerAction> getAttachmentOptions(
      CometChatTheme theme, BuildContext context, Map<String, dynamic>? id) {
<<<<<<< HEAD
    List<CometChatMessageComposerAction> actions = super.getAttachmentOptions(theme, context, id);
=======
    List<CometChatMessageComposerAction> actions =
        super.getAttachmentOptions(theme, context, id);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (isNotThread(id)) {
      actions.add(getAttachmentOption(theme, context, id));
    }
    return actions;
  }

  @override
<<<<<<< HEAD
  String getLastConversationMessage(Conversation conversation, BuildContext context) {
=======
  String getLastConversationMessage(
      Conversation conversation, BuildContext context) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    BaseMessage? message = conversation.lastMessage;
    if (message != null &&
        message.type == collaborativeDocumentExtensionTypeConstant &&
        message.category == MessageCategoryConstants.custom) {
<<<<<<< HEAD
      return Translations.of(context).custom_message_document;
=======
      return Translations.of(context).customMessageDocument;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    } else {
      return super.getLastConversationMessage(conversation, context);
    }
  }

  CometChatMessageTemplate getTemplate({CometChatTheme? theme}) {
    CometChatTheme theme0 = theme ?? cometChatTheme;

    return CometChatMessageTemplate(
        type: collaborativeDocumentExtensionTypeConstant,
        category: CometChatMessageCategory.custom,
<<<<<<< HEAD
        contentView: (BaseMessage message, BuildContext context, BubbleAlignment alignment) {
=======
        contentView: (BaseMessage message, BuildContext context,
            BubbleAlignment alignment,
            {AdditionalConfigurations? additionalConfigurations}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          return getContentView(message as CustomMessage, theme0, context);
        },
        options: CometChatUIKit.getDataSource().getCommonOptions,
        bottomView: CometChatUIKit.getDataSource().getBottomView);
  }

<<<<<<< HEAD
  Widget getContentView(CustomMessage customMessage, CometChatTheme theme, BuildContext context) {
=======
  Widget getContentView(
      CustomMessage customMessage, CometChatTheme theme, BuildContext context) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (customMessage.deletedAt != null) {
      return super.getDeleteMessageBubble(customMessage, theme);
    }
    return CometChatCollaborativeDocumentBubble(
      url: getWebViewUrl(customMessage),
      title: configuration?.title,
      subtitle: configuration?.subtitle,
      buttonText: configuration?.buttonText,
      icon: configuration?.icon,
<<<<<<< HEAD
      ctheme: configuration?.theme,
=======
      theme: configuration?.theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      style: DocumentBubbleStyle(
          background: configuration?.style?.background,
          dividerColor: configuration?.style?.dividerColor,
          buttonTextStyle: configuration?.style?.buttonTextStyle,
          subtitleStyle: configuration?.style?.subtitleStyle,
          titleStyle: configuration?.style?.titleStyle,
          iconTint: configuration?.style?.iconTint,
          webViewAppBarColor: configuration?.style?.webViewAppBarColor,
          webViewBackIconColor: configuration?.style?.webViewBackIconColor,
          webViewTitleStyle: configuration?.style?.webViewTitleStyle),
    );
  }

<<<<<<< HEAD
  sendCollaborativeDocument(BuildContext context, String receiverID, String receiverType, CometChatTheme theme) {
    CometChat.callExtension(ExtensionConstants.document, "POST", ExtensionUrls.document,
        {"receiver": receiverID, "receiverType": receiverType}, onSuccess: (Map<String, dynamic> map) {
=======
  sendCollaborativeDocument(BuildContext context, String receiverID,
      String receiverType, CometChatTheme theme) {
    CometChat.callExtension(
        ExtensionConstants.document,
        "POST",
        ExtensionUrls.document,
        {"receiver": receiverID, "receiverType": receiverType},
        onSuccess: (Map<String, dynamic> map) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      debugPrint("Success map $map");
    }, onError: (CometChatException e) {
      debugPrint('$e');
      String error = getErrorTranslatedText(context, e.code);
      showCometChatConfirmDialog(
          context: context,
          messageText: Text(
            error,
            style: TextStyle(
                fontSize: theme.typography.title2.fontSize,
                fontWeight: theme.typography.title2.fontWeight,
                color: theme.palette.getAccent(),
                fontFamily: theme.typography.title2.fontFamily),
          ),
<<<<<<< HEAD
          confirmButtonText: Translations.of(context).try_again,
          cancelButtonText: Translations.of(context).cancel_capital,
=======
          confirmButtonText: Translations.of(context).tryAgain,
          cancelButtonText: Translations.of(context).cancelCapital,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          onConfirm: () {
            Navigator.pop(context);
            sendCollaborativeDocument(context, receiverID, receiverType, theme);
          });
    });
  }

  CometChatMessageComposerAction getAttachmentOption(
      CometChatTheme theme, BuildContext context, Map<String, dynamic>? id) {
    return CometChatMessageComposerAction(
        id: collaborativeDocumentExtensionTypeConstant,
<<<<<<< HEAD
        title: configuration?.optionTitle ?? Translations.of(context).collaborative_document,
        iconUrl: configuration?.optionIconUrl ?? AssetConstants.collaborativeDocument,
        iconUrlPackageName: configuration?.optionIconUrlPackageName ?? UIConstants.packageName,
=======
        title: configuration?.optionTitle ??
            Translations.of(context).collaborativeDocument,
        iconUrl: configuration?.optionIconUrl ??
            AssetConstants.collaborativeDocument,
        iconUrlPackageName:
            configuration?.optionIconUrlPackageName ?? UIConstants.packageName,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        titleStyle: configuration?.optionStyle?.titleStyle ??
            TextStyle(
                color: theme.palette.getAccent(),
                fontSize: theme.typography.subtitle1.fontSize,
                fontWeight: theme.typography.subtitle1.fontWeight),
<<<<<<< HEAD
        iconTint: configuration?.optionStyle?.iconTint ?? theme.palette.getAccent700(),
=======
        iconTint: configuration?.optionStyle?.iconTint ??
            theme.palette.getAccent700(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        background: configuration?.optionStyle?.background,
        cornerRadius: configuration?.optionStyle?.cornerRadius,
        iconBackground: configuration?.optionStyle?.iconBackground,
        iconCornerRadius: configuration?.optionStyle?.iconCornerRadius,
        onItemClick: (context, user, group) {
          String? uid, guid;
          String receiverType = '';
          if (user != null) {
            uid = user.uid;
            receiverType = ReceiverTypeConstants.user;
          }
          if (group != null) {
            guid = group.guid;
            receiverType = ReceiverTypeConstants.group;
          }

          if (uid != null || guid != null) {
<<<<<<< HEAD
            sendCollaborativeDocument(context, uid ?? guid ?? '', receiverType, theme);
=======
            sendCollaborativeDocument(
                context, uid ?? guid ?? '', receiverType, theme);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          }
        });
  }

  String? getWebViewUrl(CustomMessage? messageObject) {
    if (messageObject != null &&
        messageObject.customData != null &&
        messageObject.customData!.containsKey("document")) {
      Map? document = messageObject.customData?["document"];
      if (document != null && document.containsKey("document_url")) {
        return document["document_url"];
      }
    }
    return null;
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

  bool isNotThread(Map<String, dynamic>? id) {
    int? parentMessageId;
    if (id != null && id.containsKey('parentMessageId')) {
      parentMessageId = id['parentMessageId'];
    }
    return parentMessageId == 0 || parentMessageId == null;
  }
}
