import 'package:flutter/material.dart';
import '../../../../../cometchat_chat_uikit.dart';

///[PollsExtensionDecorator] is a the view model for [PollsExtension] it contains all the relevant business logic
///it is also a sub-class of [DataSourceDecorator] which allows any extension to override the default methods provided by [MessagesDataSource]
class PollsExtensionDecorator extends DataSourceDecorator {
  String pollsTypeConstant = "extension_poll";
  PollsConfiguration? configuration;

  User? loggedInUser;

<<<<<<< HEAD
  PollsExtensionDecorator(DataSource dataSource, {this.configuration}) : super(dataSource) {
=======
  PollsExtensionDecorator(super.dataSource, {this.configuration}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    getLoggedInUser();
  }

  getLoggedInUser() async {
    loggedInUser = await CometChat.getLoggedInUser();
  }

  @override
  String getId() {
    return "Polls";
  }

  @override
  List<String> getAllMessageTypes() {
    List<String> ab = super.getAllMessageTypes();
    ab.add(pollsTypeConstant);

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
    BaseMessage? message = conversation.lastMessage;
    if (message != null && message.type == pollsTypeConstant && message.category == MessageCategoryConstants.custom) {
      return Translations.of(context).custom_message_poll;
=======
  String getLastConversationMessage(
      Conversation conversation, BuildContext context) {
    BaseMessage? message = conversation.lastMessage;
    if (message != null &&
        message.type == pollsTypeConstant &&
        message.category == MessageCategoryConstants.custom) {
      return Translations.of(context).customMessagePoll;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    } else {
      return super.getLastConversationMessage(conversation, context);
    }
  }

  CometChatMessageTemplate getTemplate({CometChatTheme? theme}) {
    CometChatTheme theme0 = theme ?? cometChatTheme;

    return CometChatMessageTemplate(
        type: pollsTypeConstant,
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
    return CometChatPollsBubble(
      loggedInUser: loggedInUser?.uid,
<<<<<<< HEAD
      ctheme: configuration?.theme ?? theme,
=======
      theme: configuration?.theme ?? theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      choosePoll: choosePoll,
      senderUid: customMessage.sender?.uid,
      pollQuestion: customMessage.customData?["question"] ?? "",
      pollId: customMessage.customData?["id"],
      metadata: getPollsResult(customMessage),
      style: configuration?.pollsBubbleStyle,
    );
  }

  CometChatMessageComposerAction getAttachmentOption(
      CometChatTheme theme, BuildContext context, Map<String, dynamic>? id) {
    return CometChatMessageComposerAction(
        id: pollsTypeConstant,
<<<<<<< HEAD
        title: configuration?.optionTitle ?? '${Translations.of(context).poll}s',
        iconUrl: configuration?.optionIconUrl ?? AssetConstants.polls,
        iconUrlPackageName: configuration?.optionIconUrlPackageName ?? UIConstants.packageName,
=======
        title:
            configuration?.optionTitle ?? '${Translations.of(context).poll}s',
        iconUrl: configuration?.optionIconUrl ?? AssetConstants.polls,
        iconUrlPackageName:
            configuration?.optionIconUrlPackageName ?? UIConstants.packageName,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        titleStyle: TextStyle(
                color: theme.palette.getAccent(),
                fontSize: theme.typography.subtitle1.fontSize,
                fontWeight: theme.typography.subtitle1.fontWeight)
            .merge(configuration?.optionStyle?.titleStyle),
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
          if (user != null) {
            uid = user.uid;
          }
          if (group != null) {
            guid = group.guid;
          }
          if (uid != null || guid != null) {
            return Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreatePoll(
                          user: uid,
                          group: guid,
                          theme: theme,
                          style: configuration?.createPollsStyle,
                          addAnswerText: configuration?.addAnswerText,
                          answerHelpText: configuration?.answerHelpText,
<<<<<<< HEAD
                          answerPlaceholderText: configuration?.answerPlaceholderText,
                          closeIcon: configuration?.closeIcon,
                          createPollIcon: configuration?.createPollIcon,
                          deleteIcon: configuration?.deleteIcon,
                          questionPlaceholderText: configuration?.questionPlaceholderText,
=======
                          answerPlaceholderText:
                              configuration?.answerPlaceholderText,
                          closeIcon: configuration?.closeIcon,
                          createPollIcon: configuration?.createPollIcon,
                          deleteIcon: configuration?.deleteIcon,
                          questionPlaceholderText:
                              configuration?.questionPlaceholderText,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                          title: configuration?.title,
                        )));
          }
        });
  }

  Future<void> choosePoll(String vote, String id) async {
    Map<String, dynamic> body = {"vote": vote, "id": id};

<<<<<<< HEAD
    await CometChat.callExtension(ExtensionConstants.polls, "POST", ExtensionUrls.votePoll, body,
        onSuccess: (Map<String, dynamic> map) {}, onError: (CometChatException e) {
=======
    await CometChat.callExtension(
        ExtensionConstants.polls, "POST", ExtensionUrls.votePoll, body,
        onSuccess: (Map<String, dynamic> map) {},
        onError: (CometChatException e) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      debugPrint('${e.message}');
    });
  }

  Map<String, dynamic> getPollsResult(BaseMessage baseMessage) {
    Map<String, dynamic> result = {};
<<<<<<< HEAD
    Map<String, Map>? extensionList = ExtensionModerator.extensionCheck(baseMessage);
=======
    Map<String, Map>? extensionList =
        ExtensionModerator.extensionCheck(baseMessage);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (extensionList != null) {
      try {
        if (extensionList.containsKey(ExtensionConstants.polls)) {
          Map? polls = extensionList[ExtensionConstants.polls];
          if (polls != null) {
            if (polls.containsKey("results")) {
              result = polls["results"];
            }
          }
        }
      } catch (e, stacktrace) {
        debugPrint("$stacktrace");
      }
    }
    return result;
  }

  bool isNotThread(Map<String, dynamic>? id) {
    int? parentMessageId;
    if (id != null && id.containsKey('parentMessageId')) {
      parentMessageId = id['parentMessageId'];
    }
    return parentMessageId == 0 || parentMessageId == null;
  }
}
