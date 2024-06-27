import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../cometchat_chat_uikit.dart';
import '../../../cometchat_chat_uikit.dart' as cc;

///[CometChatConversations] is a component that shows all conversations involving the logged in user with the help of [CometChatListBase] and [CometChatListItem]
///By default, for each conversation that will be listed, the name of the user or group the logged in user is having conversation with will be displayed in the title of every list item,
///the subtitle will contain the last message in that conversation along with its receipt status, the leading view will contain the avatars of the user and groups and
///status indicator will indicate if users are online and icons for indicating a private or password protected group,
///and the trailing view will contain the time of the last message in that conversation and the number of unread messages.
///
///fetched conversations are listed down according to the order of recent activity
///conversations are fetched using [ConversationsBuilderProtocol] and [ConversationsRequestBuilder]
///
/// ```dart
///   CometChatConversations(
///    avatarStyle: AvatarStyle(),
///    dateStyle: DateStyle(),
///    badgeStyle: BadgeStyle(),
///    conversationsStyle: ConversationsStyle(),
///    receiptStyle: ReceiptStyle(),
///    listItemStyle: ListItemStyle(),
///    statusIndicatorStyle: StatusIndicatorStyle(),
///    deleteConversationDialogStyle: ConfirmDialogStyle(),
///  );
/// ```
<<<<<<< HEAD
///

typedef FetchUser = Map<String, dynamic>? Function(String);

class CometChatConversations extends StatelessWidget {
  CometChatConversations({
    Key? key,
=======
class CometChatConversations extends StatelessWidget {
  CometChatConversations({
    super.key,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    this.conversationsProtocol,
    this.subtitleView,
    this.listItemView,
    this.conversationsStyle = const ConversationsStyle(),
    this.controller,
<<<<<<< HEAD
    this.ctheme,
    this.backButton,
    this.showBackButton = true,
    this.userFilter,
=======
    this.theme,
    this.backButton,
    this.showBackButton = true,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    this.selectionMode,
    this.onSelection,
    this.title,
    this.errorStateText,
    this.emptyStateText,
    this.stateCallBack,
    this.conversationsRequestBuilder,
    this.hideError,
    this.loadingStateText,
    this.emptyStateView,
    this.errorStateView,
    this.listItemStyle,
    this.tailView,
    this.options,
    this.avatarStyle,
    this.statusIndicatorStyle,
    this.badgeStyle,
    this.receiptStyle,
    this.appBarOptions,
    this.hideSeparator = false,
    this.disableUsersPresence = false,
    this.disableReceipt = false,
    this.protectedGroupIcon,
    this.privateGroupIcon,
    this.readIcon,
    this.deliveredIcon,
    this.sentIcon,
    this.activateSelection,
    this.datePattern,
    String? customSoundForMessages,
    bool? disableSoundForMessages = false,
    this.typingIndicatorText,
    this.dateStyle,
    this.onBack,
    this.onItemTap,
    this.onItemLongPress,
    bool? disableTyping,
    ConfirmDialogStyle? deleteConversationDialogStyle,
    OnError? onError,
<<<<<<< HEAD
    this.onFetchUser,
    this.hideAppbar = false,
  })  : conversationsController = CometChatConversationsController(
            conversationsBuilderProtocol: conversationsProtocol ??
                UIConversationsBuilder(
                  conversationsRequestBuilder ?? ConversationsRequestBuilder(),
                ),
            mode: selectionMode,
            theme: ctheme ?? cometChatTheme,
            disableSoundForMessages: disableSoundForMessages,
            customSoundForMessages: customSoundForMessages,
            disableUsersPresence: disableUsersPresence,
            disableReceipt: disableReceipt,
            disableTyping: disableTyping,
            deleteConversationDialogStyle: deleteConversationDialogStyle,
            onError: onError),
        super(key: key);
=======
    this.hideAppbar = false,
    this.disableMentions,
    this.textFormatters,
  }) : conversationsController = CometChatConversationsController(
          conversationsBuilderProtocol: conversationsProtocol ??
              UIConversationsBuilder(
                conversationsRequestBuilder ?? ConversationsRequestBuilder(),
              ),
          mode: selectionMode,
          theme: theme ?? cometChatTheme,
          disableSoundForMessages: disableSoundForMessages,
          customSoundForMessages: customSoundForMessages,
          disableUsersPresence: disableUsersPresence,
          disableReceipt: disableReceipt,
          disableTyping: disableTyping,
          deleteConversationDialogStyle: deleteConversationDialogStyle,
          onError: onError,
          textFormatters: textFormatters,
          disableMentions: disableMentions,
        );
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///property to be set internally by using passed parameters [conversationsProtocol] ,[selectionMode] ,[options]
  ///these are passed to the [CometChatConversationsController] which is responsible for the business logic
  final CometChatConversationsController conversationsController;

  ///[conversationsProtocol] set custom conversations request builder protocol
  final ConversationsBuilderProtocol? conversationsProtocol;

  ///[conversationsRequestBuilder] set custom conversations request builder
  final ConversationsRequestBuilder? conversationsRequestBuilder;

  ///[subtitleView] to set subtitle for each conversation
  final Widget? Function(BuildContext, Conversation)? subtitleView;

  ///[tailView] to set tailView for each conversation
  final Widget? Function(Conversation)? tailView;

  ///[hideSeparator] toggle visibility of separator
  final bool? hideSeparator;

  ///[listItemView] set custom view for each conversation
  final Widget Function(Conversation)? listItemView;

  ///[conversationsStyle] sets style
  final ConversationsStyle conversationsStyle;

  ///[controller] sets controller for the list
  final ScrollController? controller;

  ///[options] custom options to show on sliding a conversation item
  final List<CometChatOption>? Function(
<<<<<<< HEAD
      Conversation, CometChatConversationsController controller, BuildContext context)? options;
=======
      Conversation,
      CometChatConversationsController controller,
      BuildContext context)? options;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[backButton] back button
  final Widget? backButton;

  ///[showBackButton] switch on/off back button
  final bool showBackButton;

  ///[theme] can pass custom theme
<<<<<<< HEAD
  final CometChatTheme? ctheme;
=======
  final CometChatTheme? theme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[selectionMode] specifies mode conversations module is opening in
  final SelectionMode? selectionMode;

  ///[onSelection] function will be performed
  final Function(List<Conversation>?)? onSelection;

  ///[title] sets title for the list
  final String? title;

  ///[emptyStateText] text to be displayed when the list is empty
  final String? emptyStateText;

  ///[errorStateText] text to be displayed when error occur
  final String? errorStateText;

  ///[loadingStateText] returns view fow loading state
  final WidgetBuilder? loadingStateText;

  ///[emptyStateView] returns view fow empty state
  final WidgetBuilder? emptyStateView;

  ///[errorStateView] returns view fow error state behind the dialog
  final WidgetBuilder? errorStateView;

  ///[hideError] toggle visibility of error dialog
  final bool? hideError;

<<<<<<< HEAD
  final FetchUser? onFetchUser;

=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  ///[stateCallBack] to access controller functions  from parent pass empty reference of  CometChatConversationsController object
  final Function(CometChatConversationsController controller)? stateCallBack;

  ///[listItemStyle] style for every list item
  final ListItemStyle? listItemStyle;

  ///[avatarStyle] set style for avatar
  final AvatarStyle? avatarStyle;

  ///[statusIndicatorStyle] set style for status indicator
  final StatusIndicatorStyle? statusIndicatorStyle;

  ///[badgeStyle] used to customize the unread messages count indicator
  final BadgeStyle? badgeStyle;

  ///[receiptStyle] sets the style for the receipts shown in the subtitle
  final ReceiptStyle? receiptStyle;

  ///[appBarOptions] list of options to be visible in app bar
  final List<Widget>? appBarOptions;

  ///[disableUsersPresence] controls visibility of status indicator shown if a user is online
  final bool? disableUsersPresence;

  ///[disableReceipt] controls visibility of read receipts
  ///and also disables logic executed inside onMessagesRead and onMessagesDelivered listeners
  final bool? disableReceipt;

  ///[protectedGroupIcon] provides icon in status indicator for protected group
  final Widget? protectedGroupIcon;

  ///[privateGroupIcon] provides icon in status indicator for private group
  final Widget? privateGroupIcon;

  ///[readIcon] provides icon in read receipts if a message is read
  final Widget? readIcon;

  ///[deliveredIcon] provides icon in read receipts if a message is delivered
  final Widget? deliveredIcon;

  ///[sentIcon] provides icon in read receipts if a message is sent
  final Widget? sentIcon;

  ///[activateSelection] lets the widget know if conversations are allowed to be selected
  final ActivateSelection? activateSelection;

  ///[datePattern] is used to generate customDateString for CometChatDate
  final String Function(Conversation conversation)? datePattern;

  ///[typingIndicatorText] if not null is visible instead of default text shown when another user is typing
  final String? typingIndicatorText;

  ///[dateStyle] provides styling for CometChatDate
  final DateStyle? dateStyle;

  ///[onBack] callback triggered on closing this screen
  final VoidCallback? onBack;

  ///[onItemTap] callback triggered on tapping a conversation item
  final Function(Conversation)? onItemTap;

  ///[onItemLongPress] callback triggered on pressing for long on a conversation item
  final Function(Conversation)? onItemLongPress;

  ///[hideAppbar] toggle visibility for app bar
  final bool? hideAppbar;

<<<<<<< HEAD
  final RxBool _isSelectionOn = false.obs;

  final List<String>? userFilter;

  Widget getDefaultItem(Conversation conversation, CometChatConversationsController controller, CometChatTheme theme,
=======
  ///[disableMentions] disables formatting of mentions in the subtitle of the conversation
  final bool? disableMentions;

  ///[textFormatters] is a list of text formatters for message bubbles with type text
  final List<CometChatTextFormatter>? textFormatters;

  final RxBool _isSelectionOn = false.obs;

  Widget getDefaultItem(
      Conversation conversation,
      CometChatConversationsController controller,
      CometChatTheme theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      BuildContext context) {
    Widget? subtitle;
    Widget? tail;
    Color? backgroundColor;
    Widget? icon;

    if (subtitleView != null) {
      subtitle = subtitleView!(context, conversation);
    } else {
      subtitle = getDefaultSubtitle(theme,
          context: context,
          conversation: conversation,
<<<<<<< HEAD
          showTypingIndicator: controller.typingIndicatorMap.contains(conversation.conversationId),
=======
          showTypingIndicator:
              controller.typingMap.containsKey(conversation.conversationId),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          hideThreadIndicator: controller.getHideThreadIndicator(conversation),
          controller: controller);
    }
    if (tailView != null) {
      tail = tailView!(conversation);
    } else {
      tail = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: getTime(theme, conversation)),
          Flexible(child: getUnreadCount(theme, conversation)),
        ],
      );
    }

    User? conversationWithUser;
    Group? conversationWithGroup;
    if (conversation.conversationWith is User) {
      conversationWithUser = conversation.conversationWith as User;
<<<<<<< HEAD
      if (onFetchUser != null && conversationWithUser.avatar == null) {
        Map<String, dynamic>? uu = onFetchUser!(conversationWithUser.uid);
        conversationWithUser.avatar = uu?['images'][0].imageUrl;
      }
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    } else {
      conversationWithGroup = conversation.conversationWith as Group;
    }

<<<<<<< HEAD
    StatusIndicatorUtils statusIndicatorUtils = StatusIndicatorUtils.getStatusIndicatorFromParams(
        isSelected: controller.selectionMap[conversation.conversationId] != null,
        theme: theme,
        user: conversationWithUser,
        group: conversationWithGroup,
        onlineStatusIndicatorColor: conversationsStyle.onlineStatusColor ?? theme.palette.getSuccess(),
        privateGroupIcon: privateGroupIcon,
        protectedGroupIcon: protectedGroupIcon,
        privateGroupIconBackground: conversationsStyle.privateGroupIconBackground,
        protectedGroupIconBackground: conversationsStyle.protectedGroupIconBackground,
        disableUsersPresence: disableUsersPresence);
=======
    StatusIndicatorUtils statusIndicatorUtils =
        StatusIndicatorUtils.getStatusIndicatorFromParams(
            isSelected:
                controller.selectionMap[conversation.conversationId] != null,
            theme: theme,
            user: conversationWithUser,
            group: conversationWithGroup,
            onlineStatusIndicatorColor: conversationsStyle.onlineStatusColor ??
                theme.palette.getSuccess(),
            privateGroupIcon: privateGroupIcon,
            protectedGroupIcon: protectedGroupIcon,
            privateGroupIconBackground:
                conversationsStyle.privateGroupIconBackground,
            protectedGroupIconBackground:
                conversationsStyle.protectedGroupIconBackground,
            disableUsersPresence: disableUsersPresence);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    backgroundColor = statusIndicatorUtils.statusIndicatorColor;
    icon = statusIndicatorUtils.icon;

    return GestureDetector(
      onTap: () {
        if (activateSelection == ActivateSelection.onClick ||
<<<<<<< HEAD
            (activateSelection == ActivateSelection.onLongClick && controller.selectionMap.isNotEmpty) &&
                !(selectionMode == null || selectionMode == SelectionMode.none)) {
=======
            (activateSelection == ActivateSelection.onLongClick &&
                    controller.selectionMap.isNotEmpty) &&
                !(selectionMode == null ||
                    selectionMode == SelectionMode.none)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          controller.onTap(conversation);
          if (controller.selectionMap.isEmpty) {
            _isSelectionOn.value = false;
          } else if (activateSelection == ActivateSelection.onClick &&
              controller.selectionMap.isNotEmpty &&
              _isSelectionOn.value == false) {
            _isSelectionOn.value = true;
          }
        } else if (onItemTap != null) {
          onItemTap!(conversation);
          controller.activeConversation = conversation.conversationId;
        }
      },
      onLongPress: () {
        if (activateSelection == ActivateSelection.onLongClick &&
            controller.selectionMap.isEmpty &&
            !(selectionMode == null || selectionMode == SelectionMode.none)) {
          controller.onTap(conversation);

          _isSelectionOn.value = true;
        } else if (onItemLongPress != null) {
          onItemLongPress!(conversation);

          controller.activeConversation = conversation.conversationId;
        }
      },
      child: CometChatListItem(
        id: conversation.conversationId,
        avatarName: conversationWithUser?.name ?? conversationWithGroup?.name,
        avatarURL: conversationWithUser?.avatar ?? conversationWithGroup?.icon,
        title: conversationWithUser?.name ?? conversationWithGroup?.name,
        key: UniqueKey(),
        subtitleView: subtitle,
        tailView: tail,
        avatarStyle: avatarStyle ?? const AvatarStyle(),
        statusIndicatorColor: backgroundColor,
        statusIndicatorIcon: icon,
<<<<<<< HEAD
        statusIndicatorStyle: statusIndicatorStyle ?? const StatusIndicatorStyle(),
        ctheme: theme,
=======
        statusIndicatorStyle:
            statusIndicatorStyle ?? const StatusIndicatorStyle(),
        theme: theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        hideSeparator: hideSeparator,
        style: ListItemStyle(
          background: listItemStyle?.background ?? Colors.transparent,
          titleStyle: listItemStyle?.titleStyle ??
              TextStyle(
                  fontSize: theme.typography.name.fontSize,
                  fontWeight: theme.typography.name.fontWeight,
                  fontFamily: theme.typography.name.fontFamily,
                  color: theme.palette.getAccent()),
          height: listItemStyle?.height ?? 72,
          border: listItemStyle?.border,
          borderRadius: listItemStyle?.borderRadius,
          gradient: listItemStyle?.gradient,
          separatorColor: listItemStyle?.separatorColor,
          width: listItemStyle?.width,
          margin: listItemStyle?.margin,
          padding: listItemStyle?.padding,
        ),
        options: options != null
            ? options!(conversation, controller, context)
<<<<<<< HEAD
            : ConversationUtils.getDefaultOptions(conversation, controller, context, theme),
=======
            : ConversationUtils.getDefaultOptions(
                conversation, controller, context, theme),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      ),
    );
  }

<<<<<<< HEAD
  Widget getListItem(Conversation conversation, CometChatConversationsController controller, CometChatTheme theme,
=======
  Widget getListItem(
      Conversation conversation,
      CometChatConversationsController controller,
      CometChatTheme theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      BuildContext context) {
    if (listItemView != null) {
      return listItemView!(conversation);
    } else {
      return getDefaultItem(conversation, controller, theme, context);
    }
  }

  Widget _getLoadingIndicator(BuildContext context, CometChatTheme theme) {
    if (loadingStateText != null) {
      return Center(child: loadingStateText!(context));
    } else {
      return Center(
        child: Image.asset(
          AssetConstants.spinner,
          package: UIConstants.packageName,
<<<<<<< HEAD
          color: conversationsStyle.loadingIconTint ?? theme.palette.getAccent600(),
=======
          color: conversationsStyle.loadingIconTint ??
              theme.palette.getAccent600(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        ),
      );
    }
  }

<<<<<<< HEAD
  Widget _getNoConversationIndicator(BuildContext context, CometChatTheme theme) {
=======
  Widget _getNoConversationIndicator(
      BuildContext context, CometChatTheme theme) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (emptyStateView != null) {
      return Center(child: emptyStateView!(context));
    } else {
      return Center(
        child: Text(
<<<<<<< HEAD
          emptyStateText ?? cc.Translations.of(context).no_chats_found,
=======
          emptyStateText ?? cc.Translations.of(context).noChatsFound,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          style: conversationsStyle.emptyTextStyle ??
              TextStyle(
                  fontSize: theme.typography.title1.fontSize,
                  fontWeight: theme.typography.title1.fontWeight,
                  color: theme.palette.getAccent400()),
        ),
      );
    }
  }

<<<<<<< HEAD
  _showErrorDialog(
      String errorText, BuildContext context, CometChatTheme theme, CometChatConversationsController controller) {
=======
  _showErrorDialog(String errorText, BuildContext context, CometChatTheme theme,
      CometChatConversationsController controller) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    showCometChatConfirmDialog(
        context: context,
        messageText: Text(
          errorStateText ?? errorText,
          style: conversationsStyle.errorTextStyle ??
              TextStyle(
                  fontSize: theme.typography.title2.fontSize,
                  fontWeight: theme.typography.title2.fontWeight,
                  color: theme.palette.getAccent(),
                  fontFamily: theme.typography.title2.fontFamily),
        ),
<<<<<<< HEAD
        confirmButtonText: cc.Translations.of(context).try_again,
        cancelButtonText: cc.Translations.of(context).cancel_capital,
        style: ConfirmDialogStyle(
            backgroundColor: theme.palette.mode == PaletteThemeModes.light
                ? theme.palette.getBackground()
                : Color.alphaBlend(theme.palette.getAccent200(), theme.palette.getBackground()),
=======
        confirmButtonText: cc.Translations.of(context).tryAgain,
        cancelButtonText: cc.Translations.of(context).cancelCapital,
        style: ConfirmDialogStyle(
            backgroundColor: theme.palette.mode == PaletteThemeModes.light
                ? theme.palette.getBackground()
                : Color.alphaBlend(theme.palette.getAccent200(),
                    theme.palette.getBackground()),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            shadowColor: theme.palette.getAccent300(),
            confirmButtonTextStyle: TextStyle(
                fontSize: theme.typography.text2.fontSize,
                fontWeight: theme.typography.text2.fontWeight,
                color: theme.palette.getPrimary()),
            cancelButtonTextStyle: TextStyle(
                fontSize: theme.typography.text2.fontSize,
                fontWeight: theme.typography.text2.fontWeight,
                color: theme.palette.getPrimary())),
        onCancel: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        onConfirm: () {
          Navigator.pop(context);
          controller.loadMoreElements();
        });
  }

<<<<<<< HEAD
  _showError(CometChatConversationsController controller, BuildContext context, CometChatTheme theme) {
    if (hideError == true) return;
    String error;
    if (controller.error != null && controller.error is CometChatException) {
      error = Utils.getErrorTranslatedText(context, (controller.error as CometChatException).code);
    } else {
      error = cc.Translations.of(context).no_chats_found;
=======
  _showError(CometChatConversationsController controller, BuildContext context,
      CometChatTheme theme) {
    if (hideError == true) return;
    String error;
    if (controller.error != null && controller.error is CometChatException) {
      error = Utils.getErrorTranslatedText(
          context, (controller.error as CometChatException).code);
    } else {
      error = cc.Translations.of(context).noChatsFound;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
    if (errorStateView != null) {}
    _showErrorDialog(error, context, theme, controller);
  }

<<<<<<< HEAD
  Widget _getList(CometChatConversationsController scontroller, BuildContext context, CometChatTheme theme) {
    return GetBuilder(
      init: scontroller,
      global: false,
      dispose: (GetBuilderState<CometChatConversationsController> state) => state.controller?.onClose(),
      builder: (CometChatConversationsController value) {
        value.context = context;
        if (value.hasError == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _showError(value, context, theme));
=======
  Widget _getList(CometChatConversationsController conversationController,
      BuildContext context, CometChatTheme theme) {
    return GetBuilder(
      init: conversationController,
      global: false,
      dispose: (GetBuilderState<CometChatConversationsController> state) =>
          state.controller?.onClose(),
      builder: (CometChatConversationsController value) {
        value.context = context;
        if (value.hasError == true) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => _showError(value, context, theme));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

          if (errorStateView != null) {
            return errorStateView!(context);
          }

          return _getLoadingIndicator(context, theme);
        } else if (value.isLoading == true && (value.list.isEmpty)) {
          return _getLoadingIndicator(context, theme);
        } else if (value.list.isEmpty) {
          //----------- empty list widget-----------
          return _getNoConversationIndicator(context, theme);
        } else {
<<<<<<< HEAD
          if (userFilter != null) {
            value.list.retainWhere((element) {
              return userFilter!.firstWhereOrNull((e2) => element.conversationId!.contains(e2)) != null;
            });
          }
          return ListView.builder(
            controller: controller,
            itemCount: value.hasMoreItems ? value.list.length + 1 : value.list.length,
=======
          return ListView.builder(
            controller: controller,
            itemCount:
                value.hasMoreItems ? value.list.length + 1 : value.list.length,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            itemBuilder: (context, index) {
              if (index >= value.list.length) {
                value.loadMoreElements();
                return _getLoadingIndicator(context, theme);
              }

              return Column(
                children: [
                  getListItem(value.list[index], value, theme, context),
                ],
              );
            },
          );
        }
      },
    );
  }

<<<<<<< HEAD
  Widget getSelectionWidget(CometChatConversationsController conversationsController, CometChatTheme theme) {
    if (_isSelectionOn.value) {
      return IconButton(
          onPressed: () {
            List<Conversation>? conversations = conversationsController.getSelectedList();
=======
  Widget getSelectionWidget(
      CometChatConversationsController conversationsController,
      CometChatTheme theme) {
    if (_isSelectionOn.value) {
      return IconButton(
          onPressed: () {
            List<Conversation>? conversations =
                conversationsController.getSelectedList();
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            if (onSelection != null) {
              onSelection!(conversations);
            }
          },
          icon: Image.asset(AssetConstants.checkmark,
<<<<<<< HEAD
              package: UIConstants.packageName, color: theme.palette.getPrimary()));
=======
              package: UIConstants.packageName,
              color: theme.palette.getPrimary()));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    } else {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    CometChatTheme theme = ctheme ?? cometChatTheme;

    if (stateCallBack != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => stateCallBack!(conversationsController));
=======
    CometChatTheme theme = this.theme ?? cometChatTheme;

    if (stateCallBack != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => stateCallBack!(conversationsController));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }

    return CometChatListBase(
        title: title ?? cc.Translations.of(context).chats,
        hideSearch: true,
        hideAppBar: hideAppbar,
        backIcon: backButton,
<<<<<<< HEAD
        onSearch: conversationsController.onSearch,
        showBackButton: showBackButton,
        onBack: onBack,
        ctheme: theme,
        menuOptions: [
          if (appBarOptions != null && appBarOptions!.isNotEmpty) ...appBarOptions!,
=======
        showBackButton: showBackButton,
        onBack: onBack,
        theme: theme,
        menuOptions: [
          if (appBarOptions != null && appBarOptions!.isNotEmpty)
            ...appBarOptions!,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          Obx(
            () => getSelectionWidget(conversationsController, theme),
          )
        ],
        style: ListBaseStyle(
<<<<<<< HEAD
            background: conversationsStyle.gradient == null ? conversationsStyle.background : Colors.transparent,
=======
            background: conversationsStyle.gradient == null
                ? conversationsStyle.background
                : Colors.transparent,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            titleStyle: conversationsStyle.titleStyle,
            gradient: conversationsStyle.gradient,
            height: conversationsStyle.height,
            width: conversationsStyle.width,
            backIconTint: conversationsStyle.backIconTint,
            border: conversationsStyle.border,
            borderRadius: conversationsStyle.borderRadius),
        container: _getList(conversationsController, context, theme));
  }

//----------- default subtitle
  Widget getDefaultSubtitle(CometChatTheme theme,
      {required BuildContext context,
      required Conversation conversation,
      required bool showTypingIndicator,
      bool? hideThreadIndicator = true,
      String? threadIndicatorText,
      required CometChatConversationsController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hideThreadIndicator != null && hideThreadIndicator == false)
          Text(
<<<<<<< HEAD
            cc.Translations.of(context).in_a_thread,
=======
            cc.Translations.of(context).inAThread,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            style: conversationsStyle.threadIndicatorStyle ??
                TextStyle(
                    color: theme.palette.getPrimary(),
                    fontWeight: theme.typography.subtitle1.fontWeight,
                    fontSize: theme.typography.subtitle1.fontSize,
                    fontFamily: theme.typography.subtitle1.fontFamily),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            getReceiptIcon(theme,
<<<<<<< HEAD
                conversation: conversation, hideReceipt: controller.getHideReceipt(conversation, disableReceipt)),
            if (showTypingIndicator)
              Text(
                typingIndicatorText ?? cc.Translations.of(context).is_typing,
=======
                conversation: conversation,
                hideReceipt:
                    controller.getHideReceipt(conversation, disableReceipt)),
            if (showTypingIndicator)
              Text(
                typingIndicatorText ??
                    ((conversation.conversationWith is User)
                        ? cc.Translations.of(context).isTyping
                        : "${controller.typingMap[conversation.conversationId]?.sender.name ?? ''} ${cc.Translations.of(context).isTyping}"),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                style: conversationsStyle.typingIndicatorStyle ??
                    TextStyle(
                        color: theme.palette.getPrimary(),
                        fontWeight: theme.typography.subtitle1.fontWeight,
                        fontSize: theme.typography.subtitle1.fontSize,
                        fontFamily: theme.typography.subtitle1.fontFamily),
              )
            else
<<<<<<< HEAD
              Expanded(child: getSubtitle(theme, context, conversation, controller))
=======
              Expanded(
                  child: getSubtitle(theme, context, conversation, controller))
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          ],
        ),
      ],
    );
  }

<<<<<<< HEAD
  Widget getReceiptIcon(CometChatTheme theme, {required Conversation conversation, bool? hideReceipt}) {
=======
  Widget getReceiptIcon(CometChatTheme theme,
      {required Conversation conversation, bool? hideReceipt}) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (hideReceipt ?? false) {
      return const SizedBox();
    } else if (conversation.lastMessage != null &&
        conversation.lastMessage?.sender != null &&
        conversation.lastMessage!.deletedAt == null &&
        conversation.lastMessage!.type != "groupMember") {
<<<<<<< HEAD
      ReceiptStatus status = MessageReceiptUtils.getReceiptStatus(conversation.lastMessage!);
=======
      ReceiptStatus status =
          MessageReceiptUtils.getReceiptStatus(conversation.lastMessage!);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: CometChatReceipt(
          status: status,
          deliveredIcon: deliveredIcon ??
              Image.asset(
                AssetConstants.messageReceived,
                package: UIConstants.packageName,
<<<<<<< HEAD
                color: receiptStyle?.deliveredIconTint ?? theme.palette.getAccent(),
=======
                color: receiptStyle?.deliveredIconTint ??
                    theme.palette.getAccent(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              ),
          readIcon: readIcon ??
              Image.asset(
                AssetConstants.messageReceived,
                package: UIConstants.packageName,
                color: receiptStyle?.readIconTint ?? theme.palette.getPrimary(),
              ),
          sentIcon: sentIcon ??
              Image.asset(
                AssetConstants.messageSent,
                package: UIConstants.packageName,
                color: receiptStyle?.sentIconTint ?? theme.palette.getAccent(),
              ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

<<<<<<< HEAD
  Widget getSubtitle(CometChatTheme theme, BuildContext context, Conversation conversation,
      CometChatConversationsController controller) {
=======
  Widget getSubtitle(CometChatTheme theme, BuildContext context,
      Conversation conversation, CometChatConversationsController controller) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    TextStyle subtitleStyle = conversationsStyle.lastMessageStyle ??
        TextStyle(
            color: theme.palette.getAccent600(),
            fontSize: theme.typography.subtitle1.fontSize,
            fontWeight: theme.typography.subtitle1.fontWeight,
            fontFamily: theme.typography.subtitle1.fontFamily);

<<<<<<< HEAD
    String? text;

    text = controller.getLastMessage(conversation, context);

    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: subtitleStyle,
    );
=======
    AdditionalConfigurations? configurations;

    if (conversation.lastMessage != null) {
      configurations = AdditionalConfigurations(
        textFormatters:
            controller.getTextFormatters(conversation.lastMessage!, theme),
      );
    }

    Widget subtitle = CometChatUIKit.getDataSource().getConversationSubtitle(
        conversation, context, theme, subtitleStyle,
        additionalConfigurations: configurations);

    return subtitle;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

//----------- last message update time and unread message count -----------
  Widget getTime(CometChatTheme theme, Conversation conversation) {
<<<<<<< HEAD
    DateTime? lastMessageTime = conversation.lastMessage?.updatedAt ?? conversation.lastMessage?.sentAt;
=======
    DateTime? lastMessageTime =
        conversation.lastMessage?.updatedAt ?? conversation.lastMessage?.sentAt;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (lastMessageTime == null) return const SizedBox();

    String? customDateString;

    if (datePattern != null) {
      customDateString = datePattern!(conversation);
    }

    return CometChatDate(
<<<<<<< HEAD
      cdate: lastMessageTime,
=======
      date: lastMessageTime,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      style: DateStyle(
          background: dateStyle?.background ?? theme.palette.getBackground(),
          textStyle: dateStyle?.textStyle ??
              TextStyle(
                  color: theme.palette.getAccent500(),
                  fontSize: theme.typography.subtitle1.fontSize,
                  fontWeight: theme.typography.subtitle1.fontWeight,
                  fontFamily: theme.typography.subtitle1.fontFamily),
<<<<<<< HEAD
          border: dateStyle?.border ?? Border.all(color: theme.palette.getBackground(), width: 0),
=======
          border: dateStyle?.border ??
              Border.all(color: theme.palette.getBackground(), width: 0),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          borderRadius: dateStyle?.borderRadius,
          contentPadding: dateStyle?.contentPadding,
          gradient: dateStyle?.gradient,
          height: dateStyle?.height,
          isTransparentBackground: dateStyle?.isTransparentBackground,
          width: dateStyle?.width),
      customDateString: customDateString,
      pattern: DateTimePattern.dayDateTimeFormat,
    );
  }

  Widget getUnreadCount(CometChatTheme theme, Conversation conversation) {
    return CometChatBadge(
      count: conversation.unreadMessageCount ?? 0,
      style: BadgeStyle(
        width: badgeStyle?.width ?? 25,
        height: badgeStyle?.height ?? 25,
        borderRadius: badgeStyle?.borderRadius ?? 100,
<<<<<<< HEAD
        textStyle: TextStyle(fontSize: theme.typography.subtitle1.fontSize, color: theme.palette.getAccent())
=======
        textStyle: TextStyle(
                fontSize: theme.typography.subtitle1.fontSize,
                color: theme.palette.getAccent())
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            .merge(badgeStyle?.textStyle),
        background: badgeStyle?.background ?? theme.palette.getPrimary(),
      ),
    );
  }
}
