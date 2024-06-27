import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[AIConversationStarterDecorator] is a the view model for [AIConversationStarterExtension] it contains all the relevant business logic
///it is also a sub-class of [DataSourceDecorator] which allows any extension to override the default methods provided by [MessagesDataSource]
class AIConversationStarterDecorator extends DataSourceDecorator
<<<<<<< HEAD
    with CometChatUIEventListener ,CometChatMessageEventListener {
=======
    with CometChatUIEventListener, CometChatMessageEventListener {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  late String dateStamp;
  late String _listenerId;
  User? loggedInUser;
  AIConversationStarterConfiguration? configuration;

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



  @override
  void ccMessageSent(BaseMessage message, MessageStatus messageStatus){

    Map<String , dynamic > idMap =  getMapForSentMessage(message);
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

  @override
  void ccMessageSent(BaseMessage message, MessageStatus messageStatus) {
    Map<String, dynamic> idMap = getMapForSentMessage(message);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    hideSummaryPanel(idMap);
  }

  @override
<<<<<<< HEAD
  void onTextMessageReceived(TextMessage textMessage){

    Map<String , dynamic > idMap =  getMapForReceivedMessage(textMessage);
    hideSummaryPanel(idMap);

  }

  @override
  void onMediaMessageReceived(MediaMessage mediaMessage){
    Map<String , dynamic > idMap =  getMapForReceivedMessage(mediaMessage);
=======
  void onTextMessageReceived(TextMessage textMessage) {
    Map<String, dynamic> idMap = getMapForReceivedMessage(textMessage);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    hideSummaryPanel(idMap);
  }

  @override
<<<<<<< HEAD
  void onCustomMessageReceived(CustomMessage customMessage){
    Map<String , dynamic > idMap =  getMapForReceivedMessage(customMessage);
=======
  void onMediaMessageReceived(MediaMessage mediaMessage) {
    Map<String, dynamic> idMap = getMapForReceivedMessage(mediaMessage);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    hideSummaryPanel(idMap);
  }

  @override
<<<<<<< HEAD
  void onFormMessageReceived(FormMessage formMessage){
    Map<String , dynamic > idMap =  getMapForReceivedMessage(formMessage);
=======
  void onCustomMessageReceived(CustomMessage customMessage) {
    Map<String, dynamic> idMap = getMapForReceivedMessage(customMessage);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    hideSummaryPanel(idMap);
  }

  @override
<<<<<<< HEAD
  void onCardMessageReceived(CardMessage cardMessage){
    Map<String , dynamic > idMap =  getMapForReceivedMessage(cardMessage);
=======
  void onFormMessageReceived(FormMessage formMessage) {
    Map<String, dynamic> idMap = getMapForReceivedMessage(formMessage);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    hideSummaryPanel(idMap);
  }

  @override
<<<<<<< HEAD
  onSchedulerMessageReceived(SchedulerMessage schedulerMessage){
    Map<String , dynamic > idMap =  getMapForReceivedMessage(schedulerMessage);
    hideSummaryPanel(idMap);
  }




  AIConversationStarterDecorator(DataSource dataSource, {this.configuration})
      : super(dataSource) {
=======
  void onCardMessageReceived(CardMessage cardMessage) {
    Map<String, dynamic> idMap = getMapForReceivedMessage(cardMessage);
    hideSummaryPanel(idMap);
  }

  @override
  onSchedulerMessageReceived(SchedulerMessage schedulerMessage) {
    Map<String, dynamic> idMap = getMapForReceivedMessage(schedulerMessage);
    hideSummaryPanel(idMap);
  }

  AIConversationStarterDecorator(super.dataSource, {this.configuration}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    dateStamp = DateTime.now().microsecondsSinceEpoch.toString();
    _listenerId = "AiConversationStarter$dateStamp";
    CometChatUIEvents.removeUiListener(_listenerId);
    CometChatUIEvents.addUiListener(_listenerId, this);
    CometChatMessageEvents.removeMessagesListener(_listenerId);
    CometChatMessageEvents.addMessagesListener(_listenerId, this);
    getLoggedInUser();
  }

  getLoggedInUser() async {
    loggedInUser = await CometChat.getLoggedInUser();
  }

  closeCall() {
    CometChat.removeMessageListener(_listenerId);
    CometChatMessageEvents.removeMessagesListener(_listenerId);
  }

<<<<<<< HEAD

  hideSummaryPanel(Map<String, dynamic>? id){
=======
  hideSummaryPanel(Map<String, dynamic>? id) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    CometChatUIEvents.hidePanel(id, CustomUIPosition.composerTop);
  }

  @override
<<<<<<< HEAD
  void ccActiveChatChanged(Map<String, dynamic>? id, BaseMessage? lastMessage, User? user, Group? group, int unreadMessageCount) {
    CometChatTheme theme = configuration?.theme ?? cometChatTheme;
    if (lastMessage == null && id?["parentMessageId"] == null) {


=======
  void ccActiveChatChanged(Map<String, dynamic>? id, BaseMessage? lastMessage,
      User? user, Group? group, int unreadMessageCount) {
    CometChatTheme theme = configuration?.theme ?? cometChatTheme;
    if (lastMessage == null && id?["parentMessageId"] == null) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      onRepliesListBottom(user, group, theme);
      return;
    }
  }

<<<<<<< HEAD

  onRepliesListBottom(User? user, Group? group , CometChatTheme? theme)  async {


    Map<String, dynamic>?  apiMap;

    if(configuration!=null && configuration?.apiConfiguration!=null){
      apiMap =  await configuration?.apiConfiguration!(user, group);
=======
  onRepliesListBottom(User? user, Group? group, CometChatTheme? theme) async {
    Map<String, dynamic>? apiMap;

    if (configuration != null && configuration?.apiConfiguration != null) {
      apiMap = await configuration?.apiConfiguration!(user, group);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }

    Map<String, dynamic> id = {};
    String receiverId = "";
    if (user != null) {
      receiverId = user.uid;
      id['uid'] = receiverId;
    } else if (group != null) {
      receiverId = group.guid;
      id['guid'] = receiverId;
    }

<<<<<<< HEAD


=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    CometChatUIEvents.showPanel(
      id,
      CustomUIPosition.composerTop,
      (context) => AIConversationStarterView(
        aiConversationStarterStyle: configuration?.conversationStarterStyle,
<<<<<<< HEAD
        theme: configuration?.theme ??theme?? cometChatTheme,
=======
        theme: configuration?.theme ?? theme ?? cometChatTheme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        user: user,
        group: group,
        emptyStateText: configuration?.emptyStateText,
        errorStateText: configuration?.errorStateText,
        customView: configuration?.customView,
        loadingStateText: configuration?.loadingStateText,
        emptyIconUrl: configuration?.emptyIconUrl,
        loadingStateView: configuration?.loadingStateView,
        loadingIconUrl: configuration?.loadingIconUrl,
        errorStateView: configuration?.errorStateView,
        emptyStateView: configuration?.errorStateView,
        errorIconUrl: configuration?.errorIconUrl,
        apiConfiguration: apiMap,
      ),
    );
  }

<<<<<<< HEAD

=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  @override
  String getId() {
    return "conversationStarter";
  }
}
