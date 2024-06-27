import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

///[CometChatDetails] is a mediator component that provides access to
///components for viewing, adding, banning group members if the [CometChatDetails] component is being shown for a [Group] and also components for transferring ownership and leaving the group
///and options for blocking and unblocking a user if the [CometChatDetails] component for a [User]
/// ```dart
///
///  for a User
///
///   CometChatDetails(
///   user: User(uid: 'uid', name: 'name'),
///   detailsStyle: DetailsStyle(),
///     addMemberConfiguration: AddMemberConfiguration(),
///    bannedMemberConfiguration: BannedMemberConfiguration(),
///    groupMembersConfiguration: GroupMembersConfiguration(),
///    transferOwnershipConfiguration: TransferOwnershipConfiguration(),
/// );
///
///  for a Group
///
/// CometChatDetails(
///   group: Group(guid: 'guid', name: 'name', type: 'public'),
///   detailsStyle: DetailsStyle(),
///     addMemberConfiguration: AddMemberConfiguration(),
///    bannedMemberConfiguration: BannedMemberConfiguration(),
///    groupMembersConfiguration: GroupMembersConfiguration(),
///    transferOwnershipConfiguration: TransferOwnershipConfiguration(),
/// );
///
/// ```
class CometChatDetails extends StatelessWidget {
  CometChatDetails(
<<<<<<< HEAD
      {Key? key,
=======
      {super.key,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      User? user,
      Group? group,
      this.title,
      this.detailsStyle,
      this.showCloseButton = true,
      this.closeButtonIcon,
      List<CometChatDetailsTemplate>? Function(Group? group, User? user)? data,
      GroupMembersConfiguration? groupMembersConfiguration,
      AddMemberConfiguration? addMemberConfiguration,
      TransferOwnershipConfiguration? transferOwnershipConfiguration,
      BannedMemberConfiguration? bannedMemberConfiguration,
      void Function(CometChatDetailsController)? stateCallBack,
      this.disableUsersPresence = false,
      this.appBarOptions,
      this.listItemStyle,
      this.avatarStyle,
      this.statusIndicatorStyle,
      this.subtitleView,
      this.hideProfile,
      this.customProfileView,
      this.protectedGroupIcon,
      this.privateGroupIcon,
<<<<<<< HEAD
      this.ctheme,
=======
      this.theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      this.onBack,
      ConfirmDialogStyle? leaveGroupDialogStyle,
      OnError? onError})
      : _cometChatDetailsController = CometChatDetailsController(user, group,
            stateCallBack: stateCallBack,
            addMemberConfiguration: addMemberConfiguration,
            transferOwnershipConfiguration: transferOwnershipConfiguration,
            data: data,
            leaveGroupDialogStyle: leaveGroupDialogStyle,
<<<<<<< HEAD
            onError: onError),
        super(key: key);
=======
            onError: onError);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///to pass [CometChatDetails] header text use [title]
  final String? title;

  ///[detailsStyle] is used to pass styling properties
  final DetailsStyle? detailsStyle;

  ///[showCloseButton] toggles visibility for close button
  final bool? showCloseButton;

  ///to change [closeButtonIcon]
  final Icon? closeButtonIcon;

  ///[disableUsersPresence] controls visibility of status indicator
  final bool disableUsersPresence;

  ///[appBarOptions] list of options to be visible in app bar
  final List<Widget>? appBarOptions;

  ///[listItemStyle] style for every list item
  final ListItemStyle? listItemStyle;

  ///[avatarStyle] set style for avatar
  final AvatarStyle? avatarStyle;

  ///[statusIndicatorStyle] set style for status indicator
  final StatusIndicatorStyle? statusIndicatorStyle;

  ///[subtitleView] to set subtitle for each conversation
<<<<<<< HEAD
  final Widget? Function({User? user, Group? group, BuildContext context})? subtitleView;
=======
  final Widget? Function({User? user, Group? group, BuildContext context})?
      subtitleView;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[hideProfile] hides view profile for users
  final bool? hideProfile;

  ///[protectedGroupIcon] provides icon in status indicator for protected group
  final Widget? protectedGroupIcon;

  ///[privateGroupIcon] provides icon in status indicator for private group
  final Widget? privateGroupIcon;

  ///[customProfileView] provides a customized view profile for users
  final Widget? customProfileView;

  ///[theme] custom theme
<<<<<<< HEAD
  final CometChatTheme? ctheme;
=======
  final CometChatTheme? theme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[onBack] callback triggered on closing this screen
  final VoidCallback? onBack;

  final CometChatDetailsController _cometChatDetailsController;

<<<<<<< HEAD
  // class variables-----------------

  //initialization methods--------------

  _getProfile(BuildContext context, CometChatDetailsController detailsController, CometChatTheme theme) {
=======
  _getProfile(BuildContext context,
      CometChatDetailsController detailsController, CometChatTheme theme) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    Widget? subtitle;
    Color? backgroundColor;
    Widget? icon;
    User? user = detailsController.user;
    Group? group = detailsController.group;

    if (subtitleView != null) {
      subtitle = subtitleView!(user: user, group: group);
    } else {
      String subtitleText;
      if (user != null) {
        subtitleText = user.status ?? "";
      } else {
<<<<<<< HEAD
        subtitleText = "${detailsController.membersCount} ${Translations.of(context).members}";
=======
        subtitleText =
            "${detailsController.membersCount} ${Translations.of(context).members}";
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      }
      subtitle = Text(subtitleText,
          style: TextStyle(
              fontSize: theme.typography.subtitle1.fontSize,
              fontWeight: theme.typography.subtitle1.fontWeight,
              fontFamily: theme.typography.subtitle1.fontFamily,
              color: theme.palette.getAccent600()));
    }
    if ((user != null && disableUsersPresence != true) || group != null) {
<<<<<<< HEAD
      StatusIndicatorUtils statusIndicatorUtils = StatusIndicatorUtils.getStatusIndicatorFromParams(
          isSelected: false,
          theme: theme,
          user: user,
          group: group,
          disableUsersPresence: disableUsersPresence,
          privateGroupIcon: privateGroupIcon,
          protectedGroupIcon: protectedGroupIcon,
          privateGroupIconBackground: detailsStyle?.privateGroupIconBackground,
          protectedGroupIconBackground: detailsStyle?.protectedGroupIconBackground,
          onlineStatusIndicatorColor: detailsStyle?.onlineStatusColor);
=======
      StatusIndicatorUtils statusIndicatorUtils =
          StatusIndicatorUtils.getStatusIndicatorFromParams(
              isSelected: false,
              theme: theme,
              user: user,
              group: group,
              disableUsersPresence: disableUsersPresence,
              privateGroupIcon: privateGroupIcon,
              protectedGroupIcon: protectedGroupIcon,
              privateGroupIconBackground:
                  detailsStyle?.privateGroupIconBackground,
              protectedGroupIconBackground:
                  detailsStyle?.protectedGroupIconBackground,
              onlineStatusIndicatorColor: detailsStyle?.onlineStatusColor);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

      backgroundColor = statusIndicatorUtils.statusIndicatorColor;
      icon = statusIndicatorUtils.icon;
    }

    return CometChatListItem(
      key: UniqueKey(),
      id: user?.uid ?? group?.guid,
      avatarName: user?.name ?? group?.name,
      avatarURL: user?.avatar ?? group?.icon,
      title: user?.name ?? group?.name,
      subtitleView: subtitle,
<<<<<<< HEAD
      statusIndicatorColor: disableUsersPresence == false ? backgroundColor : null,
      statusIndicatorStyle: statusIndicatorStyle ?? const StatusIndicatorStyle(),
=======
      statusIndicatorColor:
          disableUsersPresence == false ? backgroundColor : null,
      statusIndicatorStyle:
          statusIndicatorStyle ?? const StatusIndicatorStyle(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      statusIndicatorIcon: icon,
      avatarStyle: AvatarStyle(
          height: avatarStyle?.height ?? 40,
          width: avatarStyle?.width ?? 40,
          background: avatarStyle?.background,
          border: avatarStyle?.border,
          borderRadius: avatarStyle?.borderRadius,
          gradient: avatarStyle?.gradient,
          nameTextStyle: avatarStyle?.nameTextStyle,
          outerBorderRadius: avatarStyle?.outerBorderRadius,
          outerViewBackgroundColor: avatarStyle?.outerViewBackgroundColor,
          outerViewBorder: avatarStyle?.outerViewBorder,
          outerViewSpacing: avatarStyle?.outerViewSpacing,
          outerViewWidth: avatarStyle?.outerViewWidth),
      style: ListItemStyle(
        background: listItemStyle?.background ?? Colors.transparent,
        titleStyle: TextStyle(
                fontSize: theme.typography.name.fontSize,
                fontWeight: theme.typography.name.fontWeight,
                fontFamily: theme.typography.name.fontFamily,
                color: theme.palette.getAccent())
            .merge(listItemStyle?.titleStyle),
        height: listItemStyle?.height ?? 72,
        border: listItemStyle?.border,
        borderRadius: listItemStyle?.borderRadius,
        gradient: listItemStyle?.gradient,
        separatorColor: listItemStyle?.separatorColor,
        width: listItemStyle?.width,
        padding: listItemStyle?.padding,
        margin: listItemStyle?.margin,
      ),
    );
  }

<<<<<<< HEAD
  _getListBaseChild(BuildContext context, CometChatDetailsController detailsController, CometChatTheme theme) {
=======
  _getListBaseChild(BuildContext context,
      CometChatDetailsController detailsController, CometChatTheme theme) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    detailsController.initializeSectionUtilities();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
<<<<<<< HEAD
          if (hideProfile != true) customProfileView ?? _getProfile(context, detailsController, theme),
=======
          if (hideProfile != true)
            customProfileView ?? _getProfile(context, detailsController, theme),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          const SizedBox(
            height: 15,
          ),
          _getListOfSectionData(context, detailsController, theme)
        ],
      ),
    );
  }

<<<<<<< HEAD
  // section view components------------------
  Widget _getSectionData(
      BuildContext context, int index, CometChatDetailsController detailsController, CometChatTheme theme) {
    CometChatDetailsTemplate template = detailsController.templateList[index];
    String sectionId = template.id;

    if (detailsController.optionsMap[sectionId] == null || detailsController.optionsMap[sectionId]!.isEmpty) {
=======
  Widget _getSectionData(BuildContext context, int index,
      CometChatDetailsController detailsController, CometChatTheme theme) {
    CometChatDetailsTemplate template = detailsController.templateList[index];
    String sectionId = template.id;

    if (detailsController.optionsMap[sectionId] == null ||
        detailsController.optionsMap[sectionId]!.isEmpty) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      return const SizedBox();
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (template.title != null && template.title != "")
        SizedBox(
          height: 16,
          child: Text(template.title!.toUpperCase(),
              style: TextStyle(
                      color: theme.palette.getAccent500(),
                      fontSize: theme.typography.text2.fontSize,
                      fontWeight: theme.typography.text2.fontWeight,
                      fontFamily: theme.typography.text2.fontFamily)
                  .merge(template.titleStyle)),
        ),
<<<<<<< HEAD
      ...List.generate(detailsController.optionsMap[sectionId]!.length,
          (index) => _getOption(index, context, sectionId, detailsController, theme)),
      if (template.hideSectionSeparator == true && index != detailsController.templateList.length - 1)
=======
      ...List.generate(
          detailsController.optionsMap[sectionId]!.length,
          (index) =>
              _getOption(index, context, sectionId, detailsController, theme)),
      if (template.hideSectionSeparator == true &&
          index != detailsController.templateList.length - 1)
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        Divider(
          thickness: 1,
          color: theme.palette.getAccent100(),
        )
    ]);
  }

<<<<<<< HEAD
  Widget _getOption(int index, BuildContext context, String sectionId, CometChatDetailsController detailsController,
      CometChatTheme theme) {
    CometChatDetailsOption option = detailsController.optionsMap[sectionId]![index];
=======
  Widget _getOption(int index, BuildContext context, String sectionId,
      CometChatDetailsController detailsController, CometChatTheme theme) {
    CometChatDetailsOption option =
        detailsController.optionsMap[sectionId]![index];
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    return option.customView ??
        SizedBox(
          height: option.height ?? 56,
          child: Center(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () => detailsController.useOption(option, sectionId),
              title: Text(
                option.title ?? "",
                style: option.titleStyle ??
                    TextStyle(
                        fontFamily: theme.typography.name.fontFamily,
                        fontWeight: theme.typography.name.fontWeight,
<<<<<<< HEAD
                        color: sectionId == DetailsTemplateConstants.secondaryActions
=======
                        color: sectionId ==
                                DetailsTemplateConstants.secondaryActions
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                            ? theme.palette.getError()
                            : theme.palette.getPrimary()),
              ),
              trailing: option.tail,
            ),
          ),
        );
  }

<<<<<<< HEAD
  Widget _getListOfSectionData(
      BuildContext context, CometChatDetailsController detailsController, CometChatTheme theme) {
    return Column(children: [
      ...List.generate(
          detailsController.templateList.length, (index) => _getSectionData(context, index, detailsController, theme)),
=======
  Widget _getListOfSectionData(BuildContext context,
      CometChatDetailsController detailsController, CometChatTheme theme) {
    return Column(children: [
      ...List.generate(detailsController.templateList.length,
          (index) => _getSectionData(context, index, detailsController, theme)),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      const SizedBox(
        height: 10,
      ),
      Divider(
        thickness: 1,
        color: theme.palette.getAccent100(),
      ),
    ]);
  }

  //view components end---------------

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final CometChatTheme theme = ctheme ?? cometChatTheme;
=======
    final CometChatTheme theme = this.theme ?? cometChatTheme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    return CometChatListBase(
        title: title ?? Translations.of(context).details,
        showBackButton: showCloseButton ?? true,
        backIcon: closeButtonIcon ??
            Icon(
              Icons.close,
              color: detailsStyle?.closeIconTint ?? theme.palette.getPrimary(),
            ),
        hideSearch: true,
        menuOptions: [
<<<<<<< HEAD
          if (appBarOptions != null && appBarOptions!.isNotEmpty) ...appBarOptions!,
        ],
        ctheme: theme,
=======
          if (appBarOptions != null && appBarOptions!.isNotEmpty)
            ...appBarOptions!,
        ],
        theme: theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        onBack: onBack,
        style: ListBaseStyle(
            height: detailsStyle?.height,
            width: detailsStyle?.width,
            border: detailsStyle?.border,
            borderRadius: detailsStyle?.borderRadius,
<<<<<<< HEAD
            background: detailsStyle?.gradient == null ? detailsStyle?.background : Colors.transparent,
=======
            background: detailsStyle?.gradient == null
                ? detailsStyle?.background
                : Colors.transparent,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            titleStyle: detailsStyle?.titleStyle,
            gradient: detailsStyle?.gradient),
        container: SizedBox(
            child: GetBuilder(
                init: _cometChatDetailsController,
                global: false,
<<<<<<< HEAD
                dispose: (GetBuilderState<CometChatDetailsController> state) => state.controller?.onClose(),
=======
                dispose: (GetBuilderState<CometChatDetailsController> state) =>
                    state.controller?.onClose(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                builder: (CometChatDetailsController detailsController) {
                  detailsController.context = context;
                  detailsController.theme = theme;
                  return _getListBaseChild(context, detailsController, theme);
                })));
  }
}
