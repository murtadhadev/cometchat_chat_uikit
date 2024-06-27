import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../cometchat_chat_uikit.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart' as cc;

///[CometChatContacts] is a component that displays a list of users and groups with the help of [CometChatListBase] and [CometChatListItem]
///fetched users and groups  are listed down alphabetically and in order of recent activity
///users are fetched using [UsersBuilderProtocol] and [UsersRequestBuilder]
///groups are fetched using [GroupsBuilderProtocol] and [GroupsRequestBuilder]
///
///
/// ```dart
///   CometChatContacts(
///   contactsStyle: ContactsStyle(),
/// );
/// ```
///

class CometChatContacts extends StatefulWidget {
  const CometChatContacts(
<<<<<<< HEAD
      {Key? key,
=======
      {super.key,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      this.usersConfiguration,
      this.onItemTap,
      this.groupsConfiguration,
      this.usersTabTitle,
      this.groupsTabTitle,
      this.theme,
      this.title,
      this.closeIcon,
      this.contactsStyle = const ContactsStyle(),
      this.onClose,
      this.onSubmitIconTap,
      this.tabVisibility = TabVisibility.usersAndGroups,
      this.hideSubmitIcon,
      this.selectionLimit = 5,
      this.selectionMode,
      this.submitIcon,
<<<<<<< HEAD
      this.snackBarConfiguration})
      : super(key: key);
=======
      this.snackBarConfiguration});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[usersConfiguration] set custom users request builder protocol
  final UsersConfiguration? usersConfiguration;

  ///[onItemTap] callback triggered on tapping a user or group item
  final UserGroupBuilder? onItemTap;

  ///[GroupConfiguration] custom request groups request builder protocol
  final GroupsConfiguration? groupsConfiguration;

  ///[usersTabTitle] title text of user tab
  final String? usersTabTitle;

  ///[groupsTabTitle] title text of group tab
  final String? groupsTabTitle;

  ///[title] sets title for the list
  final String? title;

  ///[closeIcon] close icon widget
  final Widget? closeIcon;

  ///[contactsStyle] sets style
  final ContactsStyle contactsStyle;

  ///[onClose] call function to be called on close button click
  final VoidCallback? onClose;

  ///[theme] set custom theme
  final CometChatTheme? theme;

  ///[onSubmitIconTap] triggered when clicked on submit icon
<<<<<<< HEAD
  final Function(BuildContext context, List<User>? selectedUsersList, List<Group>? selectedGroupsList)? onSubmitIconTap;
=======
  final Function(BuildContext context, List<User>? selectedUsersList,
      List<Group>? selectedGroupsList)? onSubmitIconTap;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[tabVisibility] parameter to alter visibility of different tabs
  final TabVisibility tabVisibility;

  ///[submitIcon] triggered when clicked on submit icon
  final Widget? submitIcon;

  ///[selectionLimit] set the limit for maximum selection limit, default limit is 5
  final int? selectionLimit;

  ///[hideSubmitIcon] triggered visibility of selection icon
  final bool? hideSubmitIcon;

  ///[SelectionMode] sets the selection mode
  final SelectionMode? selectionMode;

  ///[snackBarConfiguration] sets configuration properties for showing snackBar
  final SnackBarConfiguration? snackBarConfiguration;

  @override
  State<CometChatContacts> createState() => _CometChatContactsState();
}

<<<<<<< HEAD
class _CometChatContactsState extends State<CometChatContacts> with SingleTickerProviderStateMixin {
=======
class _CometChatContactsState extends State<CometChatContacts>
    with SingleTickerProviderStateMixin {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  late CometChatContactsController cometChatStartConversationController;
  late CometChatTheme theme;

  @override
  void initState() {
    theme = widget.theme ?? cometChatTheme;
    cometChatStartConversationController = CometChatContactsController(
        onItemTap: widget.onItemTap,
        usersConfiguration: widget.usersConfiguration,
        groupsConfiguration: widget.groupsConfiguration,
        selectionMode: widget.selectionMode ?? SelectionMode.none,
        tabVisibility: widget.tabVisibility);
<<<<<<< HEAD
    cometChatStartConversationController.tabController =
        TabController(length: widget.tabVisibility == TabVisibility.usersAndGroups ? 2 : 1, vsync: this);
    cometChatStartConversationController.tabController
        .addListener(cometChatStartConversationController.tabControllerListener);
=======
    cometChatStartConversationController.tabController = TabController(
        length: widget.tabVisibility == TabVisibility.usersAndGroups ? 2 : 1,
        vsync: this);
    cometChatStartConversationController.tabController.addListener(
        cometChatStartConversationController.tabControllerListener);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    super.initState();
  }

  @override
  void dispose() {
    cometChatStartConversationController.dispose();
    super.dispose();
  }

<<<<<<< HEAD
  Widget getSelectionWidget(CometChatTheme theme, CometChatContactsController controller, BuildContext context) {
=======
  Widget getSelectionWidget(CometChatTheme theme,
      CometChatContactsController controller, BuildContext context) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    return IconButton(
        onPressed: () {
          List<Group>? groups;
          List<User>? users;

          users = controller.getUserController()?.getSelectedList();

          groups = controller.getGroupsController()?.getSelectedList();

          int total = 0;

          if (users != null) {
            total += users.length;
          }

          if (groups != null) {
            total += groups.length;
          }

          int selectionLimit = widget.selectionLimit ?? 5;
          if (total > selectionLimit) {
<<<<<<< HEAD
            SnackBarUtils.show("${cc.Translations.of(context).max_selection_limit_is} $selectionLimit", context);
=======
            SnackBarUtils.show(
                "${cc.Translations.of(context).maxSelectionLimitIs} $selectionLimit",
                context);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            return;
          }

          if (widget.onSubmitIconTap != null) {
            widget.onSubmitIconTap!(context, users, groups);
          }
        },
        icon: widget.submitIcon ??
<<<<<<< HEAD
            Image.asset(AssetConstants.checkmark, package: UIConstants.packageName, color: theme.palette.getPrimary()));
=======
            Image.asset(AssetConstants.checkmark,
                package: UIConstants.packageName,
                color: theme.palette.getPrimary()));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: cometChatStartConversationController,
        builder: (CometChatContactsController value) {
          value.context = context;
          return CometChatListBase(
<<<<<<< HEAD
            title: widget.title ?? cc.Translations.of(context).new_message,
            ctheme: theme,
=======
            title: widget.title ?? cc.Translations.of(context).newMessage,
            theme: theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            backIcon: widget.closeIcon ??
                Image.asset(
                  AssetConstants.close,
                  package: UIConstants.packageName,
                  color: theme.palette.getPrimary(),
                ),
            showBackButton: true,
            onBack: () {
              Navigator.pop(context);
            },
            hideSearch: true,
            menuOptions: [
<<<<<<< HEAD
              if (widget.hideSubmitIcon != true) getSelectionWidget(theme, value, context),
=======
              if (widget.hideSubmitIcon != true)
                getSelectionWidget(theme, value, context),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            ],
            container: Column(
              children: [
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: theme.palette.getAccent100(),
                    borderRadius: BorderRadius.circular(
                      18.0,
                    ),
                  ),
                  child: TabBar(
                    controller: value.tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        18.0,
                      ),
<<<<<<< HEAD
                      color: widget.contactsStyle.selectedTabColor ?? theme.palette.getPrimary(),
                    ),
                    labelColor: widget.contactsStyle.selectedTabTextStyle?.color ?? theme.palette.getBackground(),
                    unselectedLabelColor: widget.contactsStyle.tabTextStyle?.color ?? theme.palette.getAccent600(),
=======
                      color: widget.contactsStyle.selectedTabColor ??
                          theme.palette.getPrimary(),
                    ),
                    labelColor:
                        widget.contactsStyle.selectedTabTextStyle?.color ??
                            theme.palette.getBackground(),
                    unselectedLabelColor:
                        widget.contactsStyle.tabTextStyle?.color ??
                            theme.palette.getAccent600(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                    labelStyle: TextStyle(
                      color: theme.palette.getBackground(),
                      fontSize: theme.typography.text1.fontSize,
                      fontFamily: theme.typography.text1.fontFamily,
                      fontWeight: theme.typography.text1.fontWeight,
                    ).merge(widget.contactsStyle.selectedTabTextStyle),
                    unselectedLabelStyle: TextStyle(
                      color: theme.palette.getAccent600(),
                      fontSize: theme.typography.text1.fontSize,
                      fontFamily: theme.typography.text1.fontFamily,
                      fontWeight: theme.typography.text1.fontWeight,
                    ).merge(widget.contactsStyle.tabTextStyle),
                    tabs: [
<<<<<<< HEAD
                      if (widget.tabVisibility == TabVisibility.usersAndGroups ||
                          widget.tabVisibility == TabVisibility.users)
                        Tab(
                          text: widget.usersTabTitle ?? cc.Translations.of(context).users,
                        ),
                      if (widget.tabVisibility == TabVisibility.usersAndGroups ||
                          widget.tabVisibility == TabVisibility.groups)
                        Tab(
                          text: widget.groupsTabTitle ?? cc.Translations.of(context).groups,
=======
                      if (widget.tabVisibility ==
                              TabVisibility.usersAndGroups ||
                          widget.tabVisibility == TabVisibility.users)
                        Tab(
                          text: widget.usersTabTitle ??
                              cc.Translations.of(context).users,
                        ),
                      if (widget.tabVisibility ==
                              TabVisibility.usersAndGroups ||
                          widget.tabVisibility == TabVisibility.groups)
                        Tab(
                          text: widget.groupsTabTitle ??
                              cc.Translations.of(context).groups,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: value.currentView[value.tabController.index],
                ),
              ],
            ),
          );
        });
  }
}
