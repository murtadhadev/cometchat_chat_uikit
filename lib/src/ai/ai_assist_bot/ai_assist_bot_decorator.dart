import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';

///[AIAssistBotDecorator] is a the view model for [AIAssistBotExtension] it contains all the relevant business logic
///it is also a sub-class of [DataSourceDecorator] which allows any extension to override the default methods provided by [MessagesDataSource]
class AIAssistBotDecorator extends DataSourceDecorator {
  User? loggedInUser;
  AIAssistBotConfiguration? configuration;
  List<User> aiBots = [];
  late UsersRequest usersRequest;
<<<<<<< HEAD
   Map<String, User> idUserMap = {};
=======
  Map<String, User> idUserMap = {};
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  User? receiverUser;
  Group? receiverGroup;
  int messageId = 0;

<<<<<<< HEAD


  Map<String , dynamic> getMapForSentMessage(BaseMessage message){
    String? uid;
    String? guid;
    if(message.receiverType== ReceiverTypeConstants.user){
      uid= message.receiverUid;
    }else{
      guid = message.receiverUid;
    }
    Map<String , dynamic > idMap =   UIEventUtils.createMap(uid, guid, 0);
    return idMap;
  }

  Map<String , dynamic> getMapForReceivedMessage(BaseMessage message){
    String? uid;
    String? guid;
    if(message.receiverType== ReceiverTypeConstants.user){
      uid= message.sender!.uid;
    }else{
      guid = message.receiverUid;
    }
    Map<String , dynamic > idMap =   UIEventUtils.createMap(uid, guid, 0);
    return idMap;
  }




  AIAssistBotDecorator(DataSource dataSource, {this.configuration})
      : super(dataSource) {
=======
  Map<String, dynamic> getMapForSentMessage(BaseMessage message) {
    String? uid;
    String? guid;
    if (message.receiverType == ReceiverTypeConstants.user) {
      uid = message.receiverUid;
    } else {
      guid = message.receiverUid;
    }
    Map<String, dynamic> idMap = UIEventUtils.createMap(uid, guid, 0);
    return idMap;
  }

  Map<String, dynamic> getMapForReceivedMessage(BaseMessage message) {
    String? uid;
    String? guid;
    if (message.receiverType == ReceiverTypeConstants.user) {
      uid = message.sender!.uid;
    } else {
      guid = message.receiverUid;
    }
    Map<String, dynamic> idMap = UIEventUtils.createMap(uid, guid, 0);
    return idMap;
  }

  AIAssistBotDecorator(super.dataSource, {this.configuration}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    getLoggedInUser();
    fetchBots();
  }

  getLoggedInUser() async {
    loggedInUser = await CometChat.getLoggedInUser();
  }

<<<<<<< HEAD
  fetchBots(){
    UsersRequestBuilder usersRequestBuilder = UsersRequestBuilder()
        ..tags = ["aibot"]
        ..limit = 30;

    usersRequest =  usersRequestBuilder.build();
    usersRequest.fetchNext(onSuccess: (List<User> userList){
      aiBots.addAll(userList);
    }, onError: (CometChatException excep){});

  }



  hideSummaryPanel(Map<String, dynamic>? id){
    CometChatUIEvents.hidePanel(id, CustomUIPosition.composerTop);
  }


  List<CometChatMessageComposerAction> createBotActions(){
=======
  fetchBots() {
    UsersRequestBuilder usersRequestBuilder = UsersRequestBuilder()
      ..tags = ["aibot"]
      ..limit = 30;

    usersRequest = usersRequestBuilder.build();
    usersRequest.fetchNext(
        onSuccess: (List<User> userList) {
          aiBots.addAll(userList);
        },
        onError: (CometChatException excep) {});
  }

  hideSummaryPanel(Map<String, dynamic>? id) {
    CometChatUIEvents.hidePanel(id, CustomUIPosition.composerTop);
  }

  List<CometChatMessageComposerAction> createBotActions() {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    List<CometChatMessageComposerAction> actionList = [];

    for (var aiBot in aiBots) {
      actionList.add(CometChatMessageComposerAction(
<<<<<<< HEAD
        id: aiBot.uid,
        title:  aiBot.name,
        onItemClick: (BuildContext context,  User? user, Group? group){
          showAssistBot(context, aiBot, user, group);
        }
      ));
    }


    return actionList;


  }


  @override
  List<CometChatMessageComposerAction> getAIOptions(User? user, Group? group, CometChatTheme theme, BuildContext context, Map<String, dynamic>? id, AIOptionsStyle? aiOptionStyle) {
    List<CometChatMessageComposerAction> actionList =  super.getAIOptions(user, group, theme, context, id, aiOptionStyle);

    if ( !(id?.containsKey(IDMapConstants.parentMessageId) ??false) ) {
      if (aiBots.isNotEmpty) {
        receiverUser = user;
        receiverGroup = group;
        CometChatMessageComposerAction action =
        CometChatMessageComposerAction( id:  getId() , title:  aiBots.length ==1?  " ${Translations.of(context).ask} ${aiBots[0].name} ${Translations.of(context).bot}": Translations.of(context).ask_bot,
          onItemClick: (BuildContext context , User? user , Group? group ) async {
          if(aiBots.length>1){
            showCometChatAiOptionSheet(context: context,
            theme: theme,
            user: user,
            group: group,
            actionItems: createBotActions());
          }else{
            showAssistBot(context , aiBots[0], user, group  );
          }
        }
        );
=======
          id: aiBot.uid,
          title: aiBot.name,
          onItemClick: (BuildContext context, User? user, Group? group) {
            showAssistBot(context, aiBot, user, group);
          }));
    }

    return actionList;
  }

  @override
  List<CometChatMessageComposerAction> getAIOptions(
      User? user,
      Group? group,
      CometChatTheme theme,
      BuildContext context,
      Map<String, dynamic>? id,
      AIOptionsStyle? aiOptionStyle) {
    List<CometChatMessageComposerAction> actionList =
        super.getAIOptions(user, group, theme, context, id, aiOptionStyle);

    if (!(id?.containsKey(IDMapConstants.parentMessageId) ?? false)) {
      if (aiBots.isNotEmpty) {
        receiverUser = user;
        receiverGroup = group;
        CometChatMessageComposerAction action = CometChatMessageComposerAction(
            id: getId(),
            title: aiBots.length == 1
                ? " ${Translations.of(context).ask} ${aiBots[0].name} ${Translations.of(context).bot}"
                : Translations.of(context).askBot,
            onItemClick:
                (BuildContext context, User? user, Group? group) async {
              if (aiBots.length > 1) {
                showCometChatAiOptionSheet(
                    context: context,
                    theme: theme,
                    user: user,
                    group: group,
                    actionItems: createBotActions());
              } else {
                showAssistBot(context, aiBots[0], user, group);
              }
            });
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

        actionList.add(action);
      }
    }
    return actionList;
<<<<<<< HEAD

  }


  showAssistBot(BuildContext context , User aiBot ,  User? user, Group? group) async {

    Map<String, dynamic>?  apiMap;

    if(configuration!=null && configuration?.apiConfiguration!=null){
      apiMap =  await configuration?.apiConfiguration!(aiBot, user, group);
    }


    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (c) => AIAssistBotView(aiBot: aiBot,loggedInUser: loggedInUser!,
        user: user ,
        group: group,
        assistBotStyle: configuration?.aiAssistBotStyle,
          loadingStateText: configuration?.loadingStateText,
          emptyIconUrl: configuration?.emptyIconUrl,
          loadingStateView: configuration?.loadingStateView,
          loadingIconUrl: configuration?.loadingIconUrl,
          errorStateView: configuration?.errorStateView,
          emptyStateView: configuration?.errorStateView,
          errorIconUrl: configuration?.errorIconUrl,
          title: configuration?.title,
          onCloseIconTap: configuration?.onCloseIconTap,
          theme:configuration?.theme??cometChatTheme,
          apiConfiguration: apiMap,
        ));

  }




=======
  }

  showAssistBot(context, User aiBot, User? user, Group? group) async {
    Map<String, dynamic>? apiMap;

    if (configuration != null && configuration?.apiConfiguration != null) {
      apiMap = await configuration?.apiConfiguration!(aiBot, user, group);
    }

    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (c) => AIAssistBotView(
              aiBot: aiBot,
              loggedInUser: loggedInUser!,
              user: user,
              group: group,
              assistBotStyle: configuration?.aiAssistBotStyle,
              loadingStateText: configuration?.loadingStateText,
              emptyIconUrl: configuration?.emptyIconUrl,
              loadingStateView: configuration?.loadingStateView,
              loadingIconUrl: configuration?.loadingIconUrl,
              errorStateView: configuration?.errorStateView,
              emptyStateView: configuration?.errorStateView,
              errorIconUrl: configuration?.errorIconUrl,
              title: configuration?.title,
              onCloseIconTap: configuration?.onCloseIconTap,
              theme: configuration?.theme ?? cometChatTheme,
              apiConfiguration: apiMap,
            ));
  }

>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  @override
  String getId() {
    return "aiAssistBot";
  }
}
