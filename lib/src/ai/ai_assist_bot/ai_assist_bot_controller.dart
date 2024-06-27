import 'package:flutter/material.dart';

import '../../../cometchat_chat_uikit.dart';

///[AIAssistBotController] is the view model for [AIAssistBotView]
class AIAssistBotController
    extends CometChatListController<AIAssistBotMessage, int> {
  //--------------------Constructor-----------------------
  AIAssistBotController(
<<<<<<< HEAD
      {OnError? onError , this.user, this.group , required this.aiBot ,  this.apiConfiguration})
      : super( null, onError: onError);

=======
      {OnError? onError,
      this.user,
      this.group,
      required this.aiBot,
      this.apiConfiguration})
      : super(null, onError: onError);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  static int messageId = 1;

  late BuildContext context;
  User? user;
  Group? group;
  User aiBot;
<<<<<<< HEAD
  Map<String , dynamic>? apiConfiguration;

=======
  Map<String, dynamic>? apiConfiguration;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[textEditingController] controls the state of the text field
  late TextEditingController textEditingController;

  ///[_previousText] holds the state of the last typed text
  String _previousText = "";

<<<<<<< HEAD

  int getUniqueMessageId(){
=======
  int getUniqueMessageId() {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    messageId++;
    return messageId;
  }

<<<<<<< HEAD

=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  //-------------------------Variable Declaration-----------------------------
  late UsersBuilderProtocol usersBuilderProtocol;

  //-------------------------LifeCycle Methods-----------------------------
  @override
  void onInit() {
<<<<<<< HEAD

   const String constText  = "How can I help you with this conversation? Please ask me a question, and I will give advice to you 😄.";

    super.onInit();
    AIAssistBotMessage  message= AIAssistBotMessage(
      id:  messageId,
      message: constText,
      sentStatus: AIMessageStatus.sent,
      isSentByMe: false,
      sentAt: DateTime.now()
    );
=======
    const String constText =
        "How can I help you with this conversation? Please ask me a question, and I will give advice to you 😄.";

    super.onInit();
    AIAssistBotMessage message = AIAssistBotMessage(
        id: messageId,
        message: constText,
        sentStatus: AIMessageStatus.sent,
        isSentByMe: false,
        sentAt: DateTime.now());
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    messageId++;
    list.add(message);
    update();
    textEditingController = TextEditingController(text: null);
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
<<<<<<< HEAD

  }



=======
  }

>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  @override
  loadMoreElements({bool Function(AIAssistBotMessage element)? isIncluded}) {
    //no function should be performed
  }

  //-------------------------Parent List overriding Methods-----------------------------
  @override
  bool match(AIAssistBotMessage elementA, AIAssistBotMessage elementB) {
    return elementA.id == elementB.id;
  }

  @override
  int getKey(AIAssistBotMessage element) {
    return element.id;
  }

<<<<<<< HEAD
  onChanged(val){
    _onTyping();
  }


=======
  onChanged(val) {
    _onTyping();
  }

>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  _onTyping() {
    if ((_previousText.isEmpty && textEditingController.text.isNotEmpty) ||
        (_previousText.isNotEmpty && textEditingController.text.isEmpty)) {
      update();
    }
    if (_previousText.length > textEditingController.text.length) {
      _previousText = textEditingController.text;
      return;
    }
  }

  sendTextMessage() {
<<<<<<< HEAD
      String  controllerText = textEditingController.text;
      AIAssistBotMessage botMessage  =
      AIAssistBotMessage(
          message: textEditingController.text,
          sentStatus: AIMessageStatus.inProgress,
          id: getUniqueMessageId(),
          isSentByMe: true,sentAt: DateTime.now()
      );

      textEditingController.clear();
      update();

      addElement(botMessage);


      CometChat.askBot( user!=null?user!.uid: group!.guid ,
          user!=null?ReceiverTypeConstants.user: ReceiverTypeConstants.group,
          aiBot.uid, controllerText,
          configuration: apiConfiguration,
          onSuccess: (String val){
            botMessage.sentStatus = AIMessageStatus.sent;
            updateElement(botMessage);
            AIAssistBotMessage retMessage  = AIAssistBotMessage(
                message: val,
                sentStatus: AIMessageStatus.sent,
                id: getUniqueMessageId(),
                isSentByMe: false,
              sentAt: DateTime.now()
            );
            addElement(retMessage);

          }, onError: (_){
            botMessage.sentStatus = AIMessageStatus.error;
            updateElement(botMessage);
          });

  }


=======
    String controllerText = textEditingController.text;
    AIAssistBotMessage botMessage = AIAssistBotMessage(
        message: textEditingController.text,
        sentStatus: AIMessageStatus.inProgress,
        id: getUniqueMessageId(),
        isSentByMe: true,
        sentAt: DateTime.now());

    textEditingController.clear();
    update();

    addElement(botMessage);

    CometChat.askBot(
        user != null ? user!.uid : group!.guid,
        user != null ? ReceiverTypeConstants.user : ReceiverTypeConstants.group,
        aiBot.uid,
        controllerText,
        configuration: apiConfiguration, onSuccess: (String val) {
      botMessage.sentStatus = AIMessageStatus.sent;
      updateElement(botMessage);
      AIAssistBotMessage retMessage = AIAssistBotMessage(
          message: val,
          sentStatus: AIMessageStatus.sent,
          id: getUniqueMessageId(),
          isSentByMe: false,
          sentAt: DateTime.now());
      addElement(retMessage);
    }, onError: (_) {
      botMessage.sentStatus = AIMessageStatus.error;
      updateElement(botMessage);
    });
  }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}
