import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[CometChatGroupsWithMessagesController] is the view model for [CometChatGroupsWithMessages]
///it contains all the business logic involved in changing the state of the UI of [CometChatGroupsWithMessages]
class CometChatGroupsWithMessagesController extends GetxController
<<<<<<< HEAD
    with CometChatGroupEventListener, CometChatMessageEventListener, CometChatUIEventListener {
=======
    with
        CometChatGroupEventListener,
        CometChatMessageEventListener,
        CometChatUIEventListener {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  CometChatGroupsWithMessagesController(
      {this.messageConfiguration,
      required this.theme,
      this.createGroupConfiguration,
      this.joinProtectedGroupConfiguration});

  ///[messageConfiguration] CometChatMessage configurations
  final MessageConfiguration? messageConfiguration;

  ///[theme] custom theme
  final CometChatTheme theme;

  ///[createGroupConfiguration] sets configuration for [CometChatCreateGroup]
  final CreateGroupConfiguration? createGroupConfiguration;

  ///[joinProtectedGroupConfiguration] sets configuration for [CometChatJoinProtectedGroup]
  final JoinProtectedGroupConfiguration? joinProtectedGroupConfiguration;

  late String _dateString;
  late String _groupsEventListenerId;
  late String _messageEventListenerId;

  late BuildContext context;

  @override
  void onInit() {
    super.onInit();
    _dateString = DateTime.now().millisecondsSinceEpoch.toString();
    _groupsEventListenerId = "${_dateString}GWMGroupListener";
    _messageEventListenerId = "${_dateString}GWMGMessageListener";
    CometChatGroupEvents.addGroupsListener(_groupsEventListenerId, this);
    CometChatMessageEvents.addMessagesListener(_messageEventListenerId, this);
    CometChatUIEvents.addUiListener(_groupsEventListenerId, this);
  }

  @override
  void onClose() {
    super.onClose();
    CometChatGroupEvents.removeGroupsListener(_groupsEventListenerId);
    CometChatMessageEvents.removeMessagesListener(_messageEventListenerId);
    CometChatUIEvents.removeUiListener(_groupsEventListenerId);
  }

  void onItemTap(BuildContext context, Group group) {
    if (group.hasJoined) {
      navigateToMessagesScreen(group: group);
    } else if (group.type == GroupTypeConstants.password) {
      navigateToJoinProtectedGroupScreen(group: group);
    } else if (group.type == GroupTypeConstants.public) {
      _joinGroup(guid: group.guid, groupType: group.type);
    }
  }

  @override
  void ccGroupMemberJoined(User joinedUser, Group joinedGroup) async {
    User? loggedInUser = await CometChat.getLoggedInUser();
    if (joinedUser.uid == loggedInUser?.uid) {
      navigateToMessagesScreen(group: joinedGroup);
    }
  }

  @override
  void ccGroupCreated(Group group) {
    navigateToMessagesScreen(group: group);
  }

  @override
<<<<<<< HEAD
  void ccMessageForwarded(BaseMessage message, List<User>? usersSent, List<Group>? groupsSent, MessageStatus status) {
=======
  void ccMessageForwarded(BaseMessage message, List<User>? usersSent,
      List<Group>? groupsSent, MessageStatus status) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (status == MessageStatus.inProgress) return;

    if (((usersSent?.length ?? 0) + (groupsSent?.length ?? 0)) == 1) {
      if (usersSent != null && usersSent.isNotEmpty) {
        navigateToMessagesScreen(user: usersSent[0]);
      } else {
        navigateToMessagesScreen(group: groupsSent![0]);
      }
    }
  }

  @override
  void openChat(User? user, Group? group) {
    navigateToMessagesScreen(user: user, group: group);
  }

<<<<<<< HEAD
  void navigateToMessagesScreen({User? user, Group? group, BuildContext? context}) {
=======
  void navigateToMessagesScreen(
      {User? user, Group? group, BuildContext? context}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    Navigator.push(
        context ?? this.context,
        MaterialPageRoute(
            builder: (context) => CometChatMessages(
                  group: group,
                  user: user,
                  messageComposerConfiguration:
<<<<<<< HEAD
                      messageConfiguration?.messageComposerConfiguration ?? const MessageComposerConfiguration(),
                  messageListConfiguration:
                      messageConfiguration?.messageListConfiguration ?? const MessageListConfiguration(),
                  messageHeaderConfiguration:
                      messageConfiguration?.messageHeaderConfiguration ?? const MessageHeaderConfiguration(),
                  customSoundForIncomingMessagePackage: messageConfiguration?.customSoundForIncomingMessagePackage,
                  customSoundForIncomingMessages: messageConfiguration?.customSoundForIncomingMessages,
                  customSoundForOutgoingMessagePackage: messageConfiguration?.customSoundForOutgoingMessagePackage,
                  customSoundForOutgoingMessages: messageConfiguration?.customSoundForOutgoingMessages,
                  detailsConfiguration: messageConfiguration?.detailsConfiguration,
                  disableSoundForMessages: messageConfiguration?.disableSoundForMessages,
                  disableTyping: messageConfiguration?.disableTyping ?? false,
                  hideMessageComposer: messageConfiguration?.hideMessageComposer ?? false,
                  hideMessageHeader: messageConfiguration?.hideMessageHeader,
                  messageComposerView: messageConfiguration?.messageComposerView,
=======
                      messageConfiguration?.messageComposerConfiguration ??
                          const MessageComposerConfiguration(),
                  messageListConfiguration:
                      messageConfiguration?.messageListConfiguration ??
                          const MessageListConfiguration(),
                  messageHeaderConfiguration:
                      messageConfiguration?.messageHeaderConfiguration ??
                          const MessageHeaderConfiguration(),
                  customSoundForIncomingMessagePackage: messageConfiguration
                      ?.customSoundForIncomingMessagePackage,
                  customSoundForIncomingMessages:
                      messageConfiguration?.customSoundForIncomingMessages,
                  customSoundForOutgoingMessagePackage: messageConfiguration
                      ?.customSoundForOutgoingMessagePackage,
                  customSoundForOutgoingMessages:
                      messageConfiguration?.customSoundForOutgoingMessages,
                  detailsConfiguration:
                      messageConfiguration?.detailsConfiguration,
                  disableSoundForMessages:
                      messageConfiguration?.disableSoundForMessages,
                  disableTyping: messageConfiguration?.disableTyping ?? false,
                  hideMessageComposer:
                      messageConfiguration?.hideMessageComposer ?? false,
                  hideMessageHeader: messageConfiguration?.hideMessageHeader,
                  messageComposerView:
                      messageConfiguration?.messageComposerView,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                  messageHeaderView: messageConfiguration?.messageHeaderView,
                  messageListView: messageConfiguration?.messageListView,
                  messagesStyle: messageConfiguration?.messagesStyle,
                  theme: messageConfiguration?.theme ?? theme,
<<<<<<< HEAD
                  threadedMessagesConfiguration: messageConfiguration?.threadedMessagesConfiguration,
=======
                  threadedMessagesConfiguration:
                      messageConfiguration?.threadedMessagesConfiguration,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                  hideDetails: messageConfiguration?.hideDetails,
                ))).then((value) {
      if (value != null && value > 0) {
        Navigator.of(context ?? this.context).pop(value - 1);
      }
    });
  }

<<<<<<< HEAD
  void navigateToJoinProtectedGroupScreen({required Group group, BuildContext? context}) {
=======
  void navigateToJoinProtectedGroupScreen(
      {required Group group, BuildContext? context}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    Navigator.push(
        context ?? this.context,
        MaterialPageRoute(
            builder: (context) => CometChatJoinProtectedGroup(
                  group: group,
                  onJoinTap: joinProtectedGroupConfiguration?.onJoinTap,
                  closeIcon: joinProtectedGroupConfiguration?.closeIcon,
                  joinIcon: joinProtectedGroupConfiguration?.joinIcon,
<<<<<<< HEAD
                  passwordPlaceholderText: joinProtectedGroupConfiguration?.passwordPlaceholderText,
                  ctheme: joinProtectedGroupConfiguration?.theme ?? theme,
                  onError: joinProtectedGroupConfiguration?.onError,
                  title: joinProtectedGroupConfiguration?.title,
                  description: joinProtectedGroupConfiguration?.description,
                  joinProtectedGroupStyle: joinProtectedGroupConfiguration?.joinProtectedGroupStyle,
                  onBack: joinProtectedGroupConfiguration?.onBack,
                  errorStateText: joinProtectedGroupConfiguration?.errorStateText,
=======
                  passwordPlaceholderText:
                      joinProtectedGroupConfiguration?.passwordPlaceholderText,
                  theme: joinProtectedGroupConfiguration?.theme ?? theme,
                  onError: joinProtectedGroupConfiguration?.onError,
                  title: joinProtectedGroupConfiguration?.title,
                  description: joinProtectedGroupConfiguration?.description,
                  joinProtectedGroupStyle:
                      joinProtectedGroupConfiguration?.joinProtectedGroupStyle,
                  onBack: joinProtectedGroupConfiguration?.onBack,
                  errorStateText:
                      joinProtectedGroupConfiguration?.errorStateText,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                )));
  }

  void navigateCreateGroup() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CometChatCreateGroup(
                  createGroupStyle: CreateGroupStyle(
<<<<<<< HEAD
                      titleTextStyle: createGroupConfiguration?.createGroupStyle?.titleTextStyle,
                      selectedTabColor: createGroupConfiguration?.createGroupStyle?.selectedTabColor,
                      selectedTabTextStyle: createGroupConfiguration?.createGroupStyle?.selectedTabTextStyle,
                      tabTextStyle: createGroupConfiguration?.createGroupStyle?.tabTextStyle,
                      closeIconTint: createGroupConfiguration?.createGroupStyle?.closeIconTint,
                      createIconTint: createGroupConfiguration?.createGroupStyle?.createIconTint,
                      tabColor: createGroupConfiguration?.createGroupStyle?.tabColor,
                      background: createGroupConfiguration?.createGroupStyle?.background,
                      borderColor: createGroupConfiguration?.createGroupStyle?.borderColor,
                      border: createGroupConfiguration?.createGroupStyle?.border,
                      borderRadius: createGroupConfiguration?.createGroupStyle?.borderRadius,
                      gradient: createGroupConfiguration?.createGroupStyle?.gradient,
                      height: createGroupConfiguration?.createGroupStyle?.height,
                      namePlaceholderTextStyle: createGroupConfiguration?.createGroupStyle?.namePlaceholderTextStyle,
                      nameInputTextStyle: createGroupConfiguration?.createGroupStyle?.nameInputTextStyle,
                      passwordPlaceholderTextStyle:
                          createGroupConfiguration?.createGroupStyle?.passwordPlaceholderTextStyle,
                      passwordInputTextStyle: createGroupConfiguration?.createGroupStyle?.passwordInputTextStyle,
=======
                      titleTextStyle: createGroupConfiguration
                          ?.createGroupStyle?.titleTextStyle,
                      selectedTabColor: createGroupConfiguration
                          ?.createGroupStyle?.selectedTabColor,
                      selectedTabTextStyle: createGroupConfiguration
                          ?.createGroupStyle?.selectedTabTextStyle,
                      tabTextStyle: createGroupConfiguration
                          ?.createGroupStyle?.tabTextStyle,
                      closeIconTint: createGroupConfiguration
                          ?.createGroupStyle?.closeIconTint,
                      createIconTint: createGroupConfiguration
                          ?.createGroupStyle?.createIconTint,
                      tabColor:
                          createGroupConfiguration?.createGroupStyle?.tabColor,
                      background: createGroupConfiguration
                          ?.createGroupStyle?.background,
                      borderColor: createGroupConfiguration
                          ?.createGroupStyle?.borderColor,
                      border:
                          createGroupConfiguration?.createGroupStyle?.border,
                      borderRadius: createGroupConfiguration
                          ?.createGroupStyle?.borderRadius,
                      gradient:
                          createGroupConfiguration?.createGroupStyle?.gradient,
                      height:
                          createGroupConfiguration?.createGroupStyle?.height,
                      namePlaceholderTextStyle: createGroupConfiguration
                          ?.createGroupStyle?.namePlaceholderTextStyle,
                      nameInputTextStyle: createGroupConfiguration
                          ?.createGroupStyle?.nameInputTextStyle,
                      passwordPlaceholderTextStyle: createGroupConfiguration
                          ?.createGroupStyle?.passwordPlaceholderTextStyle,
                      passwordInputTextStyle: createGroupConfiguration
                          ?.createGroupStyle?.passwordInputTextStyle,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                      width: createGroupConfiguration?.createGroupStyle?.width),
                  createIcon: createGroupConfiguration?.createIcon,
                  theme: createGroupConfiguration?.theme ?? theme,
                  title: createGroupConfiguration?.title,
<<<<<<< HEAD
                  namePlaceholderText: createGroupConfiguration?.namePlaceholderText,
                  closeIcon: createGroupConfiguration?.closeIcon,
                  disableCloseButton: createGroupConfiguration?.disableCloseButton,
                  onCreateTap: createGroupConfiguration?.onCreateTap,
                  onBack: createGroupConfiguration?.onBack,
                  onError: createGroupConfiguration?.onError,
                  passwordPlaceholderText: createGroupConfiguration?.passwordPlaceholderText,
                )));
  }

  _joinGroup({required String guid, required String groupType, String password = ""}) {
=======
                  namePlaceholderText:
                      createGroupConfiguration?.namePlaceholderText,
                  closeIcon: createGroupConfiguration?.closeIcon,
                  disableCloseButton:
                      createGroupConfiguration?.disableCloseButton,
                  onCreateTap: createGroupConfiguration?.onCreateTap,
                  onBack: createGroupConfiguration?.onBack,
                  onError: createGroupConfiguration?.onError,
                  passwordPlaceholderText:
                      createGroupConfiguration?.passwordPlaceholderText,
                )));
  }

  _joinGroup(
      {required String guid, required String groupType, String password = ""}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    showLoadingIndicatorDialog(context,
        background: theme.palette.getBackground(),
        progressIndicatorColor: theme.palette.getPrimary(),
        shadowColor: theme.palette.getAccent300());

<<<<<<< HEAD
    CometChat.joinGroup(guid, groupType, password: password, onSuccess: (Group group) async {
=======
    CometChat.joinGroup(guid, groupType, password: password,
        onSuccess: (Group group) async {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      User? user = await CometChat.getLoggedInUser();
      if (kDebugMode) {
        debugPrint("Group Joined Successfully : $group ");
      }

      if (context.mounted) {
        Navigator.pop(context); //pop loading dialog
      }

      //ToDo: remove after sdk issue solve
      if (group.hasJoined == false) {
        group.hasJoined = true;
      }

      CometChatGroupEvents.ccGroupMemberJoined(user!, group);
    },
        onError: joinProtectedGroupConfiguration?.onError ??
            (CometChatException e) {
              Navigator.pop(context); //pop loading dialog

              showCometChatConfirmDialog(
                  context: context,
                  style: ConfirmDialogStyle(
<<<<<<< HEAD
                      backgroundColor: theme.palette.mode == PaletteThemeModes.light
                          ? theme.palette.getBackground()
                          : Color.alphaBlend(theme.palette.getAccent200(), theme.palette.getBackground()),
=======
                      backgroundColor:
                          theme.palette.mode == PaletteThemeModes.light
                              ? theme.palette.getBackground()
                              : Color.alphaBlend(theme.palette.getAccent200(),
                                  theme.palette.getBackground()),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                      shadowColor: theme.palette.getAccent300(),
                      confirmButtonTextStyle: TextStyle(
                          fontSize: theme.typography.text2.fontSize,
                          fontWeight: theme.typography.text2.fontWeight,
                          color: theme.palette.getPrimary())),
<<<<<<< HEAD
                  title: Text(Translations.of(context).something_went_wrong_error,
=======
                  title: Text(Translations.of(context).somethingWentWrongError,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                      style: TextStyle(
                          fontSize: theme.typography.name.fontSize,
                          fontWeight: theme.typography.name.fontWeight,
                          color: theme.palette.getAccent(),
                          fontFamily: theme.typography.name.fontFamily)),
                  confirmButtonText: Translations.of(context).okay,
                  onConfirm: () {
                    Navigator.pop(context); //pop confirm dialog
                  });
            });
  }
}
