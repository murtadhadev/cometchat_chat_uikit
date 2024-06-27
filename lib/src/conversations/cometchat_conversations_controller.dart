import 'package:flutter/material.dart';

import '../../../cometchat_chat_uikit.dart';
import '../../../cometchat_chat_uikit.dart' as cc;

///[CometChatConversationsController] is the view model for [CometChatConversations]
///it contains all the business logic involved in changing the state of the UI of [CometChatConversations]
<<<<<<< HEAD
class CometChatConversationsController extends CometChatSearchListController<Conversation, String>
=======
class CometChatConversationsController
    extends CometChatListController<Conversation, String>
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    with
        CometChatSelectable,
        CometChatMessageEventListener,
        CometChatGroupEventListener,
        UserListener,
        GroupListener,
        CometChatUserEventListener,
        CallListener,
        CometChatCallEventListener,
        ConnectionListener
    implements CometChatConversationsControllerProtocol {
  //Constructor
  CometChatConversationsController(
      {required this.conversationsBuilderProtocol,
      SelectionMode? mode,
      required this.theme,
      this.disableSoundForMessages = false,
      this.customSoundForMessages,
<<<<<<< HEAD
      this.disableUsersPresence,
      this.disableReceipt = false,
      this.disableTyping,
      this.deleteConversationDialogStyle,
      OnError? onError})
      : super(builderProtocol: conversationsBuilderProtocol, onError: onError) {
=======
      this.disableUsersPresence = false,
      this.disableReceipt = false,
      this.disableTyping,
      this.deleteConversationDialogStyle,
      OnError? onError,
      this.textFormatters,
      this.disableMentions})
      : super(conversationsBuilderProtocol.getRequest(), onError: onError) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    selectionMode = mode ?? SelectionMode.none;
    dateStamp = DateTime.now().microsecondsSinceEpoch.toString();

    groupSDKListenerID = "${dateStamp}_group_sdk_listener";
    groupUIListenerID = "${dateStamp}_ui_group_listener";
    messageSDKListenerID = "${dateStamp}_message_sdk_listener";
    messageUIListenerID = "${dateStamp}_ui_message_listener";
    userSDKListenerID = "${dateStamp}_user_sdk_listener";
    _uiUserListener = "${dateStamp}UI_user_listener";
    _conversationListenerId = "${dateStamp}_conversation_listener";
  }

  late ConversationsBuilderProtocol conversationsBuilderProtocol;
  late String dateStamp;
  BuildContext? context;
  late String groupSDKListenerID;
  late String groupUIListenerID;
  late String messageSDKListenerID;
  late String messageUIListenerID;
  late String userSDKListenerID;
  late String _uiUserListener;
  late String _conversationListenerId;

<<<<<<< HEAD
  Set<String> typingIndicatorMap = {};
=======
  Map<String, TypingIndicator> typingMap = {};
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  User? loggedInUser;

  ///[disableSoundForMessages] if true will disable sound for messages
  final bool? disableSoundForMessages;

  ///[theme] can pass custom theme class or dark theme defaultDarkTheme object from CometChatTheme class, by default light theme
  final CometChatTheme? theme;

  ///[customSoundForMessages] URL of the audio file to be played upon receiving messages
  final String? customSoundForMessages;

  ///[disableReceipt] controls visibility of read receipts
  ///and also disables logic executed inside onMessagesRead and onMessagesDelivered listeners
  final bool? disableReceipt;

  String loggedInUserId = "";
<<<<<<< HEAD
  String? activeConversation; //active user or groupID, null when no message list is active
=======
  String?
      activeConversation; //active user or groupID, null when no message list is active
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ConversationsStyle? style;

  bool? disableUsersPresence;

  ///[disableTyping] if true stops indicating if a participant in a conversation is typing
  final bool? disableTyping;

  ///[deleteConversationDialogStyle] provides customization for the dialog box that pops up when tapping the delete conversation option
  final ConfirmDialogStyle? deleteConversationDialogStyle;

<<<<<<< HEAD
=======
  ///[textFormatters] is a list of [CometChatTextFormatter] which is used to format the text
  List<CometChatTextFormatter>? textFormatters;

  ///[disableMentions] if true will disable mentions in the conversation
  bool? disableMentions;

>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  @override
  void onInit() {
    CometChatMessageEvents.addMessagesListener(messageUIListenerID, this);
    CometChatGroupEvents.addGroupsListener(groupUIListenerID, this);
<<<<<<< HEAD

    if (disableUsersPresence == false) {
=======
    if (!(disableUsersPresence ?? false)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      CometChat.addUserListener(userSDKListenerID, this);
    }
    CometChat.addGroupListener(groupSDKListenerID, this);

    CometChatUserEvents.addUsersListener(_uiUserListener, this);
    CometChatCallEvents.addCallEventsListener(_conversationListenerId, this);
    CometChat.addCallListener(_conversationListenerId, this);
    CometChat.addConnectionListener(_conversationListenerId, this);
<<<<<<< HEAD
=======
    initializeTextFormatters();
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    super.onInit();
  }

  @override
  void onClose() {
    CometChatMessageEvents.removeMessagesListener(messageUIListenerID);
    CometChatGroupEvents.removeGroupsListener(groupUIListenerID);
    CometChat.removeMessageListener(messageSDKListenerID);
<<<<<<< HEAD
    if (disableUsersPresence == false) {
=======
    if (!(disableUsersPresence ?? false)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      CometChat.removeUserListener(userSDKListenerID);
    }
    //CometChat.removeGroupListener(groupSDKListenerID);
    CometChatUserEvents.removeUsersListener(_uiUserListener);
    CometChatCallEvents.removeCallEventsListener(_conversationListenerId);
    CometChat.removeCallListener(_conversationListenerId);
    CometChat.removeConnectionListener(_conversationListenerId);
    super.onClose();
  }

  @override
  bool match(Conversation elementA, Conversation elementB) {
    return elementA.conversationId == elementB.conversationId;
  }

  @override
  String getKey(Conversation element) {
    return element.conversationId!;
  }

  @override
  loadMoreElements({bool Function(Conversation element)? isIncluded}) async {
    loggedInUser ??= await CometChat.getLoggedInUser();
    if (loggedInUser != null) {
      loggedInUserId = loggedInUser!.uid;
    }
    await super.loadMoreElements();
  }

  @override
  void ccMessageRead(BaseMessage message) {
    resetUnreadCount(message);
  }

  @override
  void ccMessageSent(BaseMessage message, MessageStatus messageStatus) {
<<<<<<< HEAD
=======
    if (_checkMessageSettings(message)) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (messageStatus == MessageStatus.sent) {
      updateLastMessage(message);
    }
  }

  @override
  void ccMessageEdited(BaseMessage message, MessageEditStatus status) {
    if (status == MessageEditStatus.success) {
      updateLastMessageOnEdited(message);
    }
  }

  @override
  void onMessageDeleted(BaseMessage message) {
    updateLastMessageOnEdited(message);
  }

  @override
  void ccMessageDeleted(BaseMessage message, EventStatus messageStatus) {
    if (messageStatus == EventStatus.success) {
      updateLastMessageOnEdited(message);
    }
  }

  @override
  ccOwnershipChanged(Group group, GroupMember newOwner) {
    updateGroup(group);
  }

  @override
  ccGroupLeft(cc.Action message, User leftUser, Group leftGroup) {
    removeGroup(leftGroup.guid);
  }

  @override
  void ccGroupDeleted(Group group) {
    removeGroup(group.guid);
  }

  @override
<<<<<<< HEAD
  void ccGroupMemberAdded(List<cc.Action> messages, List<User> usersAdded, Group groupAddedIn, User addedBy) {
=======
  void ccGroupMemberAdded(List<cc.Action> messages, List<User> usersAdded,
      Group groupAddedIn, User addedBy) {
    if (_checkGroupSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(messages.last, true);
  }

  //-----------Message Listeners------------------------------------------------

  _onMessageReceived(BaseMessage message, bool isActionMessage) {
    if (message.sender!.uid != loggedInUserId && disableReceipt != true) {
      CometChat.markAsDelivered(message, onSuccess: (_) {}, onError: (_) {});
    }

    if (disableSoundForMessages == false) {
      playNotificationSound(message);
    }

    refreshSingleConversation(message, isActionMessage);
  }

  @override
  void onTextMessageReceived(TextMessage textMessage) async {
<<<<<<< HEAD
=======
    if (_checkMessageSettings(textMessage)) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    _onMessageReceived(textMessage, false);
  }

  @override
  void onMediaMessageReceived(MediaMessage mediaMessage) async {
<<<<<<< HEAD
=======
    if (_checkMessageSettings(mediaMessage)) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    _onMessageReceived(mediaMessage, false);
  }

  @override
  void onCustomMessageReceived(CustomMessage customMessage) async {
<<<<<<< HEAD
=======
    if (_checkMessageSettings(customMessage)) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    _onMessageReceived(customMessage, false);
  }

  @override
  void onMessagesDelivered(MessageReceipt messageReceipt) {
<<<<<<< HEAD
    if (messageReceipt.receiverType == ReceiverTypeConstants.user && disableReceipt != true) {
=======
    if (messageReceipt.receiverType == ReceiverTypeConstants.user &&
        disableReceipt != true) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      setReceipts(messageReceipt);
    }
  }

  @override
  void onMessagesRead(MessageReceipt messageReceipt) {
<<<<<<< HEAD
    if (messageReceipt.receiverType == ReceiverTypeConstants.user && disableReceipt != true) {
=======
    if (messageReceipt.receiverType == ReceiverTypeConstants.user &&
        disableReceipt != true) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      setReceipts(messageReceipt);
    }
  }

  @override
  void onMessageEdited(BaseMessage message) {
    updateLastMessageOnEdited(message);
  }

  @override
  void onTypingStarted(TypingIndicator typingIndicator) {
    if (disableTyping != true) {
      setTypingIndicator(typingIndicator, true);
    }
  }

  @override
  void onTypingEnded(TypingIndicator typingIndicator) {
    if (disableTyping != true) {
      setTypingIndicator(typingIndicator, false);
    }
  }

  @override
  void onFormMessageReceived(FormMessage formMessage) {
<<<<<<< HEAD
=======
    if (_checkMessageSettings(formMessage)) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    _onMessageReceived(formMessage, false);
  }

  @override
  void onCardMessageReceived(CardMessage cardMessage) {
<<<<<<< HEAD
=======
    if (_checkMessageSettings(cardMessage)) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    _onMessageReceived(cardMessage, false);
  }

  @override
<<<<<<< HEAD
  void onCustomInteractiveMessageReceived(CustomInteractiveMessage cardMessage) {
    _onMessageReceived(cardMessage, false);
=======
  void onCustomInteractiveMessageReceived(
      CustomInteractiveMessage customInteractiveMessage) {
    if (_checkMessageSettings(customInteractiveMessage)) {
      return;
    }
    _onMessageReceived(customInteractiveMessage, false);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

  //----------------Message Listeners end----------------------------------------------

  //----------------User Listeners-----------------------------------------------------
  @override
  void onUserOnline(User user) {
    updateUserStatus(user, UserStatusConstants.online);
  }

  @override
  void onUserOffline(User user) {
    updateUserStatus(user, UserStatusConstants.offline);
  }

  @override
  void ccUserBlocked(User user) {
    int matchingIndex = list.indexWhere((Conversation conversation) =>
        (conversation.conversationType == ReceiverTypeConstants.user &&
            (conversation.conversationWith as User).uid == user.uid));
    removeElementAt(matchingIndex);
  }

  //----------------User Listeners end----------------------------------------------
  //----------------Group Listeners-----------------------------------------------------

  @override
  onGroupMemberJoined(cc.Action action, User joinedUser, Group joinedGroup) {
<<<<<<< HEAD
=======
    if (_checkGroupSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(action, true);
  }

  @override
  onGroupMemberLeft(cc.Action action, User leftUser, Group leftGroup) {
<<<<<<< HEAD
=======
    if (_checkGroupSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (loggedInUserId == leftUser.uid) {
      refreshSingleConversation(action, true, remove: true);
    } else {
      refreshSingleConversation(action, true);
    }
  }

  @override
<<<<<<< HEAD
  onGroupMemberKicked(cc.Action action, User kickedUser, User kickedBy, Group kickedFrom) {
=======
  onGroupMemberKicked(
      cc.Action action, User kickedUser, User kickedBy, Group kickedFrom) {
    if (_checkGroupSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (loggedInUserId == kickedUser.uid) {
      refreshSingleConversation(action, true, remove: true);
    } else {
      refreshSingleConversation(action, true);
    }
  }

  @override
<<<<<<< HEAD
  void ccGroupMemberKicked(cc.Action message, User kickedUser, User kickedBy, Group kickedFrom) {
=======
  void ccGroupMemberKicked(
      cc.Action message, User kickedUser, User kickedBy, Group kickedFrom) {
    if (_checkGroupSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (loggedInUserId == kickedUser.uid) {
      refreshSingleConversation(message, true, remove: true);
    } else {
      refreshSingleConversation(message, true);
    }
  }

  @override
<<<<<<< HEAD
  onGroupMemberBanned(cc.Action action, User bannedUser, User bannedBy, Group bannedFrom) {
=======
  onGroupMemberBanned(
      cc.Action action, User bannedUser, User bannedBy, Group bannedFrom) {
    if (_checkGroupSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (loggedInUserId == bannedUser.uid) {
      refreshSingleConversation(action, true, remove: true);
    } else {
      refreshSingleConversation(action, true);
    }
  }

  @override
<<<<<<< HEAD
  onGroupMemberUnbanned(cc.Action action, User unbannedUser, User unbannedBy, Group unbannedFrom) {
=======
  onGroupMemberUnbanned(cc.Action action, User unbannedUser, User unbannedBy,
      Group unbannedFrom) {
    if (_checkGroupSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(action, true);
  }

  @override
<<<<<<< HEAD
  onGroupMemberScopeChanged(
      cc.Action action, User updatedBy, User updatedUser, String scopeChangedTo, String scopeChangedFrom, Group group) {
=======
  onGroupMemberScopeChanged(cc.Action action, User updatedBy, User updatedUser,
      String scopeChangedTo, String scopeChangedFrom, Group group) {
    if (_checkGroupSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(action, true);
  }

  @override
<<<<<<< HEAD
  onMemberAddedToGroup(cc.Action action, User addedby, User userAdded, Group addedTo) {
=======
  onMemberAddedToGroup(
      cc.Action action, User addedby, User userAdded, Group addedTo) {
    if (_checkGroupSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(action, true);
  }

  @override
<<<<<<< HEAD
  void ccGroupMemberBanned(cc.Action message, User bannedUser, User bannedBy, Group bannedFrom) {
=======
  void ccGroupMemberBanned(
      cc.Action message, User bannedUser, User bannedBy, Group bannedFrom) {
    if (_checkGroupSettings() == false) {
      return;
    }

>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (loggedInUserId == bannedUser.uid) {
      refreshSingleConversation(message, true, remove: true);
    } else {
      refreshSingleConversation(message, true);
    }
  }
  //----------------Group Listeners end----------------------------------------------

  @override
  updateUserStatus(User user, String status) {
    int matchingIndex = list.indexWhere((element) =>
<<<<<<< HEAD
        (element.conversationType == ReceiverTypeConstants.user && (element.conversationWith as User).uid == user.uid));
=======
        (element.conversationType == ReceiverTypeConstants.user &&
            (element.conversationWith as User).uid == user.uid));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    if (matchingIndex != -1) {
      (list[matchingIndex].conversationWith as User).status = status;
      update();
    }
  }

  //------------------------------------------------------------------------

  //----------------Public Methods -----------------------------------------------------

  @override
  deleteConversation(Conversation conversation) {
    int matchingIndex = getMatchingIndex(conversation);

    deleteConversationFromIndex(matchingIndex);
  }

  @override
  resetUnreadCount(BaseMessage message) {
    int matchingIndex = getMatchingIndexFromKey(message.conversationId!);
    if (matchingIndex != -1) {
      list[matchingIndex].unreadMessageCount = 0;
      update();
    }
  }

  @override
  updateLastMessage(BaseMessage message) async {
    int matchingIndex = getMatchingIndexFromKey(message.conversationId!);
<<<<<<< HEAD

=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (matchingIndex != -1) {
      Conversation conversation = list[matchingIndex];
      conversation.lastMessage = message;
      conversation.unreadMessageCount = 0;
      removeElementAt(matchingIndex);
      addElement(conversation);
    } else {
<<<<<<< HEAD
      CometChat.getConversationFromMessage(message, onSuccess: (Conversation conversation) {
        addElement(conversation);
      }, onError: (_) {});
=======
      final conversation =
          await CometChatHelper.getConversationFromMessage(message);
      if (conversation != null) {
        addElement(conversation);
      }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
  }

  @override
  updateGroup(Group group) {
<<<<<<< HEAD
    int matchingIndex = list.indexWhere(
        (element) => ((element.conversationWith is Group) && ((element.conversationWith as Group).guid == group.guid)));
=======
    int matchingIndex = list.indexWhere((element) =>
        ((element.conversationWith is Group) &&
            ((element.conversationWith as Group).guid == group.guid)));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    if (matchingIndex != -1) {
      list[matchingIndex].conversationWith = group;
      update();
    }
  }

  @override
  removeGroup(String guid) {
<<<<<<< HEAD
    int matchingIndex = list.indexWhere(
        (element) => ((element.conversationWith is Group) && ((element.conversationWith as Group).guid == guid)));
=======
    int matchingIndex = list.indexWhere((element) =>
        ((element.conversationWith is Group) &&
            ((element.conversationWith as Group).guid == guid)));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    if (matchingIndex != -1) {
      removeElementAt(matchingIndex);
    }
  }

  @override
  updateLastMessageOnEdited(BaseMessage message) async {
    int matchingIndex = getMatchingIndexFromKey(message.conversationId!);

    if (matchingIndex != -1) {
      if (list[matchingIndex].lastMessage?.id == message.id) {
        list[matchingIndex].lastMessage = message;
        update();
      }
    }
  }

  @override
<<<<<<< HEAD
  refreshSingleConversation(BaseMessage message, bool isActionMessage, {bool? remove}) async {
    CometChat.getConversationFromMessage(message, onSuccess: (Conversation conversation) {
=======
  refreshSingleConversation(BaseMessage message, bool isActionMessage,
      {bool? remove}) async {
    final conversation =
        await CometChatHelper.getConversationFromMessage(message);
    if (conversation != null) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      conversation.lastMessage = message;
      conversation.updatedAt = message.updatedAt;
      if (remove == true) {
        removeElement(conversation);
      } else {
        updateConversation(conversation);
      }
<<<<<<< HEAD
    }, onError: (_) {});
=======
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

  ///Update the conversation with new conversation Object matched according to conversation id ,  if not matched inserted at top
  @override
  updateConversation(Conversation conversation) {
    int matchingIndex = getMatchingIndex(conversation);

<<<<<<< HEAD
    Map<String, dynamic>? metaData = conversation.lastMessage!.metadata;
    bool incrementUnreadCount = false;
    bool isCategoryMessage = (conversation.lastMessage!.category == MessageCategoryConstants.message) ||
        (conversation.lastMessage!.category == MessageCategoryConstants.interactive);
    if (metaData != null) {
      if (metaData.containsKey("incrementUnreadCount")) {
        incrementUnreadCount = metaData["incrementUnreadCount"] as bool;
=======
    bool incrementUnreadCount = false;
    bool isCategoryMessage = (conversation.lastMessage!.category ==
            MessageCategoryConstants.message) ||
        (conversation.lastMessage!.category ==
            MessageCategoryConstants.interactive) ||
        (conversation.lastMessage!.category == MessageCategoryConstants.call);
    if (conversation.lastMessage is CustomMessage) {
      final message = conversation.lastMessage as CustomMessage;
      if (message.updateConversation == true ||
          (conversation.lastMessage?.metadata?[
                      UpdateSettingsConstant.incrementUnreadCount] ??
                  false) ==
              true ||
          (CometChatUIKit.conversationUpdateSettings?.customMessages ??
              true == true)) {
        incrementUnreadCount = true;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      }
    }

    if (matchingIndex != -1) {
      Conversation oldConversation = list[matchingIndex];

<<<<<<< HEAD
      if ((incrementUnreadCount || isCategoryMessage) && conversation.lastMessage?.sender?.uid != loggedInUserId) {
        conversation.unreadMessageCount = (oldConversation.unreadMessageCount ?? 0) + 1;
=======
      if ((incrementUnreadCount || isCategoryMessage) &&
          conversation.lastMessage?.sender?.uid != loggedInUserId) {
        conversation.unreadMessageCount =
            (oldConversation.unreadMessageCount ?? 0) + 1;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      } else {
        conversation.unreadMessageCount = oldConversation.unreadMessageCount;
      }
      removeElementAt(matchingIndex);
      addElement(conversation);
    } else {
<<<<<<< HEAD
      if ((incrementUnreadCount || isCategoryMessage) && conversation.lastMessage?.sender?.uid != loggedInUserId) {
=======
      if ((incrementUnreadCount || isCategoryMessage) &&
          conversation.lastMessage?.sender?.uid != loggedInUserId) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        int oldCount = conversation.unreadMessageCount ?? 0;
        conversation.unreadMessageCount = oldCount + 1;
      }
      addElement(conversation);
    }

    update();
  }

//Set Receipt for
  @override
  setReceipts(MessageReceipt receipt) {
    for (int i = 0; i < list.length; i++) {
      Conversation conversation = list[i];
      if (conversation.conversationType == ReceiverTypeConstants.user &&
          receipt.sender.uid == ((conversation.conversationWith as User).uid)) {
        BaseMessage? lastMessage = conversation.lastMessage;

        //Check if receipt type is delivered
        if (lastMessage != null &&
            lastMessage.deliveredAt == null &&
            receipt.receiptType == ReceiptTypeConstants.delivered &&
            receipt.messageId == lastMessage.id) {
          lastMessage.deliveredAt = receipt.deliveredAt;
          list[i].lastMessage = lastMessage;
          update();
          break;
        } else if (lastMessage != null &&
            lastMessage.readAt == null &&
            receipt.receiptType == ReceiptTypeConstants.read &&
            receipt.messageId == lastMessage.id) {
          //if receipt type is read
          lastMessage.readAt = receipt.readAt;
          list[i].lastMessage = lastMessage;
          update();

          break;
        }
      }
    }
  }

  @override
<<<<<<< HEAD
  setTypingIndicator(TypingIndicator typingIndicator, bool isTypingStarted) async {
=======
  setTypingIndicator(
      TypingIndicator typingIndicator, bool isTypingStarted) async {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    int matchingIndex;
    if (typingIndicator.receiverType == ReceiverTypeConstants.user) {
      matchingIndex = list.indexWhere((Conversation conversation) =>
          (conversation.conversationType == ReceiverTypeConstants.user &&
<<<<<<< HEAD
              (conversation.conversationWith as User).uid == typingIndicator.sender.uid));
    } else {
      matchingIndex = list.indexWhere((Conversation conversation) =>
          (conversation.conversationType == ReceiverTypeConstants.group &&
              (conversation.conversationWith as Group).guid == typingIndicator.receiverId));
    }

    if (matchingIndex != -1) {
      if (isTypingStarted == true) {
        typingIndicatorMap.add(list[matchingIndex].conversationId!);
      } else {
        typingIndicatorMap.remove(list[matchingIndex].conversationId!);
=======
              (conversation.conversationWith as User).uid ==
                  typingIndicator.sender.uid));
    } else {
      matchingIndex = list.indexWhere((Conversation conversation) =>
          (conversation.conversationType == ReceiverTypeConstants.group &&
              (conversation.conversationWith as Group).guid ==
                  typingIndicator.receiverId));
    }
    if (matchingIndex != -1) {
      if (isTypingStarted == true) {
        typingMap[list[matchingIndex].conversationId!] = typingIndicator;
      } else {
        if (typingMap.containsKey(list[matchingIndex].conversationId!)) {
          typingMap.remove(list[matchingIndex].conversationId!);
        }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      }
      update();
    }
  }

  @override
  void deleteConversationFromIndex(int index) async {
    late String conversationWith;
    late String conversationType;
<<<<<<< HEAD
    if (list[index].conversationType.toLowerCase() == ReceiverTypeConstants.group.toLowerCase()) {
=======
    if (list[index].conversationType.toLowerCase() ==
        ReceiverTypeConstants.group.toLowerCase()) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      conversationWith = (list[index].conversationWith as Group).guid;
      conversationType = ReceiverTypeConstants.group;
    } else {
      conversationWith = (list[index].conversationWith as User).uid;
      conversationType = ReceiverTypeConstants.user;
    }
    if (context != null) {
      showCometChatConfirmDialog(
          context: context!,
<<<<<<< HEAD
          confirmButtonText: Translations.of(context!).delete_capital,
          cancelButtonText: Translations.of(context!).cancel_capital,
          messageText: Text(
            Translations.of(context!).delete_confirm,
=======
          confirmButtonText: Translations.of(context!).deleteCapital,
          cancelButtonText: Translations.of(context!).cancelCapital,
          messageText: Text(
            Translations.of(context!).deleteConfirm,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            style: TextStyle(
                fontSize: theme?.typography.title2.fontSize,
                fontWeight: theme?.typography.title2.fontWeight,
                color: theme?.palette.getAccent(),
                fontFamily: theme?.typography.title2.fontFamily),
          ),
          onCancel: () {
            Navigator.pop(context!);
          },
          style: ConfirmDialogStyle(
              backgroundColor: deleteConversationDialogStyle?.backgroundColor ??
                  (theme?.palette.mode == PaletteThemeModes.light
                      ? theme?.palette.getBackground()
<<<<<<< HEAD
                      : Color.alphaBlend(theme!.palette.getAccent200(), theme!.palette.getBackground())),
              shadowColor: deleteConversationDialogStyle?.shadowColor ?? theme?.palette.getAccent300(),
=======
                      : Color.alphaBlend(theme!.palette.getAccent200(),
                          theme!.palette.getBackground())),
              shadowColor: deleteConversationDialogStyle?.shadowColor ??
                  theme?.palette.getAccent300(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              confirmButtonTextStyle: TextStyle(
                      fontSize: theme?.typography.text2.fontSize,
                      fontWeight: theme?.typography.text2.fontWeight,
                      color: theme?.palette.getPrimary())
                  .merge(deleteConversationDialogStyle?.confirmButtonTextStyle),
              cancelButtonTextStyle: TextStyle(
                      fontSize: theme?.typography.text2.fontSize,
                      fontWeight: theme?.typography.text2.fontWeight,
                      color: theme?.palette.getPrimary())
                  .merge(deleteConversationDialogStyle?.cancelButtonTextStyle)),
          onConfirm: () async {
<<<<<<< HEAD
            await CometChat.deleteConversation(conversationWith, conversationType, onSuccess: (_) {
=======
            await CometChat.deleteConversation(
                conversationWith, conversationType, onSuccess: (_) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              removeElementAt(index);
              CometChatConversationEvents.ccConversationDeleted(list[index]);
            }, onError: onError);
            Navigator.pop(context!);
            update();
          });
    }
  }

  @override
  playNotificationSound(BaseMessage message) {
    //Write all conditions here to stop sound
<<<<<<< HEAD
    if (message.type == MessageTypeConstants.custom && (message.metadata?["incrementUnreadCount"] != true)) {
=======
    if (message.type == MessageTypeConstants.custom &&
        (message.metadata?[UpdateSettingsConstant.incrementUnreadCount] !=
            true)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      return;
    } //not playing sound in case message type is custom and increment counter is not true

    ///checking if [CometChatConversations] is at the top of the navigation stack
    if (context != null && ModalRoute.of(context!)!.isCurrent) {
      //reset active conversation
      if (activeConversation != null) {
        activeConversation = null;
      }
    }
    if (activeConversation == null) {
      //if no message list is open
<<<<<<< HEAD
      /*  CometChatUIKit.soundManager.play(
          sound: Sound.incomingMessageFromOther,
          customSound: customSoundForMessages); */
    } else {
      if (activeConversation != message.conversationId) {
        //if open message list has different conversation id then message received conversation id
        /*  CometChatUIKit.soundManager.play(sound: Sound.incomingMessage, customSound: customSoundForMessages); */
=======
      CometChatUIKit.soundManager.play(
          sound: Sound.incomingMessageFromOther,
          customSound: customSoundForMessages);
    } else {
      if (activeConversation != message.conversationId) {
        //if open message list has different conversation id then message received conversation id
        CometChatUIKit.soundManager.play(
            sound: Sound.incomingMessage, customSound: customSoundForMessages);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      }
    }
  }

  @override
  bool getHideThreadIndicator(Conversation conversation) {
    if (conversation.lastMessage?.parentMessageId == null) {
      return true;
    } else if (conversation.lastMessage?.parentMessageId == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  bool getHideReceipt(Conversation conversation, bool? disableReadReceipt) {
    if (disableReadReceipt == true || conversation.lastMessage == null) {
      return true;
<<<<<<< HEAD
    } else if (conversation.lastMessage!.category == MessageCategoryConstants.call) {
=======
    } else if (conversation.lastMessage!.category ==
        MessageCategoryConstants.call) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      return true;
    } else if (conversation.lastMessage!.sender!.uid == loggedInUser?.uid) {
      return false;
    } else {
      return true;
    }
  }

  //----------- get last message text-----------
<<<<<<< HEAD
  @override
  String getLastMessage(Conversation conversation, BuildContext context) {
    BaseMessage? lastMessage = conversation.lastMessage;
    String? messageCategory = lastMessage?.category;

    if (messageCategory == null || lastMessage == null) {
      return '';
    } else if (lastMessage.deletedBy != null && lastMessage.deletedBy!.trim() != '') {
      return cc.Translations.of(context).this_message_deleted;
    } else {
      return CometChatUIKit.getDataSource().getLastConversationMessage(conversation, context);
    }
  }

=======

  void initializeTextFormatters() {
    List<CometChatTextFormatter> textFormatters = this.textFormatters ?? [];

    if ((textFormatters.isEmpty ||
            textFormatters.indexWhere(
                    (element) => element is CometChatMentionsFormatter) ==
                -1) &&
        disableMentions != true) {
      textFormatters.add(CometChatMentionsFormatter());
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
  }

  /// ----------------------------EVENT LISTENERS -----------------------------------

>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  @override
  void onConnected() {
    if (!isLoading) {
      request = conversationsBuilderProtocol.getRequest();
      list = [];
      loadMoreElements(
        isIncluded: (element) => getMatchingIndex(element) != -1,
      );
    }
  }

  @override
  void ccCallAccepted(Call call) {
<<<<<<< HEAD
=======
    if (_checkCallSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(call, true);
  }

  @override
  void ccOutgoingCall(Call call) {
<<<<<<< HEAD
=======
    if (_checkCallSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(call, true);
  }

  @override
  void ccCallRejected(Call call) {
<<<<<<< HEAD
=======
    if (_checkCallSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(call, true);
  }

  @override
  void ccCallEnded(Call call) {
<<<<<<< HEAD
=======
    if (_checkCallSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(call, true);
  }

  @override
  void onIncomingCallReceived(Call call) {
<<<<<<< HEAD
=======
    if (_checkCallSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(call, true);
  }

  @override
  void onOutgoingCallAccepted(Call call) {
<<<<<<< HEAD
=======
    if (_checkCallSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(call, true);
  }

  @override
  void onOutgoingCallRejected(Call call) {
<<<<<<< HEAD
=======
    if (_checkCallSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(call, true);
  }

  @override
  void onIncomingCallCancelled(Call call) {
<<<<<<< HEAD
=======
    if (_checkCallSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(call, true);
  }

  @override
  void onCallEndedMessageReceived(Call call) {
<<<<<<< HEAD
=======
    if (_checkCallSettings() == false) {
      return;
    }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    refreshSingleConversation(call, true);
  }

  @override
  void onSchedulerMessageReceived(SchedulerMessage schedulerMessage) {
<<<<<<< HEAD
    _onMessageReceived(schedulerMessage, false);
  }
=======
    if (_checkMessageSettings(schedulerMessage)) {
      return;
    }
    _onMessageReceived(schedulerMessage, false);
  }

  // Check settings for custom message and thread message condition
  bool _checkMessageSettings(BaseMessage message) {
    if (message.parentMessageId != 0 &&
        CometChatUIKit.conversationUpdateSettings != null &&
        !CometChatUIKit.conversationUpdateSettings!.messageReplies) {
      return true;
    } else if (message is CustomMessage &&
        (message.updateConversation == false) &&
        ((message.metadata?[UpdateSettingsConstant.incrementUnreadCount] ??
                false) ==
            false) &&
        (CometChatUIKit.conversationUpdateSettings?.customMessages == false)) {
      return true;
    } else {
      return false;
    }
  }

  // Check settings for call
  bool _checkCallSettings() {
    if (CometChatUIKit.conversationUpdateSettings != null) {
      return CometChatUIKit.conversationUpdateSettings!.callActivities;
    }
    return true;
  }

// Check settings for Group Actions
  bool _checkGroupSettings() {
    if (CometChatUIKit.conversationUpdateSettings != null) {
      return CometChatUIKit.conversationUpdateSettings!.groupActions;
    }
    return true;
  }
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}
