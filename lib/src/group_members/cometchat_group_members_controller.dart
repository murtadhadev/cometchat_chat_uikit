import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../cometchat_chat_uikit.dart';
import '../../cometchat_chat_uikit.dart' as cc;

///[CometChatGroupMembersController] is the view model for [CometChatGroupMembers]
///it contains all the business logic involved in changing the state of the UI of [CometChatGroupMembers]
class CometChatGroupMembersController
    extends CometChatSearchListController<GroupMember, String>
    with
        CometChatSelectable,
        GroupListener,
        UserListener,
        CometChatGroupEventListener
    implements CometChatGroupMembersControllerProtocol {
  //Class members
  late GroupMembersBuilderProtocol groupMembersBuilderProtocol;
  late String dateStamp;
  late String groupSDKListenerID;
  late String userSDKListenerID;
  late String groupUIListenerID;
  final Group group;
  CometChatTheme? theme;
  bool hideUserPresence = true;
  User? loggedInUser;
  bool? isOwner;
  Conversation? _conversation;

  String? _conversationId;

  //Constructor
  CometChatGroupMembersController(
      {required this.groupMembersBuilderProtocol,
      required this.group,
      SelectionMode? mode,
      bool? hideUserPresence,
      required CometChatTheme theme,
      super.onError})
      : super(builderProtocol: groupMembersBuilderProtocol) {
    this.hideUserPresence = hideUserPresence ?? true;
    selectionMode = mode ?? SelectionMode.none;
    dateStamp = DateTime.now().microsecondsSinceEpoch.toString();
    groupSDKListenerID = "${dateStamp}groupMembers_listener";
    userSDKListenerID = "${dateStamp}user_listener";
    groupUIListenerID = "${dateStamp}_ui_group_listener";
  }

//initialization functions
  @override
  void onInit() {
    CometChat.addGroupListener(groupSDKListenerID, this);
    CometChatGroupEvents.addGroupsListener(groupUIListenerID, this);

    if (hideUserPresence == false) {
      //Adding listener when presence is needed
      CometChat.addUserListener(userSDKListenerID, this);
    }
    initializeInternalDependencies();
    super.onInit();
  }

  void initializeInternalDependencies() async {
    _conversation ??= (await CometChat.getConversation(
        group.guid, ConversationType.group, onSuccess: (conversation) {
      if (conversation.lastMessage != null) {}
    }, onError: (_) {}));
    _conversationId ??= _conversation?.conversationId;
  }

  @override
  void onClose() {
    CometChat.removeGroupListener(groupSDKListenerID);
    CometChatGroupEvents.removeGroupsListener(groupUIListenerID);
    if (hideUserPresence == false) {
      CometChat.removeUserListener(userSDKListenerID);
    }

    super.onClose();
  }

  //------------------User SDK Listeners------------------
  @override
  void onUserOffline(User user) {
    int matchingIndex = getMatchingIndexFromKey(user.uid);
    if (matchingIndex != -1) {
      list[matchingIndex].status = user.status;
      update();
    }
  }

  @override
  void onUserOnline(User user) {
    int matchingIndex = getMatchingIndexFromKey(user.uid);
    if (matchingIndex != -1) {
      list[matchingIndex].status = user.status;
      update();
    }
  }

  //------------------Group SDK Listeners------------------
  @override
  void onGroupMemberScopeChanged(
      cc.Action action,
      User updatedBy,
      User updatedUser,
      String scopeChangedTo,
      String scopeChangedFrom,
      Group group) {
    if (group.guid == this.group.guid) {
      updateElement(updatedUser as GroupMember);
    }
  }

  GroupMember? getGroupMemberFromUser(User user) {
    try {
      return list.firstWhereOrNull((element) => element.uid == user.uid);
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error in getGroupMemberFromUser: $e');
      }
      return null;
    }
  }

  @override
  void onGroupMemberKicked(
      cc.Action action, User kickedUser, User kickedBy, Group kickedFrom) {
    if (kickedFrom.guid == group.guid) {
      GroupMember? member = getGroupMemberFromUser(kickedUser);
      if (member != null) {
        removeElement(member);
      }
    }
  }

  @override
  void onGroupMemberLeft(cc.Action action, User leftUser, Group leftGroup) {
    if (leftGroup.guid == group.guid) {
      GroupMember? member = getGroupMemberFromUser(leftUser);
      if (member != null) {
        removeElement(member);
      }
    }
  }

  @override
  void onGroupMemberBanned(
      cc.Action action, User bannedUser, User bannedBy, Group bannedFrom) {
    if (bannedFrom.guid == group.guid) {
      GroupMember? member = getGroupMemberFromUser(bannedUser);
      if (member != null) {
        removeElement(member);
      }
    }
  }

  @override
  void onGroupMemberJoined(
      cc.Action action, User joinedUser, Group joinedGroup) {
    if (joinedGroup.guid == group.guid) {
      addElement(joinedUser as GroupMember);
    }
  }

  @override
  void onMemberAddedToGroup(
      cc.Action action, User addedby, User userAdded, Group addedTo) {
    if (addedTo.guid == group.guid) {
      addElement(addedTo as GroupMember);
    }
  }

  Future<void> changeScope(
      Group group, GroupMember member, String newScope, String oldScope) async {
    await CometChat.updateGroupMemberScope(
        guid: group.guid,
        uid: member.uid,
        scope: newScope,
        onSuccess: (String res) {
          member.scope = newScope;
          CometChatGroupEvents.ccGroupMemberScopeChanged(
              cc.Action(
                conversationId: _conversationId!,
                message: "${loggedInUser?.name} made ${member.name} $newScope",
                oldScope: oldScope,
                newScope: newScope,
                muid: DateTime.now().microsecondsSinceEpoch.toString(),
                sender: loggedInUser!,
                receiverUid: group.guid,
                type: MessageTypeConstants.groupActions,
                receiverType: ReceiverTypeConstants.group,
                parentMessageId: 0,
              ),
              member,
              newScope,
              oldScope,
              group);
          updateElement(member);
        },
        onError: onError);
  }

  @override
  ccGroupMemberAdded(List<cc.Action> messages, List<User> usersAdded,
      Group groupAddedIn, User addedBy) {
    if (groupAddedIn.guid == group.guid) {
      for (User user in usersAdded) {
        addElement(user as GroupMember);
      }
    }
  }

  @override
  ccOwnershipChanged(Group group, GroupMember newOwner) {
    if (group.guid == group.guid) {
      updateElement(newOwner);
    }
  }

  //CometChatListController override  functions
  @override
  bool match(GroupMember elementA, GroupMember elementB) {
    return elementA.uid == elementB.uid;
  }

  @override
  String getKey(GroupMember element) {
    return element.uid;
  }

  @override
  loadMoreElements({bool Function(GroupMember element)? isIncluded}) async {
    if (loggedInUser == null) {
      loggedInUser = await CometChat.getLoggedInUser();
      if (loggedInUser?.uid == group.owner) {
        isOwner = true;
      }
    }

    await super.loadMoreElements(isIncluded: isIncluded);
  }

  //default functions
  @override
  List<CometChatOption> defaultFunction(Group group, GroupMember member) {
    List<CometChatOption> optionList = [];
    List<CometChatGroupMemberOption> groupMemberOptions = [];
    debugPrint('group member controller is -> ${loggedInUser?.name}');

    groupMemberOptions = DetailUtils.getDefaultGroupMemberOptions(
        loggedInUser: loggedInUser, group: group, member: member, theme: theme);

    for (CometChatGroupMemberOption option in groupMemberOptions) {
      optionList.add(CometChatOption(
          id: option.id,
          icon: option.icon,
          packageName: option.packageName,
          backgroundColor: option.backgroundColor,
          onClick: _getOptionFunctionality(option.id, group, member)));
    }

    return optionList;
  }

  dynamic Function()? _getOptionFunctionality(
      String optionId, Group group, GroupMember member) {
    switch (optionId) {
      case GroupMemberOptionConstants.ban:
        return () async {
          CometChat.banGroupMember(
              guid: group.guid,
              uid: member.uid,
              onSuccess: (String result) async {
                group.membersCount--;
                CometChatGroupEvents.ccGroupMemberBanned(
                    cc.Action(
                      conversationId: _conversationId!,
                      message: "${loggedInUser?.name} banned ${member.name}",
                      oldScope: GroupMemberScope.participant,
                      newScope: '',
                      muid: DateTime.now().microsecondsSinceEpoch.toString(),
                      sender: loggedInUser!,
                      receiver: group,
                      receiverUid: group.guid,
                      type: MessageTypeConstants.groupActions,
                      receiverType: ReceiverTypeConstants.group,
                      parentMessageId: 0,
                    ),
                    member,
                    loggedInUser!,
                    group);
                removeElement(member);
              },
              onError: onError);
        };
      case GroupMemberOptionConstants.kick:
        return () async {
          CometChat.kickGroupMember(
              guid: group.guid,
              uid: member.uid,
              onSuccess: (String result) async {
                group.membersCount--;
                CometChatGroupEvents.ccGroupMemberKicked(
                    cc.Action(
                      conversationId: _conversationId!,
                      message: '${loggedInUser?.name} kicked ${member.name}',
                      oldScope: GroupMemberScope.participant,
                      newScope: '',
                      muid: DateTime.now().microsecondsSinceEpoch.toString(),
                      sender: loggedInUser!,
                      receiver: group,
                      receiverUid: group.guid,
                      type: MessageTypeConstants.groupActions,
                      receiverType: ReceiverTypeConstants.group,
                      parentMessageId: 0,
                    ),
                    member,
                    loggedInUser!,
                    group);
                removeElement(member);
              },
              onError: onError);
        };
      default:
        return null;
    }
  }
}
