import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../cometchat_chat_uikit.dart';

///[CometChatConversationsWithMessages] is a component that is composed of [CometChatConversations] and [CometChatMessages] component
///
/// it is a wrapper component which provides functionality to open the [CometChatMessages] module with a click of any conversation shown in the list of conversations.
///
/// ```dart
///     CometChatConversationsWithMessages(
///       user: User(
///           uid: 'superhero2',
///           name: 'Captain America',
///           avatar:
///               'https://data-us.cometchat.io/assets/images/avatars/captainamerica.png',
///           ),
///       group: Group(
///         guid: 'guid',
///         name: 'group name',
///         type: 'group type'
///       ),
///       conversationsConfiguration: ConversationsConfiguration(
///           conversationsRequestBuilder: ConversationsRequestBuilder(),
///           conversationsStyle: ConversationsStyle(),
///           listItemStyle: ListItemStyle()),
///       messageConfiguration: MessageConfiguration(
///           messageHeaderConfiguration:
///               MessageHeaderConfiguration(),
///           messageListConfiguration:
///               MessageListConfiguration(),
///           messageComposerConfiguration:
///               MessageComposerConfiguration(),
///           detailsConfiguration:
///               DetailsConfiguration(),
///           messagesStyle: MessagesStyle()),
///       theme: CometChatTheme(
///           palette: Palette(),
///           typography: Typography()),
///     )
/// ```
///
class CometChatConversationsWithMessages extends StatefulWidget {
  const CometChatConversationsWithMessages({
<<<<<<< HEAD
    Key? key,
=======
    super.key,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    this.user,
    this.group,
    this.theme,
    this.conversationsConfiguration,
    this.messageConfiguration,
    this.startConversationConfiguration,
<<<<<<< HEAD
    this.emitController,
    this.onFetchUser,
  }) : super(key: key);
=======
  });
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[user] if null will return [CometChatConversations] screen else will navigate to [CometChatMessages]
  final User? user;

  ///[group] if null will return [CometChatConversations] screen else will navigate to [CometChatMessages]
  final Group? group;

  ///[theme] can pass custom theme
  final CometChatTheme? theme;

  ///[conversationsConfiguration] CometChatConversation configurations
  final ConversationsConfiguration? conversationsConfiguration;

  ///[messageConfiguration] CometChatMessage configurations
  final MessageConfiguration? messageConfiguration;

  ///[startConversationConfiguration] CometChatMessage start conversation configuration
  final ContactsConfiguration? startConversationConfiguration;

<<<<<<< HEAD
  final FetchUser? onFetchUser;

  final Function(CometChatConversationsWithMessagesController controller, User? user)? emitController;

  @override
  State<CometChatConversationsWithMessages> createState() => _CometChatConversationsWithMessagesState();
}

class _CometChatConversationsWithMessagesState extends State<CometChatConversationsWithMessages> {
  late CometChatConversationsWithMessagesController _cometChatConversationsWithMessagesController;
=======
  @override
  State<CometChatConversationsWithMessages> createState() =>
      _CometChatConversationsWithMessagesState();
}

class _CometChatConversationsWithMessagesState
    extends State<CometChatConversationsWithMessages> {
  late CometChatConversationsWithMessagesController
      _cometChatConversationsWithMessagesController;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  late CometChatTheme _theme;

  //initialization methods
  @override
  void initState() {
    super.initState();
    _theme = widget.theme ?? cometChatTheme;
<<<<<<< HEAD
    _cometChatConversationsWithMessagesController = CometChatConversationsWithMessagesController(
=======
    _cometChatConversationsWithMessagesController =
        CometChatConversationsWithMessagesController(
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      theme: _theme,
      messageConfiguration: widget.messageConfiguration,
      startConversationConfiguration: widget.startConversationConfiguration,
    );
<<<<<<< HEAD
    widget.emitController!(_cometChatConversationsWithMessagesController, widget.user);
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (widget.user != null || widget.group != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _cometChatConversationsWithMessagesController.navigateToMessagesScreen(
            user: widget.user, group: widget.group, context: context);
      });
    }
  }

  @override
  void dispose() {
    _cometChatConversationsWithMessagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: _cometChatConversationsWithMessagesController,
        global: false,
<<<<<<< HEAD
        dispose: (GetBuilderState<CometChatConversationsWithMessagesController> state) => state.controller?.onClose(),
        builder: (CometChatConversationsWithMessagesController conversationsWithMessagesController) {
          conversationsWithMessagesController.context = context;
          return CometChatConversations(
            conversationsProtocol: widget.conversationsConfiguration?.conversationsProtocol,
            conversationsRequestBuilder: widget.conversationsConfiguration?.conversationsRequestBuilder,
            activateSelection: widget.conversationsConfiguration?.activateSelection,
            userFilter: widget.conversationsConfiguration?.userFilter,
            onFetchUser: widget.onFetchUser,
=======
        dispose: (GetBuilderState<CometChatConversationsWithMessagesController>
                state) =>
            state.controller?.onClose(),
        builder: (CometChatConversationsWithMessagesController
            conversationsWithMessagesController) {
          conversationsWithMessagesController.context = context;
          return CometChatConversations(
            conversationsProtocol:
                widget.conversationsConfiguration?.conversationsProtocol,
            conversationsRequestBuilder:
                widget.conversationsConfiguration?.conversationsRequestBuilder,
            activateSelection:
                widget.conversationsConfiguration?.activateSelection,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            appBarOptions: widget.conversationsConfiguration?.appBarOptions ??
                [
                  IconButton(
                    onPressed: () {
<<<<<<< HEAD
                      conversationsWithMessagesController.navigateToStartConversation(context: context);
=======
                      conversationsWithMessagesController
                          .navigateToStartConversation(context: context);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                    },
                    icon: Image.asset(
                      AssetConstants.write,
                      package: UIConstants.packageName,
                      color: _theme.palette.getPrimary(),
                    ),
                  ),
                ],
            controller: widget.conversationsConfiguration?.controller,
            hideError: widget.conversationsConfiguration?.hideError,
            stateCallBack: widget.conversationsConfiguration?.stateCallBack,
<<<<<<< HEAD
            showBackButton: widget.conversationsConfiguration?.showBackButton ?? true,
            ctheme: widget.conversationsConfiguration?.theme ?? _theme,
=======
            showBackButton:
                widget.conversationsConfiguration?.showBackButton ?? true,
            theme: widget.conversationsConfiguration?.theme ?? _theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            title: widget.conversationsConfiguration?.title,
            subtitleView: widget.conversationsConfiguration?.subtitleView,
            backButton: widget.conversationsConfiguration?.backButton,
            avatarStyle: widget.conversationsConfiguration?.avatarStyle,
<<<<<<< HEAD
            customSoundForMessages: widget.conversationsConfiguration?.customSoundForMessages,
            disableSoundForMessages: widget.conversationsConfiguration?.disableSoundForMessages ?? false,
            disableReceipt: widget.conversationsConfiguration?.disableReceipt,
            disableUsersPresence: widget.conversationsConfiguration?.disableUsersPresence,
=======
            customSoundForMessages:
                widget.conversationsConfiguration?.customSoundForMessages,
            disableSoundForMessages:
                widget.conversationsConfiguration?.disableSoundForMessages ??
                    false,
            disableReceipt: widget.conversationsConfiguration?.disableReceipt,
            disableUsersPresence:
                widget.conversationsConfiguration?.disableUsersPresence,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            datePattern: widget.conversationsConfiguration?.datePattern,
            dateStyle: widget.conversationsConfiguration?.dateStyle,
            deliveredIcon: widget.conversationsConfiguration?.deliveredIcon,
            emptyStateText: widget.conversationsConfiguration?.emptyStateText,
            emptyStateView: widget.conversationsConfiguration?.emptyStateView,
            errorStateText: widget.conversationsConfiguration?.errorStateText,
            errorStateView: widget.conversationsConfiguration?.errorStateView,
            hideSeparator: widget.conversationsConfiguration?.hideSeparator,
            listItemStyle: widget.conversationsConfiguration?.listItemStyle,
            listItemView: widget.conversationsConfiguration?.listItemView,
<<<<<<< HEAD
            loadingStateText: widget.conversationsConfiguration?.loadingStateText,
            onSelection: widget.conversationsConfiguration?.onSelection,
            options: widget.conversationsConfiguration?.options,
            privateGroupIcon: widget.conversationsConfiguration?.privateGroupIcon,
            protectedGroupIcon: widget.conversationsConfiguration?.protectedGroupIcon,
            readIcon: widget.conversationsConfiguration?.readIcon,
            selectionMode: widget.conversationsConfiguration?.selectionMode,
            sentIcon: widget.conversationsConfiguration?.sentIcon,
            statusIndicatorStyle: widget.conversationsConfiguration?.statusIndicatorStyle,
            badgeStyle: widget.conversationsConfiguration?.badgeStyle,
            receiptStyle: widget.conversationsConfiguration?.receiptStyle,
            tailView: widget.conversationsConfiguration?.tailView,
            typingIndicatorText: widget.conversationsConfiguration?.typingIndicatorText,
            conversationsStyle: widget.conversationsConfiguration?.conversationsStyle ?? const ConversationsStyle(),
            onBack: widget.conversationsConfiguration?.onBack,
            onError: widget.conversationsConfiguration?.onError,
            onItemTap: widget.conversationsConfiguration?.onItemTap ?? conversationsWithMessagesController.onItemTap,
            onItemLongPress: widget.conversationsConfiguration?.onItemLongPress,
            disableTyping: widget.conversationsConfiguration?.disableTyping,
            deleteConversationDialogStyle: widget.conversationsConfiguration?.deleteConversationDialogStyle,
            hideAppbar: widget.conversationsConfiguration?.hideAppbar,
=======
            loadingStateText:
                widget.conversationsConfiguration?.loadingStateText,
            onSelection: widget.conversationsConfiguration?.onSelection,
            options: widget.conversationsConfiguration?.options,
            privateGroupIcon:
                widget.conversationsConfiguration?.privateGroupIcon,
            protectedGroupIcon:
                widget.conversationsConfiguration?.protectedGroupIcon,
            readIcon: widget.conversationsConfiguration?.readIcon,
            selectionMode: widget.conversationsConfiguration?.selectionMode,
            sentIcon: widget.conversationsConfiguration?.sentIcon,
            statusIndicatorStyle:
                widget.conversationsConfiguration?.statusIndicatorStyle,
            badgeStyle: widget.conversationsConfiguration?.badgeStyle,
            receiptStyle: widget.conversationsConfiguration?.receiptStyle,
            tailView: widget.conversationsConfiguration?.tailView,
            typingIndicatorText:
                widget.conversationsConfiguration?.typingIndicatorText,
            conversationsStyle:
                widget.conversationsConfiguration?.conversationsStyle ??
                    const ConversationsStyle(),
            onBack: widget.conversationsConfiguration?.onBack,
            onError: widget.conversationsConfiguration?.onError,
            onItemTap: widget.conversationsConfiguration?.onItemTap ??
                conversationsWithMessagesController.onItemTap,
            onItemLongPress: widget.conversationsConfiguration?.onItemLongPress,
            disableTyping: widget.conversationsConfiguration?.disableTyping,
            deleteConversationDialogStyle: widget
                .conversationsConfiguration?.deleteConversationDialogStyle,
            hideAppbar: widget.conversationsConfiguration?.hideAppbar,
            disableMentions: widget.conversationsConfiguration?.disableMentions,
            textFormatters: widget.conversationsConfiguration?.textFormatters,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          );
        });
  }
}
