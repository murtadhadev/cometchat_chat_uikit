import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[CometChatConversationsWithMessagesController] is the view model for [CometChatConversationsWithMessages]
///it contains all the business logic involved in changing the state of the UI of [CometChatConversationsWithMessages]
class CometChatConversationsWithMessagesController extends GetxController
<<<<<<< HEAD
    with CometChatConversationEventListener, CometChatUIEventListener {
  CometChatConversationsWithMessagesController(
      {this.messageConfiguration, this.theme, this.startConversationConfiguration});
=======
    with
        CometChatConversationEventListener,
        CometChatUIEventListener,
        CometChatMessageEventListener {
  CometChatConversationsWithMessagesController(
      {this.messageConfiguration,
      this.theme,
      this.startConversationConfiguration});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[messageConfiguration] CometChatMessage configurations
  final MessageConfiguration? messageConfiguration;

  ///[messageConfiguration] CometChatMessage configurations
  final ContactsConfiguration? startConversationConfiguration;

  ///[theme] custom theme
  final CometChatTheme? theme;

  late String _dateString;

  late BuildContext context;
  //Class Variables------
  String conversationEventListenerId = "CWMConversationListener";

  //Class variables end-----

  @override
  void onInit() {
    super.onInit();
    _dateString = DateTime.now().millisecondsSinceEpoch.toString();

    conversationEventListenerId = "${_dateString}CWMMessageListener";
<<<<<<< HEAD
    CometChatConversationEvents.addConversationListListener(conversationEventListenerId, this);

    CometChatUIEvents.addUiListener(_dateString + conversationEventListenerId, this);
=======
    CometChatConversationEvents.addConversationListListener(
        conversationEventListenerId, this);

    CometChatUIEvents.addUiListener(
        _dateString + conversationEventListenerId, this);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

  @override
  void onClose() {
<<<<<<< HEAD
    CometChatConversationEvents.removeConversationListListener(conversationEventListenerId);
    CometChatUIEvents.removeUiListener(_dateString + conversationEventListenerId);
=======
    CometChatConversationEvents.removeConversationListListener(
        conversationEventListenerId);
    CometChatUIEvents.removeUiListener(
        _dateString + conversationEventListenerId);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    super.onClose();
  }

  @override
  void openChat(
    User? user,
    Group? group,
  ) {
    navigateToMessagesScreen(user: user, group: group);
  }

<<<<<<< HEAD
  void ccMessageForwarded(BaseMessage message, List<User>? usersSent, List<Group>? groupsSent, MessageStatus status) {
=======
  @override
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

  void onItemTap(Conversation conversation) {
    User? user;
    Group? group;
    if (conversation.conversationType == ReceiverTypeConstants.user) {
      user = (conversation.conversationWith as User);
    } else if (conversation.conversationType == ReceiverTypeConstants.group) {
      group = (conversation.conversationWith as Group);
    }

    navigateToMessagesScreen(user: user, group: group);
  }

<<<<<<< HEAD
  void navigateToMessagesScreen({User? user, Group? group, BuildContext? context, bool? pushReplacement}) {
    CometChatMessages cometChatMessages = CometChatMessages(
      key: ValueKey(user!.uid),
=======
  void navigateToMessagesScreen(
      {User? user,
      Group? group,
      BuildContext? context,
      bool? pushReplacement}) {
    CometChatMessages cometChatMessages = CometChatMessages(
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      user: user,
      group: group,
      theme: messageConfiguration?.theme ?? theme,
      messageComposerConfiguration:
<<<<<<< HEAD
          messageConfiguration?.messageComposerConfiguration ?? const MessageComposerConfiguration(),
      messageListConfiguration: messageConfiguration?.messageListConfiguration ?? const MessageListConfiguration(),
      onGifSelected: messageConfiguration?.onGifSelected,
      messageHeaderConfiguration:
          messageConfiguration?.messageHeaderConfiguration ?? const MessageHeaderConfiguration(),
      customSoundForIncomingMessagePackage: messageConfiguration?.customSoundForIncomingMessagePackage,
      customSoundForIncomingMessages: messageConfiguration?.customSoundForIncomingMessages,
      customSoundForOutgoingMessagePackage: messageConfiguration?.customSoundForOutgoingMessagePackage,
      customSoundForOutgoingMessages: messageConfiguration?.customSoundForOutgoingMessages,
=======
          messageConfiguration?.messageComposerConfiguration ??
              const MessageComposerConfiguration(),
      messageListConfiguration:
          messageConfiguration?.messageListConfiguration ??
              const MessageListConfiguration(),
      messageHeaderConfiguration:
          messageConfiguration?.messageHeaderConfiguration ??
              const MessageHeaderConfiguration(),
      customSoundForIncomingMessagePackage:
          messageConfiguration?.customSoundForIncomingMessagePackage,
      customSoundForIncomingMessages:
          messageConfiguration?.customSoundForIncomingMessages,
      customSoundForOutgoingMessagePackage:
          messageConfiguration?.customSoundForOutgoingMessagePackage,
      customSoundForOutgoingMessages:
          messageConfiguration?.customSoundForOutgoingMessages,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      detailsConfiguration: messageConfiguration?.detailsConfiguration,
      disableSoundForMessages: messageConfiguration?.disableSoundForMessages,
      disableTyping: messageConfiguration?.disableTyping ?? false,
      hideMessageComposer: messageConfiguration?.hideMessageComposer ?? false,
      hideMessageHeader: messageConfiguration?.hideMessageHeader,
      messageComposerView: messageConfiguration?.messageComposerView,
      messageHeaderView: messageConfiguration?.messageHeaderView,
      messageListView: messageConfiguration?.messageListView,
      messagesStyle: messageConfiguration?.messagesStyle,
<<<<<<< HEAD
      threadedMessagesConfiguration: messageConfiguration?.threadedMessagesConfiguration,
      hideDetails: messageConfiguration?.hideDetails,
    );
    Widget wdg;
    if (messageConfiguration?.wrapper != null) {
      wdg = messageConfiguration!.wrapper!(cometChatMessages, this.context);
    } else {
      wdg = cometChatMessages;
    }
=======
      threadedMessagesConfiguration:
          messageConfiguration?.threadedMessagesConfiguration,
      hideDetails: messageConfiguration?.hideDetails,
    );
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    if (pushReplacement == true) {
      Navigator.pushReplacement(
          context ?? this.context,
          MaterialPageRoute(
<<<<<<< HEAD
            builder: (context) => wdg,
=======
            builder: (context) => cometChatMessages,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          )).then((value) {
        if (value != null && value > 0) {
          Navigator.of(context ?? this.context).pop(value - 1);
        }
      });
    } else {
      Navigator.push(
          context ?? this.context,
          MaterialPageRoute(
<<<<<<< HEAD
            builder: (context) => wdg,
=======
            builder: (context) => cometChatMessages,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          )).then((value) {
        if (value != null && value > 0) {
          Navigator.of(context ?? this.context).pop(value - 1);
        }
      });
    }
  }

  void navigateToStartConversation({BuildContext? context}) {
    UsersConfiguration defaultUsersConfiguration = UsersConfiguration(
<<<<<<< HEAD
        usersRequestBuilder: RequestBuilderConstants.getDefaultUsersRequestBuilder()..hideBlockedUsers = true);

    GroupsConfiguration defaultGroupsConfiguration = GroupsConfiguration(
        groupsRequestBuilder: RequestBuilderConstants.getDefaultGroupsRequestBuilder()..joinedOnly = true);
=======
        usersRequestBuilder:
            RequestBuilderConstants.getDefaultUsersRequestBuilder()
              ..hideBlockedUsers = true);

    GroupsConfiguration defaultGroupsConfiguration = GroupsConfiguration(
        groupsRequestBuilder:
            RequestBuilderConstants.getDefaultGroupsRequestBuilder()
              ..joinedOnly = true);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    Navigator.push(
      context ?? this.context,
      MaterialPageRoute(
        builder: (context) => CometChatContacts(
          onItemTap: startConversationConfiguration?.onItemTap ??
              (BuildContext context, user, group) {
                if (user != null || group != null) {
<<<<<<< HEAD
                  navigateToMessagesScreen(user: user, group: group, pushReplacement: true);
=======
                  navigateToMessagesScreen(
                      user: user, group: group, pushReplacement: true);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                }
              },
          onClose: startConversationConfiguration?.onClose ??
              () {
                Navigator.of(context).pop();
              },
          closeIcon: startConversationConfiguration?.closeIcon ??
              Image.asset(
                AssetConstants.close,
                package: UIConstants.packageName,
                color: theme?.palette.getPrimary(),
              ),
          title: startConversationConfiguration?.title,
<<<<<<< HEAD
          usersConfiguration: startConversationConfiguration?.usersConfiguration?.merge(defaultUsersConfiguration) ??
              defaultUsersConfiguration,
          theme: startConversationConfiguration?.theme ?? theme,
          groupsConfiguration: startConversationConfiguration?.groupsConfiguration?.merge(defaultGroupsConfiguration) ??
              defaultGroupsConfiguration,
          groupsTabTitle: startConversationConfiguration?.groupsTabTitle ?? Translations.of(context).groups,
          contactsStyle: startConversationConfiguration?.contactsStyle ?? const ContactsStyle(),
          usersTabTitle: startConversationConfiguration?.usersTabTitle ?? Translations.of(context).users,
          hideSubmitIcon: startConversationConfiguration?.hideSubmitIcon ?? true,
          onSubmitIconTap: startConversationConfiguration?.onSubmitIconTap,
          selectionLimit: startConversationConfiguration?.selectionLimit,
          selectionMode: startConversationConfiguration?.selectionMode ?? SelectionMode.none,
          submitIcon: startConversationConfiguration?.submitIcon,
          tabVisibility: startConversationConfiguration?.tabVisibility ?? TabVisibility.usersAndGroups,
=======
          usersConfiguration: startConversationConfiguration?.usersConfiguration
                  ?.merge(defaultUsersConfiguration) ??
              defaultUsersConfiguration,
          theme: startConversationConfiguration?.theme ?? theme,
          groupsConfiguration: startConversationConfiguration
                  ?.groupsConfiguration
                  ?.merge(defaultGroupsConfiguration) ??
              defaultGroupsConfiguration,
          groupsTabTitle: startConversationConfiguration?.groupsTabTitle ??
              Translations.of(context).groups,
          contactsStyle: startConversationConfiguration?.contactsStyle ??
              const ContactsStyle(),
          usersTabTitle: startConversationConfiguration?.usersTabTitle ??
              Translations.of(context).users,
          hideSubmitIcon:
              startConversationConfiguration?.hideSubmitIcon ?? true,
          onSubmitIconTap: startConversationConfiguration?.onSubmitIconTap,
          selectionLimit: startConversationConfiguration?.selectionLimit,
          selectionMode: startConversationConfiguration?.selectionMode ??
              SelectionMode.none,
          submitIcon: startConversationConfiguration?.submitIcon,
          tabVisibility: startConversationConfiguration?.tabVisibility ??
              TabVisibility.usersAndGroups,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        ),
      ),
    );
  }
}
