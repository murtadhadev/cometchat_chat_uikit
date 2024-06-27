import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cometchat_chat_uikit/src/message_list/messages_builder_protocol.dart';
import 'package:get/get.dart';

import '../../cometchat_chat_uikit.dart';
import '../../cometchat_chat_uikit.dart' as cc;

///[CometChatMessageListController] is the view model for [CometChatMessageList]
///it contains all the business logic involved in changing the state of the UI of [CometChatMessageList]
<<<<<<< HEAD
class CometChatMessageListController extends CometChatSearchListController<BaseMessage, int>
=======
class CometChatMessageListController
    extends CometChatSearchListController<BaseMessage, int>
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    with
        GroupListener,
        CometChatGroupEventListener,
        CometChatMessageEventListener,
        CometChatUIEventListener,
        CometChatCallEventListener,
        CallListener,
        ConnectionListener
    implements CometChatMessageListControllerProtocol {
  //--------------------Constructor-----------------------
  CometChatMessageListController(
      {required this.messagesBuilderProtocol,
      this.user,
      this.group,
      this.customIncomingMessageSound,
      this.customIncomingMessageSoundPackage,
      this.disableSoundForMessages = false,
      this.hideDeletedMessage = false,
      this.scrollToBottomOnNewMessage = false,
      ScrollController? scrollController,
      this.stateCallBack,
<<<<<<< HEAD
      OnError? onError,
=======
      super.onError,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      this.onThreadRepliesClick,
      this.messageTypes,
      this.disableReceipt,
      this.theme,
<<<<<<< HEAD
      // this.snackBarConfiguration,
      this.messageInformationConfiguration,
      this.emojiKeyboardStyle,
      this.disableReactions})
=======
      this.messageInformationConfiguration,
      this.emojiKeyboardStyle,
      this.disableReactions,
      this.textFormatters,
      this.disableMentions})
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      : super(
            builderProtocol: user != null
                ? (messagesBuilderProtocol
                  ..requestBuilder.uid = user.uid
                  ..requestBuilder.guid = '')
                : (messagesBuilderProtocol
                  ..requestBuilder.guid = group!.guid
<<<<<<< HEAD
                  ..requestBuilder.uid = ''),
            onError: onError) {
=======
                  ..requestBuilder.uid = '')) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    dateStamp = DateTime.now().microsecondsSinceEpoch.toString();
    _messageListenerId = "${dateStamp}user_listener";
    _groupListenerId = "${dateStamp}group_listener";
    _uiGroupListener = "${dateStamp}UIGroupListener";
    _uiMessageListener = "${dateStamp}UI_message_listener";
    _uiEventListener = "${dateStamp}UI_Event_listener";
    _uiCallListener = "${dateStamp}UI_Call_listener";
    _sdkCallListenerId = "${dateStamp}sdk_Call_listener";

    createTemplateMap();

    if (user != null) {
      conversationWithId = user!.uid;
      conversationType = ReceiverTypeConstants.user;
    } else {
      conversationWithId = group!.guid;
      conversationType = ReceiverTypeConstants.group;
    }

    if (scrollController != null) {
      messageListScrollController = scrollController;
    } else {
      messageListScrollController = ScrollController();
    }
    messageListScrollController.addListener(_scrollControllerListener);
    tag = "tag$counter";
    counter++;

<<<<<<< HEAD
    threadMessageParentId = messagesBuilderProtocol.getRequest().parentMessageId ?? 0;
=======
    threadMessageParentId =
        messagesBuilderProtocol.getRequest().parentMessageId ?? 0;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    isThread = threadMessageParentId > 0;

    messageListId = {};

    if (user != null) {
      messageListId['uid'] = user?.uid;
    }
    if (group != null) {
      messageListId['guid'] = group?.guid;
    }

    if (threadMessageParentId > 0) {
      messageListId['parentMessageId'] = threadMessageParentId;
    }
<<<<<<< HEAD
=======

    initializeTextFormatters();
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

  //-------------------------Variable Declaration-----------------------------
  late MessagesBuilderProtocol messagesBuilderProtocol;
  late String dateStamp;
  late String _messageListenerId;
  late String _groupListenerId;

  User? loggedInUser;
  User? user;
  Group? group;
  Map<String, CometChatMessageTemplate> templateMap = {};
  List<CometChatMessageTemplate>? messageTypes;
  String conversationWithId = "";
  String conversationType = "";
  String? conversationId;
  Conversation? conversation;
  String? customIncomingMessageSound;
  String? customIncomingMessageSoundPackage;
  late bool disableSoundForMessages;
  int threadMessageParentId = 0;
  late bool hideDeletedMessage;
  late bool scrollToBottomOnNewMessage;
  late ScrollController messageListScrollController;
  int newUnreadMessageCount = 0;
  Function(CometChatMessageListController controller)? stateCallBack;
  static int counter = 0;
  late String tag;
  bool isThread = false;
  late String _uiGroupListener;
  late String _uiMessageListener;
  late BuildContext context;
<<<<<<< HEAD
  final Function(BaseMessage message, BuildContext context, {Widget bubbleView})? onThreadRepliesClick;

  late Map<String, dynamic> messageListId;

  // final SnackBarConfiguration? snackBarConfiguration;

=======
  final Function(BaseMessage message, BuildContext context,
      {Widget bubbleView})? onThreadRepliesClick;

  late Map<String, dynamic> messageListId;

>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  MessageInformationConfiguration? messageInformationConfiguration;

  bool inInitialized = false;
  CometChatTheme? theme;

  ///[emojiKeyboardStyle] is a parameter used to set the style for the emoji keyboard
  final EmojiKeyboardStyle? emojiKeyboardStyle;

  ///[disableReceipt] controls visibility of read receipts
  ///and also disables logic executed inside onMessagesRead and onMessagesDelivered listeners
  final bool? disableReceipt;

  late String _uiEventListener;
  late String _uiCallListener;
  late String _sdkCallListenerId;

  ///[headerView] shown in header view
<<<<<<< HEAD
  Widget? Function(BuildContext, {User? user, Group? group, int? parentMessageId})? headerView;

  ///[footerView] shown in footer view
  Widget? Function(BuildContext, {User? user, Group? group, int? parentMessageId})? footerView;
=======
  Widget? Function(BuildContext,
      {User? user, Group? group, int? parentMessageId})? headerView;

  ///[footerView] shown in footer view
  Widget? Function(BuildContext,
      {User? user, Group? group, int? parentMessageId})? footerView;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  final bool? disableReactions;

  Widget? header;
  Widget? footer;

  int? initialUnreadCount;

<<<<<<< HEAD
=======
  List<CometChatTextFormatter>? textFormatters;
  bool? disableMentions;

>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  void _scrollControllerListener() {
    double offset = messageListScrollController.offset;
    if (offset.clamp(0, 10) == offset && newUnreadMessageCount != 0) {
      markAsRead(list[0]);
      newUnreadMessageCount = 0;
      update();
    }
  }

  createTemplateMap() {
<<<<<<< HEAD
    List<CometChatMessageTemplate> localTypes = CometChatUIKit.getDataSource().getAllMessageTemplates(theme: theme);
=======
    List<CometChatMessageTemplate> localTypes =
        CometChatUIKit.getDataSource().getAllMessageTemplates(theme: theme);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    messageTypes?.forEach((element) {
      templateMap["${element.category}_${element.type}"] = element;
    });

    for (var element in localTypes) {
      String key = "${element.category}_${element.type}";

      CometChatMessageTemplate? localTemplate = templateMap[key];

      if (localTemplate == null) {
        templateMap[key] = element;
      } else {
        if (localTemplate.footerView == null) {
          templateMap[key]?.footerView = element.footerView;
        }

        if (localTemplate.headerView == null) {
          templateMap[key]?.headerView = element.headerView;
        }

        if (localTemplate.bottomView == null) {
          templateMap[key]?.bottomView = element.bottomView;
        }

        if (localTemplate.bubbleView == null) {
          templateMap[key]?.bubbleView = element.bubbleView;
        }

        if (localTemplate.contentView == null) {
          templateMap[key]?.contentView = element.contentView;
        }

        if (localTemplate.options == null) {
          templateMap[key]?.options = element.options;
        }
      }
    }
  }

  //-------------------------LifeCycle Methods-----------------------------
  @override
  void onInit() {
    CometChat.addGroupListener(_groupListenerId, this);
    CometChatGroupEvents.addGroupsListener(_uiGroupListener, this);
    CometChatMessageEvents.addMessagesListener(_uiMessageListener, this);
    CometChatUIEvents.addUiListener(_uiEventListener, this);
    CometChatCallEvents.addCallEventsListener(_uiCallListener, this);
    CometChat.addCallListener(_sdkCallListenerId, this);
    CometChat.addConnectionListener(_messageListenerId, this);
    initializeHeaderAndFooterView();
    super.onInit();
  }

  @override
  void onClose() {
    //  CometChat.removeMessageListener(_messageListenerId);
    CometChat.removeGroupListener(_groupListenerId);
    CometChatGroupEvents.removeGroupsListener(_uiGroupListener);
    CometChatMessageEvents.removeMessagesListener(_uiMessageListener);
    CometChatUIEvents.removeUiListener(_uiEventListener);
    CometChatCallEvents.removeCallEventsListener(_uiCallListener);
    CometChat.removeCallListener(_sdkCallListenerId);
    CometChat.removeConnectionListener(_messageListenerId);
<<<<<<< HEAD
    // removing listeners
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    super.onClose();
  }

  //-------------------------Parent List overriding Methods-----------------------------
  @override
  bool match(BaseMessage elementA, BaseMessage elementB) {
    return elementA.id == elementB.id;
  }

  @override
  int getKey(BaseMessage element) {
    return element.id;
  }

  Future<void> getUnreadCount() async {
    if (initialUnreadCount == null) {
<<<<<<< HEAD
      Map<String, Map<String, int>>? resultMap = await CometChat.getUnreadMessageCount();
=======
      Map<String, Map<String, int>>? resultMap =
          await CometChat.getUnreadMessageCount();
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

      if (resultMap != null) {
        Map<String, int> countMap = {};

        if (user != null) {
          countMap = resultMap["user"] ?? {};
        } else if (group != null) {
          countMap = resultMap["group"] ?? {};
        }
        if (countMap[user?.uid ?? group?.guid] != null) {
<<<<<<< HEAD
          initialUnreadCount = (countMap[user?.uid ?? group?.guid] as int) ?? 0;
=======
          initialUnreadCount = (countMap[user?.uid ?? group?.guid] as int);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        } else {
          initialUnreadCount = 0;
        }
      }
    }
  }

  @override
  loadMoreElements({bool Function(BaseMessage element)? isIncluded}) async {
<<<<<<< HEAD
    // "Fetching again"
=======
    /// "Fetching again"
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    isLoading = true;
    BaseMessage? lastMessage;
    loggedInUser ??= await CometChat.getLoggedInUser();
    await getUnreadCount();
<<<<<<< HEAD
    conversation ??= (await CometChat.getConversation(conversationWithId, conversationType, onSuccess: (conversation) {
      if (conversation.lastMessage != null) {
        // "Marking as read"
=======
    conversation ??= (await CometChat.getConversation(
        conversationWithId, conversationType, onSuccess: (conversation) {
      if (conversation.lastMessage != null) {
        /// "Marking as read"
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        if (kDebugMode) {
          debugPrint("Marking as read from here");
        }
        markAsRead(conversation.lastMessage!);
      }
    }, onError: (_) {}));
    conversationId ??= conversation?.conversationId;

    try {
      await request.fetchPrevious(onSuccess: (List<BaseMessage> fetchedList) {
        if (fetchedList.isEmpty) {
          isLoading = false;
          hasMoreItems = false;
        } else {
          isLoading = false;
          hasMoreItems = true;
          for (var element in fetchedList.reversed) {
            if (element is InteractiveMessage) {
<<<<<<< HEAD
              element = InteractiveMessageUtils.getSpecificMessageFromInteractiveMessage(element);
=======
              element = InteractiveMessageUtils
                  .getSpecificMessageFromInteractiveMessage(element);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            }
            if (isIncluded != null && isIncluded(element) == true) {
              list.add(element);
            } else {
              list.add(element);
            }
          }
<<<<<<< HEAD
          if (inInitialized == false) {
            lastMessage = fetchedList[0];
          }
          // update();
=======
          if (inInitialized == false && list.isNotEmpty) {
            lastMessage = list[0];
          }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        }
        update();
      }, onError: (CometChatException e) {
        if (onError != null) {
          onError!(e);
        } else {
          error = e;
          hasError = true;
        }

        update();
      });
    } catch (e, s) {
      error = CometChatException("ERR", s.toString(), "Error");
      hasError = true;
      isLoading = false;
      hasMoreItems = false;
      update();
    }

    if (inInitialized == false) {
      inInitialized = true;
<<<<<<< HEAD
      CometChatUIEvents.ccActiveChatChanged(messageListId, lastMessage, user, group, initialUnreadCount ?? 0);
=======
      CometChatUIEvents.ccActiveChatChanged(
          messageListId, lastMessage, user, group, initialUnreadCount ?? 0);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
  }

  //------------------------UI Message Event Listeners------------------------------

  @override
  void onTextMessageReceived(TextMessage textMessage) async {
    if (_messageCategoryTypeCheck(textMessage)) {
      _onMessageReceived(textMessage);
    }
  }

  @override
  void onMediaMessageReceived(MediaMessage mediaMessage) {
    if (_messageCategoryTypeCheck(mediaMessage)) {
      _onMessageReceived(mediaMessage);
    }
  }

  @override
  void onCustomMessageReceived(CustomMessage customMessage) {
    if (_messageCategoryTypeCheck(customMessage)) {
      _onMessageReceived(customMessage);
    }
  }

  @override
  void onSchedulerMessageReceived(SchedulerMessage schedulerMessage) {
    if (_messageCategoryTypeCheck(schedulerMessage)) {
      _onMessageReceived(schedulerMessage);
    }
  }

  @override
  void onMessagesDelivered(MessageReceipt messageReceipt) {
    if (disableReceipt != true) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].sender?.uid == loggedInUser?.uid) {
          if (i == 0 || list[i].deliveredAt == null) {
            list[i].deliveredAt = messageReceipt.deliveredAt;
          } else {
            break;
          }
        }
      }
      update();
    }
  }

  @override
  void onMessagesRead(MessageReceipt messageReceipt) {
    if (disableReceipt != true) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].sender?.uid == loggedInUser?.uid) {
          if (i == 0 || list[i].readAt == null) {
            list[i].readAt = messageReceipt.readAt;
            list[i].deliveredAt ??= messageReceipt.readAt;
          } else {
            break;
          }
        }
      }
      update();
    }
  }

  @override
  void onMessageEdited(BaseMessage message) {
<<<<<<< HEAD
    if (conversationId == message.conversationId || _checkIfSameConversationForReceivedMessage(message)) {
=======
    if (conversationId == message.conversationId ||
        _checkIfSameConversationForReceivedMessage(message)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      updateElement(message);
    }
  }

  @override
  void onMessageDeleted(BaseMessage message) {
<<<<<<< HEAD
    if (conversationId == message.conversationId || _checkIfSameConversationForReceivedMessage(message)) {
=======
    if (conversationId == message.conversationId ||
        _checkIfSameConversationForReceivedMessage(message)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      if (request.hideDeleted == true) {
        removeElement(message);
      } else {
        updateElement(message);
      }
    }
  }

  @override
  void onFormMessageReceived(FormMessage formMessage) {
    if (_messageCategoryTypeCheck(formMessage)) {
      _onMessageReceived(formMessage);
    }
  }

  @override
  void onCardMessageReceived(CardMessage cardMessage) {
    if (_messageCategoryTypeCheck(cardMessage)) {
      _onMessageReceived(cardMessage);
    }
  }

  @override
<<<<<<< HEAD
  void onCustomInteractiveMessageReceived(CustomInteractiveMessage cardMessage) {
    if (_messageCategoryTypeCheck(cardMessage)) {
      _onMessageReceived(cardMessage);
=======
  void onCustomInteractiveMessageReceived(
      CustomInteractiveMessage customInteractiveMessage) {
    if (_messageCategoryTypeCheck(customInteractiveMessage)) {
      _onMessageReceived(customInteractiveMessage);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
  }

  @override
  void onInteractionGoalCompleted(InteractionReceipt receipt) {
    debugPrint("interaction completed $receipt");
    if (receipt.sender.uid == loggedInUser?.uid) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].id == receipt.messageId) {
          try {
            (list[i] as InteractiveMessage).interactions = receipt.interactions;
          } on Exception {
            debugPrint("error in converting interactin receipt");
          }
        }
      }
      update();
    }
  }

  //------------------------SDK Group Event Listeners------------------------------
  @override
<<<<<<< HEAD
  void onMemberAddedToGroup(cc.Action action, User addedby, User userAdded, Group addedTo) {
=======
  void onMemberAddedToGroup(
      cc.Action action, User addedby, User userAdded, Group addedTo) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_messageCategoryTypeCheck(action)) {
      if (group?.guid == addedTo.guid) {
        _onMessageReceived(action);
      }
    }
  }

  @override
<<<<<<< HEAD
  void onGroupMemberJoined(cc.Action action, User joinedUser, Group joinedGroup) {
=======
  void onGroupMemberJoined(
      cc.Action action, User joinedUser, Group joinedGroup) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_messageCategoryTypeCheck(action)) {
      if (group?.guid == joinedGroup.guid) {
        _onMessageReceived(action);
      }
    }
  }

  @override
  void onGroupMemberLeft(cc.Action action, User leftUser, Group leftGroup) {
    if (_messageCategoryTypeCheck(action)) {
      if (group?.guid == leftGroup.guid) {
        _onMessageReceived(action, markRead: false, playSound: false);
      }
    }
  }

  @override
<<<<<<< HEAD
  void onGroupMemberKicked(cc.Action action, User kickedUser, User kickedBy, Group kickedFrom) {
=======
  void onGroupMemberKicked(
      cc.Action action, User kickedUser, User kickedBy, Group kickedFrom) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_messageCategoryTypeCheck(action)) {
      if (group?.guid == kickedFrom.guid) {
        _onMessageReceived(action, markRead: false, playSound: false);
      }
    }
  }

  @override
<<<<<<< HEAD
  void onGroupMemberBanned(cc.Action action, User bannedUser, User bannedBy, Group bannedFrom) {
=======
  void onGroupMemberBanned(
      cc.Action action, User bannedUser, User bannedBy, Group bannedFrom) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_messageCategoryTypeCheck(action)) {
      if (group?.guid == bannedFrom.guid) {
        _onMessageReceived(action, markRead: false, playSound: false);
      }
    }
  }

  @override
<<<<<<< HEAD
  void ccGroupMemberBanned(cc.Action message, User bannedUser, User bannedBy, Group bannedFrom) {
=======
  void ccGroupMemberBanned(
      cc.Action message, User bannedUser, User bannedBy, Group bannedFrom) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_messageCategoryTypeCheck(message)) {
      if (group?.guid == bannedFrom.guid) {
        _onMessageFromLoggedInUser(message);
      }
    }
  }

  @override
<<<<<<< HEAD
  void ccGroupMemberKicked(cc.Action message, User kickedUser, User kickedBy, Group kickedFrom) {
=======
  void ccGroupMemberKicked(
      cc.Action message, User kickedUser, User kickedBy, Group kickedFrom) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_messageCategoryTypeCheck(message)) {
      if (group?.guid == kickedFrom.guid) {
        _onMessageFromLoggedInUser(message);
      }
    }
  }

  @override
<<<<<<< HEAD
  void ccGroupMemberAdded(List<cc.Action> messages, List<User> usersAdded, Group groupAddedIn, User addedBy) {
=======
  void ccGroupMemberAdded(List<cc.Action> messages, List<User> usersAdded,
      Group groupAddedIn, User addedBy) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (group?.guid == groupAddedIn.guid) {
      for (var message in messages) {
        if (_messageCategoryTypeCheck(message)) {
          _onMessageFromLoggedInUser(message);
        }
      }
    }
  }

  @override
<<<<<<< HEAD
  void ccGroupMemberUnbanned(cc.Action message, User unbannedUser, User unbannedBy, Group unbannedFrom) {
=======
  void ccGroupMemberUnbanned(cc.Action message, User unbannedUser,
      User unbannedBy, Group unbannedFrom) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_messageCategoryTypeCheck(message)) {
      if (group?.guid == unbannedFrom.guid) {
        _onMessageFromLoggedInUser(message);
      }
    }
  }

  @override
<<<<<<< HEAD
  void onGroupMemberUnbanned(cc.Action action, User unbannedUser, User unbannedBy, Group unbannedFrom) {
=======
  void onGroupMemberUnbanned(cc.Action action, User unbannedUser,
      User unbannedBy, Group unbannedFrom) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_messageCategoryTypeCheck(action)) {
      if (group?.guid == unbannedFrom.guid) {
        _onMessageReceived(action);
      }
    }
  }

  @override
  void onGroupMemberScopeChanged(
<<<<<<< HEAD
      cc.Action action, User updatedBy, User updatedUser, String scopeChangedTo, String scopeChangedFrom, Group group) {
=======
      cc.Action action,
      User updatedBy,
      User updatedUser,
      String scopeChangedTo,
      String scopeChangedFrom,
      Group group) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_messageCategoryTypeCheck(action)) {
      if (group.guid == this.group?.guid) {
        if (loggedInUser?.uid == updatedUser.uid) {
          //TODO: use scopeChangedTo instead of scopeChangedFrom when the bug in SDK is fixed
          this.group?.scope = scopeChangedFrom;
<<<<<<< HEAD
          debugPrint('scope of ${updatedUser.name} changed to $scopeChangedFrom from $scopeChangedTo');
=======
          debugPrint(
              'scope of ${updatedUser.name} changed to $scopeChangedFrom from $scopeChangedTo');
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        }
        _onMessageReceived(action);
      }
    }
  }

  //------------------------UI Message Event Listeners------------------------------

  @override
  ccMessageSent(BaseMessage message, MessageStatus messageStatus) {
    //checking if same conversation
    if (_checkIfSameConversationForSenderMessage(message)) {
      //checking if same thread
      if (message.parentMessageId == threadMessageParentId) {
        //adding the message to list for optimistic ui
        if (messageStatus == MessageStatus.inProgress) {
          addMessage(message);
<<<<<<< HEAD
        } else if (messageStatus == MessageStatus.sent || messageStatus == MessageStatus.error) {
=======
        } else if (messageStatus == MessageStatus.sent ||
            messageStatus == MessageStatus.error) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          //updating the status of the message that was previously added to list
          //while in progress
          updateMessageWithMuid(message);
        } else {}
      } else {
        //check if same conversation but different thread
        if (messageStatus == MessageStatus.sent) {
          updateMessageThreadCount(message.parentMessageId);
        }
      }
    }
  }

  @override
  void ccMessageEdited(BaseMessage message, MessageEditStatus status) {
<<<<<<< HEAD
    if ((_checkIfSameConversationForReceivedMessage(message) || _checkIfSameConversationForSenderMessage(message)) &&
=======
    if ((_checkIfSameConversationForReceivedMessage(message) ||
            _checkIfSameConversationForSenderMessage(message)) &&
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        status == MessageEditStatus.success) {
      updateElement(message);
    }
  }

  @override
<<<<<<< HEAD
  void ccMessageReplied(BaseMessage message, MessageStatus status) {
    updateElement(message);
  }

  @override
  void ccMessageDeleted(BaseMessage message, EventStatus messageStatus) {
    if (_checkIfSameConversationForSenderMessage(message) && messageStatus == EventStatus.success) {
=======
  void ccMessageDeleted(BaseMessage message, EventStatus messageStatus) {
    if (_checkIfSameConversationForSenderMessage(message) &&
        messageStatus == EventStatus.success) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      if (request.hideDeleted == true) {
        removeElement(message);
      } else {
        updateElement(message);
      }
    }
  }

  //---------------Public Methods----------------------
  @override
  addMessage(BaseMessage message) {
    if (list.isNotEmpty) {
      markAsRead(list[0]);
    }
    if (messageListScrollController.hasClients) {
      messageListScrollController.jumpTo(0.0);
    }
    addElement(message);
  }

  @override
  updateMessageWithMuid(BaseMessage message) {
<<<<<<< HEAD
    int matchingIndex = list.indexWhere((element) => (element.muid == message.muid));
=======
    int matchingIndex =
        list.indexWhere((element) => (element.muid == message.muid));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (matchingIndex != -1) {
      list[matchingIndex] = message;
      update();
    }
  }

  @override
  deleteMessage(BaseMessage message) async {
    await CometChat.deleteMessage(message.id, onSuccess: (updatedMessage) {
      updatedMessage.deletedAt ??= DateTime.now();
<<<<<<< HEAD
      // CometChatMessageEvents.ccMessageDeleted(
      //     updatedMessage, EventStatus.success);
      message.deletedAt = DateTime.now();
      message.deletedBy = loggedInUser?.uid;
      CometChatMessageEvents.ccMessageDeleted(updatedMessage, EventStatus.success);
=======
      message.deletedAt = DateTime.now();
      message.deletedBy = loggedInUser?.uid;
      CometChatMessageEvents.ccMessageDeleted(
          updatedMessage, EventStatus.success);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }, onError: (_) {});
  }

  @override
  updateMessageThreadCount(int parentMessageId) {
    int matchingIndex = list.indexWhere((item) => item.id == parentMessageId);
    if (matchingIndex != -1) {
      list[matchingIndex].replyCount++;
      update();
    }
  }

  _playSound() {
    if (!disableSoundForMessages) {
<<<<<<< HEAD
      /*  CometChatUIKit.soundManager.play(
          sound: Sound.incomingMessage,
          customSound: customIncomingMessageSound,
          packageName: customIncomingMessageSound == null || customIncomingMessageSound == ""
              ? UIConstants.packageName
              : customIncomingMessageSoundPackage); */
=======
      CometChatUIKit.soundManager.play(
          sound: Sound.incomingMessage,
          customSound: customIncomingMessageSound,
          packageName: customIncomingMessageSound == null ||
                  customIncomingMessageSound == ""
              ? UIConstants.packageName
              : customIncomingMessageSoundPackage);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
  }

  markAsRead(BaseMessage message) {
<<<<<<< HEAD
    if (disableReceipt != true && message.sender?.uid != loggedInUser?.uid && message.readAt == null) {
=======
    if (disableReceipt != true &&
        message.sender?.uid != loggedInUser?.uid &&
        message.readAt == null) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      CometChat.markAsRead(message, onSuccess: (String res) {
        CometChatMessageEvents.ccMessageRead(message);
      }, onError: (e) {});
    }
  }

<<<<<<< HEAD
  _onMessageReceived(BaseMessage message, {bool playSound = true, bool markRead = true}) {
=======
  _onMessageReceived(BaseMessage message,
      {bool playSound = true, bool markRead = true}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if ((message.conversationId == conversationId ||
            _checkIfSameConversationForReceivedMessage(message) ||
            _checkIfSameConversationForSenderMessage(message)) &&
        message.parentMessageId == threadMessageParentId) {
      addElement(message);
      if (playSound) {
        _playSound();
      }

      if (scrollToBottomOnNewMessage) {
        markAsRead(message);
        if (messageListScrollController.hasClients) {
          messageListScrollController.jumpTo(0.0);
        }
      } else {
<<<<<<< HEAD
        if (messageListScrollController.hasClients && messageListScrollController.offset > 100) {
=======
        if (messageListScrollController.hasClients &&
            messageListScrollController.offset > 100) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          newUnreadMessageCount++;
        } else {
          markAsRead(message);
        }
      }
<<<<<<< HEAD
    } else if (message.conversationId == conversationId || _checkIfSameConversationForReceivedMessage(message)) {
=======
    } else if (message.conversationId == conversationId ||
        _checkIfSameConversationForReceivedMessage(message)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      //incrementing reply count
      if (playSound) {
        _playSound();
      }
<<<<<<< HEAD
      int matchingIndex = list.indexWhere((element) => (element.id == message.parentMessageId));
=======
      int matchingIndex =
          list.indexWhere((element) => (element.id == message.parentMessageId));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      if (matchingIndex != -1) {
        list[matchingIndex].replyCount++;
      }
      update();
    }
  }

<<<<<<< HEAD
  _onMessageFromLoggedInUser(BaseMessage message, {bool playSound = true, bool markRead = true}) {
    if ((message.conversationId == conversationId || _checkIfSameConversationForSenderMessage(message)) &&
=======
  _onMessageFromLoggedInUser(BaseMessage message,
      {bool playSound = true, bool markRead = true}) {
    if ((message.conversationId == conversationId ||
            _checkIfSameConversationForSenderMessage(message)) &&
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        message.parentMessageId == threadMessageParentId) {
      addElement(message);
      debugPrint("playSound  = $playSound");
      if (playSound) {
        _playSound();
      }

      if (scrollToBottomOnNewMessage) {
        if (markRead) {
          markAsRead(message);
        }

        if (messageListScrollController.hasClients) {
          messageListScrollController.jumpTo(0.0);
        }
      } else if (markRead) {
<<<<<<< HEAD
        if (messageListScrollController.hasClients && messageListScrollController.offset > 100) {
=======
        if (messageListScrollController.hasClients &&
            messageListScrollController.offset > 100) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          newUnreadMessageCount++;
        } else {
          markAsRead(message);
        }
      }
<<<<<<< HEAD
    } else if (message.conversationId == conversationId || _checkIfSameConversationForSenderMessage(message)) {
=======
    } else if (message.conversationId == conversationId ||
        _checkIfSameConversationForSenderMessage(message)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      //incrementing reply count
      if (playSound) {
        _playSound();
      }

<<<<<<< HEAD
      int matchingIndex = list.indexWhere((element) => (element.id == message.parentMessageId));
=======
      int matchingIndex =
          list.indexWhere((element) => (element.id == message.parentMessageId));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      if (matchingIndex != -1) {
        list[matchingIndex].replyCount++;
      }
      update();
    }
  }

  //-----message option methods-----

<<<<<<< HEAD
  _messageEdit(BaseMessage message, CometChatMessageListControllerProtocol state) {
    if (message.deletedAt == null) {
      CometChatMessageEvents.ccMessageEdited(message, MessageEditStatus.inProgress);
    }
  }

  _replyMessage(BaseMessage message, CometChatMessageListControllerProtocol state) {
    if (message.deletedAt == null) {
      CometChatMessageEvents.ccMessageReplied(message, MessageStatus.sent);
=======
  _messageEdit(
      BaseMessage message, CometChatMessageListControllerProtocol state) {
    if (message.deletedAt == null) {
      CometChatMessageEvents.ccMessageEdited(
          message, MessageEditStatus.inProgress);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
  }

  _delete(BaseMessage message, CometChatMessageListControllerProtocol state) {
    if (message.deletedAt == null) {
      CometChatMessageEvents.ccMessageDeleted(message, EventStatus.inProgress);
      deleteMessage(message);
    }
  }

<<<<<<< HEAD
  // _replyMessage(BaseMessage message, CometChatMessageListControllerProtocol state) {
  //   CometChatMessageEvents.onMessageReply(message);
  // }

  _shareMessage(BaseMessage message, CometChatMessageListControllerProtocol state) async {
    // List<String> types = CometChatUIKit.getDataSource().getAllMessageTypes();
    //share
    if (message is TextMessage) {
      await UIConstants.channel.invokeMethod(
        "shareMessage",
        {'message': message.text, "type": "text"},
=======
  _shareMessage(
      BaseMessage message, CometChatMessageListControllerProtocol state) async {
    //share
    if (message is TextMessage) {
      String text = message.text;
      //if message has mentions we need to send the text with mentions and not the original text
      if (message.mentionedUsers.isNotEmpty) {
        text = CometChatMentionsFormatter.getTextWithMentions(
            message.text, message.mentionedUsers);
      }
      await UIConstants.channel.invokeMethod(
        "shareMessage",
        {'message': text, "type": "text"},
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      );
    } else if (message is MediaMessage) {
      await UIConstants.channel.invokeMethod(
        "shareMessage",
        {
          "message": message.attachment?.fileName, // For ios
          'mediaName': message.attachment?.fileName,
          "type": "media",
          "subtype": message.type.toString(),
          "fileUrl": message.attachment?.fileUrl,
          "mimeType": message.attachment?.fileMimeType
        },
      );
    }
  }

<<<<<<< HEAD
  _copyMessage(BaseMessage message, CometChatMessageListControllerProtocol state) {
    if (message is TextMessage) {
      Clipboard.setData(ClipboardData(text: message.text));
    }
  }

  _messageInformation(BaseMessage message, CometChatMessageListControllerProtocol state) {
=======
  _copyMessage(
      BaseMessage message, CometChatMessageListControllerProtocol state) {
    if (message is TextMessage) {
      String text = message.text;
      if (message.mentionedUsers.isNotEmpty) {
        text = CometChatMentionsFormatter.getTextWithMentions(
            message.text, message.mentionedUsers);
      }
      Clipboard.setData(ClipboardData(text: text));
    }
  }

  _messageInformation(
      BaseMessage message, CometChatMessageListControllerProtocol state) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CometChatMessageInformation(
          message: message,
          bubbleView: messageInformationConfiguration?.bubbleView,
          template: templateMap["${message.category}_${message.type}"],
          title: messageInformationConfiguration?.title,
<<<<<<< HEAD
          receiptDatePattern: messageInformationConfiguration?.receiptDatePattern,
=======
          receiptDatePattern:
              messageInformationConfiguration?.receiptDatePattern,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          readIcon: messageInformationConfiguration?.readIcon,
          listItemView: messageInformationConfiguration?.listItemView,
          listItemStyle: messageInformationConfiguration?.listItemStyle,
          deliveredIcon: messageInformationConfiguration?.deliveredIcon,
          onError: messageInformationConfiguration?.onError,
          closeIcon: messageInformationConfiguration?.closeIcon,
          onClose: messageInformationConfiguration?.onClose,
          theme: messageInformationConfiguration?.theme ?? theme,
<<<<<<< HEAD
          messageInformationStyle: messageInformationConfiguration?.messageInformationStyle,
=======
          messageInformationStyle:
              messageInformationConfiguration?.messageInformationStyle,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          subTitleView: messageInformationConfiguration?.subTitleView,
          emptyStateText: messageInformationConfiguration?.emptyStateText,
          emptyStateView: messageInformationConfiguration?.emptyStateView,
          errorStateText: messageInformationConfiguration?.errorStateText,
          loadingIconUrl: messageInformationConfiguration?.loadingIconUrl,
          loadingStateView: messageInformationConfiguration?.loadingStateView,
          errorStateView: messageInformationConfiguration?.errorStateView,
        ),
      ),
    );
  }

<<<<<<< HEAD
  _sendMessagePrivately(BaseMessage message, CometChatMessageListControllerProtocol state) async {
=======
  _sendMessagePrivately(
      BaseMessage message, CometChatMessageListControllerProtocol state) async {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (message.receiver is Group) {
      User? user = await CometChat.getUser(
        message.sender!.uid,
        onSuccess: (user) {
          debugPrint("User fetched successfully $user");
        },
        onError: (excep) {
          debugPrint("Error fetching user ${excep.message}");
        },
      );
      if (context.mounted) {
        if (message.parentMessageId != 0) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pop();
        }
      }
      CometChatUIEvents.openChat(user, null);
    }
  }

  createMessage(BaseMessage copyFromMessage, User? user, Group? group) async {
    if (copyFromMessage is TextMessage) {
      TextMessage message = TextMessage(
        text: copyFromMessage.text,
        receiverUid: user?.uid ?? group?.guid ?? "",
        type: MessageTypeConstants.text,
        category: MessageCategoryConstants.message,
<<<<<<< HEAD
        receiverType: user != null ? ReceiverTypeConstants.user : ReceiverTypeConstants.group,
=======
        receiverType: user != null
            ? ReceiverTypeConstants.user
            : ReceiverTypeConstants.group,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        muid: DateTime.now().microsecondsSinceEpoch.toString(),
        sender: loggedInUser,
        parentMessageId: 0,
      );
<<<<<<< HEAD
      await CometChatUIKit.sendTextMessage(message, onSuccess: (BaseMessage returnedMessage) {},
          onError: (CometChatException excep) {
        // Get.showSnackbar(snackbar)
      });
=======
      await CometChatUIKit.sendTextMessage(message,
          onSuccess: (BaseMessage returnedMessage) {},
          onError: (CometChatException excep) {});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    } else if (copyFromMessage is MediaMessage) {
      if (copyFromMessage.attachment == null) return;

      String fileUrl = copyFromMessage.attachment!.fileUrl;
      String fileName = copyFromMessage.attachment!.fileName;
      String fileExtension = copyFromMessage.attachment!.fileExtension;
      String fileMimeType = copyFromMessage.attachment!.fileMimeType;

<<<<<<< HEAD
      Attachment attachment = Attachment(fileUrl, fileName, fileExtension, fileMimeType, null);
=======
      Attachment attachment =
          Attachment(fileUrl, fileName, fileExtension, fileMimeType, null);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

      MediaMessage message = MediaMessage(
          receiverUid: user?.uid ?? group?.guid ?? "",
          type: copyFromMessage.type,
          category: MessageCategoryConstants.message,
<<<<<<< HEAD
          receiverType: user != null ? ReceiverTypeConstants.user : ReceiverTypeConstants.group,
=======
          receiverType: user != null
              ? ReceiverTypeConstants.user
              : ReceiverTypeConstants.group,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          muid: DateTime.now().microsecondsSinceEpoch.toString(),
          sender: loggedInUser,
          parentMessageId: 0,
          attachment: attachment);

<<<<<<< HEAD
      await CometChatUIKit.sendMediaMessage(message, onSuccess: (BaseMessage returnedMessage) {},
          onError: (CometChatException excep) {
        // Get.showSnackbar(snackbar)
      });
=======
      await CometChatUIKit.sendMediaMessage(message,
          onSuccess: (BaseMessage returnedMessage) {},
          onError: (CometChatException excep) {});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    } else if (copyFromMessage is CustomMessage) {
      CustomMessage message = CustomMessage(
        customData: copyFromMessage.customData,
        receiverUid: user?.uid ?? group?.guid ?? "",
        type: copyFromMessage.type,
        category: MessageCategoryConstants.custom,
<<<<<<< HEAD
        receiverType: user != null ? ReceiverTypeConstants.user : ReceiverTypeConstants.group,
=======
        receiverType: user != null
            ? ReceiverTypeConstants.user
            : ReceiverTypeConstants.group,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        muid: DateTime.now().microsecondsSinceEpoch.toString(),
        sender: loggedInUser,
        parentMessageId: 0,
      );

<<<<<<< HEAD
      await CometChatUIKit.sendCustomMessage(message, onSuccess: (BaseMessage returnedMessage) {},
          onError: (CometChatException excep) {
        // Get.showSnackbar(snackbar)
      });
    }
  }

  Function(BaseMessage message, CometChatMessageListControllerProtocol state)? getActionFunction(String id) {
=======
      await CometChatUIKit.sendCustomMessage(message,
          onSuccess: (BaseMessage returnedMessage) {},
          onError: (CometChatException excep) {});
    }
  }

  Function(BaseMessage message, CometChatMessageListControllerProtocol state)?
      getActionFunction(String id) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    switch (id) {
      case MessageOptionConstants.editMessage:
        {
          return _messageEdit;
        }
      case MessageOptionConstants.deleteMessage:
        {
          return _delete;
        }
<<<<<<< HEAD
      case MessageOptionConstants.replyMessage:
        {
          return _replyMessage;
        }
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      case MessageOptionConstants.shareMessage:
        {
          return _shareMessage;
        }
      case MessageOptionConstants.copyMessage:
        {
          return _copyMessage;
        }
<<<<<<< HEAD
      // case MessageOptionConstants.forwardMessage:
      //   {
      //     return _forwardMessage;
      //   }
      // case MessageOptionConstants.replyInThreadMessage:
      //   {
      //     return _replyInThread;
      //   }
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      case MessageOptionConstants.messageInformation:
        {
          return _messageInformation;
        }
      case MessageOptionConstants.sendMessagePrivately:
        {
          return _sendMessagePrivately;
        }

      default:
        {
          return null;
        }
    }
  }

  @override
<<<<<<< HEAD
  void ccGroupMemberScopeChanged(
      cc.Action message, User updatedUser, String scopeChangedTo, String scopeChangedFrom, Group group) {
=======
  void ccGroupMemberScopeChanged(cc.Action message, User updatedUser,
      String scopeChangedTo, String scopeChangedFrom, Group group) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (group.guid == this.group?.guid) {
      if (loggedInUser?.uid == updatedUser.uid) {
        this.group?.scope = scopeChangedTo;
      }
<<<<<<< HEAD
      debugPrint('scope of ${updatedUser.name} changed to $scopeChangedTo from $scopeChangedFrom');
=======
      debugPrint(
          'scope of ${updatedUser.name} changed to $scopeChangedTo from $scopeChangedFrom');
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      _onMessageFromLoggedInUser(message);
    }
  }

  bool _checkIfSameConversationForReceivedMessage(BaseMessage message) {
<<<<<<< HEAD
    return (message.receiverType == CometChatReceiverType.user && user?.uid == message.sender?.uid) ||
        (message.receiverType == CometChatReceiverType.group && group?.guid == message.receiverUid);
  }

  bool _checkIfSameConversationForSenderMessage(BaseMessage message) {
    return (message.receiverType == CometChatReceiverType.user && user?.uid == message.receiverUid) ||
        (message.receiverType == CometChatReceiverType.group && group?.guid == message.receiverUid);
  }

  BubbleContentVerifier checkBubbleContent(BaseMessage messageObject, ChatAlignment alignment) {
=======
    return (message.receiverType == CometChatReceiverType.user &&
            user?.uid == message.sender?.uid) ||
        (message.receiverType == CometChatReceiverType.group &&
            group?.guid == message.receiverUid);
  }

  bool _checkIfSameConversationForSenderMessage(BaseMessage message) {
    return (message.receiverType == CometChatReceiverType.user &&
            user?.uid == message.receiverUid) ||
        (message.receiverType == CometChatReceiverType.group &&
            group?.guid == message.receiverUid);
  }

  BubbleContentVerifier checkBubbleContent(
      BaseMessage messageObject, ChatAlignment alignment) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    bool isMessageSentByMe = messageObject.sender?.uid == loggedInUser?.uid;

    BubbleAlignment alignment0 = BubbleAlignment.right;
    bool thumbnail = false;
    bool name = false;
    bool readReceipt = true;
<<<<<<< HEAD
    bool enableStatusInfoView = true;
=======
    bool showTime = true;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    if (alignment == ChatAlignment.standard) {
      //-----if message is group action-----
      if ((messageObject.category == MessageCategoryConstants.action) ||
<<<<<<< HEAD
          (messageObject.category == MessageCategoryConstants.call && messageObject.receiver is User)) {
        thumbnail = false;
        name = false;
        readReceipt = false;
        alignment0 = BubbleAlignment.center;
        enableStatusInfoView = false;
=======
          (messageObject.category == MessageCategoryConstants.call &&
              messageObject.receiver is User)) {
        thumbnail = false;
        name = false;
        readReceipt = false;
        showTime = false;
        alignment0 = BubbleAlignment.center;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      }
      //-----if message sent by me-----
      else if (isMessageSentByMe) {
        thumbnail = false;
        name = false;
        readReceipt = true;
        alignment0 = BubbleAlignment.right;
      }
      //-----if message received in user conversation-----
      else if (user != null) {
        thumbnail = false;
        name = false;
        readReceipt = false;
        alignment0 = BubbleAlignment.left;
      }
      //-----if message received in group conversation-----
      else if (group != null) {
        thumbnail = true;
        name = true;
        readReceipt = false;
        alignment0 = BubbleAlignment.left;
      }
    } else if (alignment == ChatAlignment.leftAligned) {
      //-----if message is  action message -----
      if ((messageObject.category == MessageCategoryConstants.action) ||
<<<<<<< HEAD
          (messageObject.category == MessageCategoryConstants.call && messageObject.receiver is User)) {
=======
          (messageObject.category == MessageCategoryConstants.call &&
              messageObject.receiver is User)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        thumbnail = false;
        name = false;
        readReceipt = false;
        alignment0 = BubbleAlignment.center;
<<<<<<< HEAD
        enableStatusInfoView = false;
=======
        showTime = false;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      }
      //-----if message sent by me-----
      else if (isMessageSentByMe) {
        thumbnail = true;
        name = true;
        readReceipt = true;
        alignment0 = BubbleAlignment.left;
      }
      //-----if message received in user conversation-----
      else if (user != null) {
        thumbnail = true;
        name = true;
        readReceipt = false;
        alignment0 = BubbleAlignment.left;
      }
      //-----if message received in group conversation-----
      else if (group != null) {
        thumbnail = true;
        name = true;
        readReceipt = false;
        alignment0 = BubbleAlignment.left;
      }
    }

<<<<<<< HEAD
    if (disableReceipt == true) {
=======
    if (disableReceipt == true || messageObject.deletedAt != null) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      readReceipt = false;
    }

    return BubbleContentVerifier(
      showThumbnail: thumbnail,
<<<<<<< HEAD
      showStatusInfoView: enableStatusInfoView,
=======
      showTime: showTime,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      showName: name,
      showReadReceipt: readReceipt,
      alignment: alignment0,
    );
  }

  @override
  initializeHeaderAndFooterView() {
    if (headerView != null) {
      header = headerView!(context, user: user, group: group);
    }

    if (footerView != null) {
      footer = footerView!(context, user: user, group: group);
    }
  }

  @override
<<<<<<< HEAD
  void showPanel(Map<String, dynamic>? id, CustomUIPosition uiPosition, WidgetBuilder child) {
=======
  void showPanel(Map<String, dynamic>? id, CustomUIPosition uiPosition,
      WidgetBuilder child) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (isForThisWidget(id) == false) return;
    if (uiPosition == CustomUIPosition.messageListBottom) {
      footer = child(context);
    } else if (uiPosition == CustomUIPosition.messageListTop) {
      header = child(context);
    }
    update();
  }

  @override
  void hidePanel(Map<String, dynamic>? id, CustomUIPosition uiPosition) {
    if (isForThisWidget(id) == false) return;
    if (uiPosition == CustomUIPosition.messageListBottom) {
      footer = null;
    } else if (uiPosition == CustomUIPosition.messageListBottom) {
      header = null;
    }
    update();
  }

  bool isForThisWidget(Map<String, dynamic>? id) {
    if (id == null) {
      return true; //if passed id is null , that means for all composer
    }
<<<<<<< HEAD
    if ((id['uid'] != null && id['uid'] == user?.uid) //checking if uid or guid match composer's uid or guid
=======
    if ((id['uid'] != null &&
            id['uid'] ==
                user?.uid) //checking if uid or guid match composer's uid or guid
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        ||
        (id['guid'] != null && id['guid'] == group?.guid)) {
      if (id['parentMessageId'] != null) {
        return (threadMessageParentId == id['parentMessageId']);
      }

      return true;
    }
    return false;
  }

//--------------SDK Call listeners-----------------------------------------------

  @override
  void onIncomingCallReceived(Call call) {
    call.category = MessageCategoryConstants.call;
    _onMessageReceived(call, playSound: false, markRead: false);
  }

  @override
  void onOutgoingCallAccepted(Call call) {
    call.category = MessageCategoryConstants.call;
    _onMessageReceived(call, playSound: false, markRead: false);
  }

  @override
  void onOutgoingCallRejected(Call call) {
    call.category = MessageCategoryConstants.call;
    _onMessageReceived(call, playSound: false, markRead: false);
  }

  @override
  void onIncomingCallCancelled(Call call) {
    call.category = MessageCategoryConstants.call;
    _onMessageReceived(call);
  }

  @override
  void onCallEndedMessageReceived(Call call) {
    call.category = MessageCategoryConstants.call;
    _onMessageReceived(call);
  }

//----------------- UI Call Listeners---------------

  bool _checkCallInSameConversation(Call call) {
    if (kDebugMode) {
      print(" $threadMessageParentId ${user?.uid} ${call.receiverUid} ");
    }

    return (threadMessageParentId == 0 &&
        user != null &&
        (call.sender?.uid == user?.uid || call.receiverUid == user?.uid));
  }

  @override
  void ccOutgoingCall(Call call) {
    if (_checkCallInSameConversation(call)) {
      _onMessageFromLoggedInUser(call, markRead: false, playSound: false);
    }
  }

  @override
  void ccCallAccepted(Call call) {
    if (_checkCallInSameConversation(call)) {
      _onMessageFromLoggedInUser(call, markRead: false, playSound: false);
    }
  }

  @override
  void ccCallRejected(Call call) {
    if (_checkCallInSameConversation(call)) {
      _onMessageFromLoggedInUser(call, markRead: false, playSound: false);
    }
  }

  @override
  void ccCallEnded(Call call) {
    if (_checkCallInSameConversation(call)) {
      _onMessageFromLoggedInUser(call, markRead: false, playSound: false);
    }
  }

  @override
  String getConversationId() {
    return conversationWithId;
  }

  @override
  BuildContext getCurrentContext() {
    return context;
  }

  @override
  Group? getGroup() {
    return group;
  }

  @override
  int? getParentMessageId() {
    return threadMessageParentId;
  }

  @override
  ScrollController getScrollController() {
    return messageListScrollController;
  }

  @override
  Map<String, CometChatMessageTemplate> getTemplateMap() {
    return templateMap;
  }

  @override
  User? getUser() {
    return user;
  }

  @override
  void onConnected() {
    _updateUserAndGroup();
    _fetchNewMessages();
  }

  /// [_fetchNewMessages] method fetches the new messages from the server after a web socket connection is re-established.
  void _fetchNewMessages() async {
    int? lastMessageId;
    for (int i = 0; i < list.length; i++) {
      if (list[i].id != 0) {
        lastMessageId = list[i].id;
        break;
      }
    }
    bool hasMoreItems = true;
    int messageId = lastMessageId ?? 1;
    List<String> categories =
<<<<<<< HEAD
        messagesBuilderProtocol.requestBuilder.categories ?? CometChatUIKit.getDataSource().getAllMessageCategories();
    List<String> types =
        messagesBuilderProtocol.requestBuilder.types ?? CometChatUIKit.getDataSource().getAllMessageTypes();

    // used to fetch the old messages from the server starting from the last message in the list that have been edited or deleted
    types.add(MessageTypeConstants.message);

    while (hasMoreItems) {
      //the following message request fetches the new messages received after the last message sent or received recorded in the list.
=======
        messagesBuilderProtocol.requestBuilder.categories ??
            CometChatUIKit.getDataSource().getAllMessageCategories();
    List<String> types = messagesBuilderProtocol.requestBuilder.types ??
        CometChatUIKit.getDataSource().getAllMessageTypes();
    bool hideReplies =
        messagesBuilderProtocol.requestBuilder.hideReplies ?? true;

    /// used to fetch the old messages from the server starting from the last message in the list that have been edited or deleted
    types.add(MessageTypeConstants.message);

    while (hasMoreItems) {
      ///The following message request fetches the new messages received after the last message sent or received recorded in the list.
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      MessagesRequest messageRequest = (MessagesRequestBuilder()
            ..uid = user?.uid
            ..guid = group?.guid
            ..categories = categories
            ..types = types
<<<<<<< HEAD
            ..messageId = messageId)
          .build();
      try {
        await messageRequest.fetchNext(onSuccess: (List<BaseMessage> fetchedList) {
=======
            ..messageId = messageId
            ..hideReplies = hideReplies)
          .build();
      try {
        await messageRequest.fetchNext(
            onSuccess: (List<BaseMessage> fetchedList) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          //if fetched messages list is empty, it means there are no new messages and hence stop proceeding.
          if (fetchedList.isNotEmpty) {
            hasMoreItems = true;
            for (BaseMessage message in fetchedList) {
              if (message is InteractiveMessage) {
<<<<<<< HEAD
                message = InteractiveMessageUtils.getSpecificMessageFromInteractiveMessage(message);
=======
                message = InteractiveMessageUtils
                    .getSpecificMessageFromInteractiveMessage(message);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              }
              if (message.parentMessageId != 0) {
                updateMessageThreadCount(message.parentMessageId);
              } else if (message is cc.Action) {
                if (message.type == MessageTypeConstants.message &&
                    (message.action == ActionMessageTypeConstants.edited ||
                        message.action == ActionMessageTypeConstants.deleted) &&
                    message.actionOn is BaseMessage) {
                  BaseMessage actionOn = message.actionOn as BaseMessage;
<<<<<<< HEAD
                  int matchingIndex = list.indexWhere((element) => (element.id == actionOn.id));
=======
                  int matchingIndex =
                      list.indexWhere((element) => (element.id == actionOn.id));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                  if (matchingIndex != -1) {
                    list[matchingIndex] = actionOn;
                    update();
                  }
                } else if (message.sender?.uid != null &&
                    loggedInUser?.uid != null &&
                    message.sender?.uid == loggedInUser?.uid) {
                  updateMessageWithMuid(message);
                } else {
                  addElement(message);
                  newUnreadMessageCount++;
                  update();
                }
              } else {
<<<<<<< HEAD
=======
                for (int i = 0; i < list.length; i++) {
                  if (list[i].muid == message.muid) {
                    list.removeAt(i);
                    update();
                    break;
                  }
                }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                addElement(message);
                newUnreadMessageCount++;
                update();
              }
            }
            messageId = fetchedList.last.id;
            return;
          } else {
            hasMoreItems = false;
            update();
          }
        }, onError: (CometChatException e) {
          hasMoreItems = false;
        });
      } catch (e, _) {
        hasMoreItems = false;
      }
    }
  }

  ///[_updateUserAndGroup] method updates the user and group details if the user or group is updated while the web socket connection is lost.
  _updateUserAndGroup() async {
    if (user != null) {
      user = await CometChat.getUser(
        user!.uid,
        onSuccess: (user) {},
        onError: (excep) {},
      );
    }
    if (group != null) {
      group = await CometChat.getGroup(
        group!.guid,
        onSuccess: (group) {},
        onError: (excep) {},
      );
    }
    update();
  }

  //  event listeners for message reaction

  @override
  void onMessageReactionAdded(ReactionEvent reactionEvent) {
    if (disableReactions != true) {
      _updateMessageOnReaction(reactionEvent, ReactionAction.reactionAdded);
    }
  }

  @override
  void onMessageReactionRemoved(ReactionEvent reactionEvent) {
    if (disableReactions != true) {
      _updateMessageOnReaction(reactionEvent, ReactionAction.reactionRemoved);
    }
  }

  _updateMessageOnReaction(ReactionEvent reactionEvent, String reactionAction) {
    Reaction? messageReaction = reactionEvent.reaction;
    if (messageReaction != null) {
      int? messageId = messageReaction.messageId;
      if (messageId == null) return;
<<<<<<< HEAD
      BaseMessage? message = list.firstWhereOrNull((element) => element.id == messageId);
      if (message == null) return;
      CometChatHelper.updateMessageWithReactionInfo(message, messageReaction, reactionAction).then((reactedMessage) {
        if (reactedMessage == null) return;
=======
      BaseMessage? message =
          list.firstWhereOrNull((element) => element.id == messageId);
      if (message == null) return;
      CometChatHelper.updateMessageWithReactionInfo(
              message, messageReaction, reactionAction)
          .then((reactedMessage) {
        if (reactedMessage == null) return;

>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        updateElement(reactedMessage);
      });
    }
  }

<<<<<<< HEAD
  handleReactionPress(BaseMessage message, String? reaction, List<ReactionCount> reactionList) {
    if (reaction == null || reaction.isEmpty) return;
    int reactionIndex = reactionList
        .indexWhere((reactionCount) => reactionCount.reaction == reaction && reactionCount.reactedByMe == true);
    if (reactionIndex != -1) {
      updateElement(updateReactionsOnMessage(message, reaction, false));
      // remove reaction
      CometChatUIKit.removeReaction(
=======
  handleReactionPress(
      BaseMessage message, String? reaction, List<ReactionCount> reactionList) {
    if (reaction == null || reaction.isEmpty) return;
    int reactionIndex = reactionList.indexWhere((reactionCount) =>
        reactionCount.reaction == reaction &&
        reactionCount.reactedByMe == true);
    if (reactionIndex != -1) {
      updateElement(updateReactionsOnMessage(message, reaction, false));

      /// remove reaction
      CometChat.removeReaction(
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        message.id,
        reaction,
        onError: (error) {
          updateElement(updateReactionsOnMessage(message, reaction, true));
        },
<<<<<<< HEAD
      );
    } else {
      // add reaction
      updateElement(updateReactionsOnMessage(message, reaction, true));
      CometChatUIKit.addReaction(
=======
        onSuccess: (message) {},
      );
    } else {
      /// add reaction
      updateElement(updateReactionsOnMessage(message, reaction, true));
      CometChat.addReaction(
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        message.id,
        reaction,
        onError: (error) {
          updateElement(updateReactionsOnMessage(message, reaction, false));
        },
<<<<<<< HEAD
=======
        onSuccess: (message) {},
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      );
    }
  }

  void addReactionIconTap(BaseMessage message) async {
    Navigator.of(context).pop();
    String? reaction = await showCometChatEmojiKeyboard(
        context: context,
<<<<<<< HEAD
        unselectedCategoryIconColor: emojiKeyboardStyle?.unselectedCategoryIconColor,
        selectedCategoryIconColor: emojiKeyboardStyle?.selectedCategoryIconColor,
=======
        unselectedCategoryIconColor:
            emojiKeyboardStyle?.unselectedCategoryIconColor,
        selectedCategoryIconColor:
            emojiKeyboardStyle?.selectedCategoryIconColor,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        dividerColor: emojiKeyboardStyle?.dividerColor,
        categoryLabel: emojiKeyboardStyle?.categoryLabelStyle,
        titleStyle: emojiKeyboardStyle?.titleStyle,
        backgroundColor: emojiKeyboardStyle?.backgroundColor);

    if (reaction != null) {
      handleReactionPress(message, reaction, message.reactions);
    }
  }

  void onReactionTap(BaseMessage message, String? reaction) async {
    if (reaction == null || reaction.isEmpty) return;

    handleReactionPress(message, reaction, message.reactions);
  }

<<<<<<< HEAD
  BaseMessage updateReactionsOnMessage(BaseMessage message, String reaction, bool add) {
    ReactionCount reactionCount = ReactionCount(reaction: reaction, count: 1, reactedByMe: true);
    int match = message.reactions.indexWhere((element) => element.reaction == reaction);
=======
  BaseMessage updateReactionsOnMessage(
      BaseMessage message, String reaction, bool add) {
    ReactionCount reactionCount =
        ReactionCount(reaction: reaction, count: 1, reactedByMe: true);
    int match =
        message.reactions.indexWhere((element) => element.reaction == reaction);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (add) {
      if (match == -1) {
        message.reactions.add(reactionCount);
      } else if (message.reactions[match].reactedByMe == false) {
        message.reactions[match].reactedByMe = true;
        if (message.reactions[match].count != null) {
          message.reactions[match].count = message.reactions[match].count! + 1;
        }
      }
    } else {
      if (match != -1 && message.reactions[match].reactedByMe == true) {
        if (message.reactions[match].count == 1) {
<<<<<<< HEAD
          message.reactions.remove(reactionCount);
        } else {
          message.reactions[match].reactedByMe = false;
          if (message.reactions[match].count != null) {
            message.reactions[match].count = message.reactions[match].count! - 1;
=======
          message.reactions.removeAt(match);
        } else {
          message.reactions[match].reactedByMe = false;
          if (message.reactions[match].count != null) {
            message.reactions[match].count =
                message.reactions[match].count! - 1;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          }
        }
      }
    }

    return message;
  }

<<<<<<< HEAD
  // Validates if the message's category and type match allowed values.
  // This method checks against categories and types from the request builder,
  // falling back to default values from the data source if none are provided.
  // @param message The message to validate.
  // @return True if both category and type are allowed, false otherwise.
  bool _messageCategoryTypeCheck(BaseMessage message) {
    List<String> categories =
        messagesBuilderProtocol.requestBuilder.categories ?? CometChatUIKit.getDataSource().getAllMessageCategories();
    List<String> types =
        messagesBuilderProtocol.requestBuilder.types ?? CometChatUIKit.getDataSource().getAllMessageTypes();

    return categories.contains(message.category) && types.contains(message.type);
=======
  /// Validates if the message's category and type match allowed values.
  /// This method checks against categories and types from the request builder,
  /// falling back to default values from the data source if none are provided.
  /// @param message The message to validate.
  /// @return True if both category and type are allowed, false otherwise.
  bool _messageCategoryTypeCheck(BaseMessage message) {
    List<String> categories =
        messagesBuilderProtocol.requestBuilder.categories ??
            CometChatUIKit.getDataSource().getAllMessageCategories();
    List<String> types = messagesBuilderProtocol.requestBuilder.types ??
        CometChatUIKit.getDataSource().getAllMessageTypes();

    return categories.contains(message.category) &&
        types.contains(message.type);
  }

  void initializeTextFormatters() {
    List<CometChatTextFormatter> textFormatters = this.textFormatters ?? [];

    if (textFormatters.isEmpty) {
      textFormatters =
          CometChatUIKit.getDataSource().getDefaultTextFormatters();
    } else if (textFormatters.indexWhere(
                (element) => element is CometChatMentionsFormatter) ==
            -1 &&
        disableMentions != true) {
      textFormatters.add(CometChatMentionsFormatter());
    }

    if (disableMentions == true) {
      textFormatters
          .removeWhere((element) => element is CometChatMentionsFormatter);
    }

    this.textFormatters = textFormatters;
  }

  List<CometChatTextFormatter> getTextFormatters(
      BaseMessage message, CometChatTheme theme) {
    List<CometChatTextFormatter> textFormatters = this.textFormatters ?? [];
    if (message is TextMessage) {
      for (CometChatTextFormatter textFormatter in textFormatters) {
        textFormatter.message = message;
        textFormatter.theme = theme;
      }
    }
    return textFormatters;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }
}

class BubbleContentVerifier {
  bool showThumbnail;
  bool showName;
  bool showReadReceipt;
  bool showFooterView;
  BubbleAlignment alignment;
<<<<<<< HEAD
  bool showStatusInfoView;
=======
  bool showTime;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  BubbleContentVerifier(
      {this.showThumbnail = false,
      this.showName = false,
      this.showReadReceipt = true,
      this.showFooterView = true,
      this.alignment = BubbleAlignment.right,
<<<<<<< HEAD
      this.showStatusInfoView = true});
=======
      this.showTime = true});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}
