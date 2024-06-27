import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../cometchat_chat_uikit.dart';
import '../../../cometchat_chat_uikit.dart' as cc;

///[CometChatGroups] is a component that displays a list of groups available in the app with the help of [CometChatListBase] and [CometChatListItem]
///fetched groups are listed down alphabetically and in order of recent activity
///groups are fetched using [GroupsBuilderProtocol] and [GroupsRequestBuilder]
///
/// ```dart
///   CometChatGroups(
///   groupsStyle: GroupsStyle(),
/// );
/// ```
///

class CometChatGroups extends StatefulWidget {
  const CometChatGroups(
<<<<<<< HEAD
      {Key? key,
=======
      {super.key,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      this.groupsProtocol,
      this.subtitleView,
      this.listItemView,
      this.groupsStyle = const GroupsStyle(),
      this.controller,
      this.theme,
      this.searchPlaceholder,
      this.backButton,
      this.showBackButton = true,
      this.searchBoxIcon,
      this.hideSearch = false,
      this.selectionMode,
      this.onSelection,
      this.title,
      this.errorStateText,
      this.emptyStateText,
      this.stateCallBack,
      this.groupsRequestBuilder,
      this.hideError,
      this.loadingStateView,
      this.emptyStateView,
      this.errorStateView,
      this.listItemStyle,
      this.options,
      this.avatarStyle,
      this.statusIndicatorStyle,
      this.hideSeparator = false,
      this.appBarOptions,
      this.passwordGroupIcon,
      this.privateGroupIcon,
      this.activateSelection,
      this.onBack,
      this.onItemTap,
      this.onItemLongPress,
      this.onError,
      this.submitIcon,
      this.selectionIcon,
      this.hideAppbar = false,
<<<<<<< HEAD
      this.controllerTag})
      : super(key: key);
=======
      this.controllerTag});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[groupsProtocol] set custom groups request builder protocol
  final GroupsBuilderProtocol? groupsProtocol;

  ///[groupsRequestBuilder] custom request builder
  final GroupsRequestBuilder? groupsRequestBuilder;

  ///[subtitleView] to set subtitle for each group
  final Widget? Function(BuildContext, Group)? subtitleView;

  ///[listItemView] set custom view for each group
  final Widget Function(Group)? listItemView;

  ///[groupsStyle] sets style
  final GroupsStyle groupsStyle;

  ///[controller] sets controller for the list
  final ScrollController? controller;

  ///[options]  set options which will be visible at slide of each banned member
<<<<<<< HEAD
  final List<CometChatOption>? Function(Group group, CometChatGroupsController controller, BuildContext context)?
      options;
=======
  final List<CometChatOption>? Function(Group group,
      CometChatGroupsController controller, BuildContext context)? options;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[searchPlaceholder] placeholder text of search input
  final String? searchPlaceholder;

  ///[backButton] back button
  final Widget? backButton;

  ///[showBackButton] switch on/off back button
  final bool showBackButton;

  ///[searchBoxIcon] search icon
  final Widget? searchBoxIcon;

  ///[hideSearch] switch on/ff search input
  final bool hideSearch;

  ///[theme] can pass custom theme
  final CometChatTheme? theme;

  ///[selectionMode] specifies mode groups module is opening in
  final SelectionMode? selectionMode;

  ///[onSelection] function will be performed
  final Function(List<Group>?)? onSelection;

  ///[title] sets title for the list
  final String? title;

  ///[emptyStateText] text to be displayed when the list is empty
  final String? emptyStateText;

  ///[errorStateText] text to be displayed when error occur
  final String? errorStateText;

  ///[loadingStateView] returns view for loading state
  final WidgetBuilder? loadingStateView;

  ///[emptyStateView] returns view for empty state
  final WidgetBuilder? emptyStateView;

  ///[errorStateView] returns view for error state behind the dialog
  final WidgetBuilder? errorStateView;

  ///[hideError] toggle visibility of error dialog
  final bool? hideError;

  ///[stateCallBack] to access controller functions  from parent pass empty reference of  CometChatGroupsController object
  final Function(CometChatGroupsController controller)? stateCallBack;

  ///[listItemStyle] style for every list item
  final ListItemStyle? listItemStyle;

  ///[avatarStyle] set style for avatar
  final AvatarStyle? avatarStyle;

  ///[statusIndicatorStyle] set style for status indicator
  final StatusIndicatorStyle? statusIndicatorStyle;

  ///[appBarOptions] list of options to be visible in app bar
  final List<Widget> Function(BuildContext context)? appBarOptions;

  ///[hideSeparator]
  final bool hideSeparator;

  ///[passwordGroupIcon] sets icon in status indicator for password group
  final Widget? passwordGroupIcon;

  ///[privateGroupIcon] sets icon in status indicator for private group
  final Widget? privateGroupIcon;

  ///[activateSelection] lets the widget know if groups are allowed to be selected
  final ActivateSelection? activateSelection;

  ///[onBack] callback triggered on closing this screen
  final VoidCallback? onBack;

  ///[onItemTap] callback triggered on tapping a group item
  final Function(BuildContext, Group)? onItemTap;

  ///[onItemLongPress] callback triggered on pressing for long on a group item
  final Function(BuildContext, Group)? onItemLongPress;

  ///[selectionIcon] will change selection icon
  final Widget? selectionIcon;

  ///[submitIcon] will override the default submit icon
  final Widget? submitIcon;

  ///[hideAppbar] toggle visibility for app bar
  final bool? hideAppbar;

  ///Group tag to create from , if this is passed its parent responsibility to close this
  final String? controllerTag;

  ///[onError] callback triggered on error
  final OnError? onError;

  @override
  State<CometChatGroups> createState() => _CometChatGroupsState();
}

class _CometChatGroupsState extends State<CometChatGroups> {
  ///property to be set internally by using passed parameters [groupsProtocol] ,[selectionMode] ,[options]
  ///these are passed to the [CometChatGroupsController] which is responsible for the business logic
  late CometChatGroupsController groupsController;
  late String _currentDateTime;
  final RxBool _isSelectionOn = false.obs;

  @override
  void initState() {
<<<<<<< HEAD
    // TODO: implement initState
    super.initState();
    _currentDateTime = DateTime.now().millisecondsSinceEpoch.toString();

    if (widget.controllerTag != null && Get.isRegistered<CometChatGroupsController>(tag: widget.controllerTag)) {
      groupsController = Get.find<CometChatGroupsController>(tag: widget.controllerTag);
=======
    super.initState();
    _currentDateTime = DateTime.now().millisecondsSinceEpoch.toString();

    if (widget.controllerTag != null &&
        Get.isRegistered<CometChatGroupsController>(
            tag: widget.controllerTag)) {
      groupsController =
          Get.find<CometChatGroupsController>(tag: widget.controllerTag);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    } else {
      groupsController = Get.put<CometChatGroupsController>(
          CometChatGroupsController(
              groupsBuilderProtocol: widget.groupsProtocol ??
                  UIGroupsBuilder(
                    widget.groupsRequestBuilder ?? GroupsRequestBuilder(),
                  ),
              mode: widget.selectionMode,
              theme: widget.theme ?? cometChatTheme,
              onError: widget.onError),
<<<<<<< HEAD
          tag: widget.controllerTag ?? "default_tag_for_groups_$_currentDateTime");
    }

    debugPrint("init state is called in cometchat groups default_tag_for_groups_$_currentDateTime");
=======
          tag: widget.controllerTag ??
              "default_tag_for_groups_$_currentDateTime");
    }

    debugPrint(
        "init state is called in cometchat groups default_tag_for_groups_$_currentDateTime");
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

  @override
  void dispose() {
    if (widget.controllerTag == null) {
<<<<<<< HEAD
      Get.delete<CometChatGroupsController>(tag: "default_tag_for_groups_$_currentDateTime");
=======
      Get.delete<CometChatGroupsController>(
          tag: "default_tag_for_groups_$_currentDateTime");
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
    debugPrint("dispose is called in cometchat groups");
    super.dispose();
  }

<<<<<<< HEAD
  Widget getDefaultItem(
      Group group, CometChatGroupsController controller, CometChatTheme theme, int index, BuildContext context) {
    Widget? subtitle;

    StatusIndicatorUtils statusIndicatorUtils = StatusIndicatorUtils.getStatusIndicatorFromParams(
        theme: theme,
        group: group,
        privateGroupIconBackground: widget.groupsStyle.privateGroupIconBackground,
        protectedGroupIconBackground: widget.groupsStyle.passwordGroupIconBackground,
        privateGroupIcon: widget.privateGroupIcon,
        protectedGroupIcon: widget.passwordGroupIcon,
        isSelected: controller.selectionMap[group.guid] != null,
        selectIcon: widget.selectionIcon,
        selectIconTint: widget.groupsStyle.selectionIconTint);
=======
  Widget getDefaultItem(Group group, CometChatGroupsController controller,
      CometChatTheme theme, int index, BuildContext context) {
    Widget? subtitle;

    StatusIndicatorUtils statusIndicatorUtils =
        StatusIndicatorUtils.getStatusIndicatorFromParams(
            theme: theme,
            group: group,
            privateGroupIconBackground:
                widget.groupsStyle.privateGroupIconBackground,
            protectedGroupIconBackground:
                widget.groupsStyle.passwordGroupIconBackground,
            privateGroupIcon: widget.privateGroupIcon,
            protectedGroupIcon: widget.passwordGroupIcon,
            isSelected: controller.selectionMap[group.guid] != null,
            selectIcon: widget.selectionIcon,
            selectIconTint: widget.groupsStyle.selectionIconTint);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    if (widget.subtitleView != null) {
      subtitle = widget.subtitleView!(context, group);
    } else {
      subtitle = Text(
        "${group.membersCount} ${cc.Translations.of(context).members}",
        style: TextStyle(
                fontSize: theme.typography.subtitle1.fontSize,
                fontWeight: theme.typography.subtitle1.fontWeight,
                fontFamily: theme.typography.subtitle1.fontFamily,
                color: theme.palette.getAccent600())
            .merge(widget.groupsStyle.subtitleTextStyle),
      );
    }

    Color? backgroundColor = statusIndicatorUtils.statusIndicatorColor;
    Widget? icon = statusIndicatorUtils.icon;

    return GestureDetector(
      onLongPress: () {
        if (widget.activateSelection == ActivateSelection.onLongClick &&
            controller.selectionMap.isEmpty &&
<<<<<<< HEAD
            !(widget.selectionMode == null || widget.selectionMode == SelectionMode.none)) {
=======
            !(widget.selectionMode == null ||
                widget.selectionMode == SelectionMode.none)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          controller.onTap(group);

          _isSelectionOn.value = true;
        } else if (widget.onItemLongPress != null) {
          widget.onItemLongPress!(context, group);
        }
      },
      onTap: () {
        if (widget.activateSelection == ActivateSelection.onClick ||
<<<<<<< HEAD
            (widget.activateSelection == ActivateSelection.onLongClick && controller.selectionMap.isNotEmpty) &&
                !(widget.selectionMode == null || widget.selectionMode == SelectionMode.none)) {
=======
            (widget.activateSelection == ActivateSelection.onLongClick &&
                    controller.selectionMap.isNotEmpty) &&
                !(widget.selectionMode == null ||
                    widget.selectionMode == SelectionMode.none)) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          controller.onTap(group);
          if (controller.selectionMap.isEmpty) {
            _isSelectionOn.value = false;
          } else if (widget.activateSelection == ActivateSelection.onClick &&
              controller.selectionMap.isNotEmpty &&
              _isSelectionOn.value == false) {
            _isSelectionOn.value = true;
          }
        }
        if (widget.onItemTap != null) {
          widget.onItemTap!(context, group);
        }
      },
      child: CometChatListItem(
        id: group.guid,
        avatarName: group.name,
        avatarURL: group.icon,
        title: group.name,
        key: UniqueKey(),
        subtitleView: subtitle,
        avatarStyle: widget.avatarStyle ?? const AvatarStyle(),
        statusIndicatorColor: backgroundColor,
        statusIndicatorIcon: icon,
<<<<<<< HEAD
        statusIndicatorStyle: widget.statusIndicatorStyle ?? const StatusIndicatorStyle(),
        ctheme: theme,
        options: widget.options != null ? widget.options!(group, controller, context) : null,
=======
        statusIndicatorStyle:
            widget.statusIndicatorStyle ?? const StatusIndicatorStyle(),
        theme: theme,
        options: widget.options != null
            ? widget.options!(group, controller, context)
            : null,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        style: ListItemStyle(
          background: widget.listItemStyle?.background ?? Colors.transparent,
          titleStyle: TextStyle(
                  fontSize: theme.typography.name.fontSize,
                  fontWeight: theme.typography.name.fontWeight,
                  fontFamily: theme.typography.name.fontFamily,
                  color: theme.palette.getAccent())
              .merge(widget.listItemStyle?.titleStyle),
          height: widget.listItemStyle?.height ?? 72,
          border: widget.listItemStyle?.border,
          borderRadius: widget.listItemStyle?.borderRadius,
          gradient: widget.listItemStyle?.gradient,
          separatorColor: widget.listItemStyle?.separatorColor,
          width: widget.listItemStyle?.width,
          padding: widget.listItemStyle?.padding,
          margin: widget.listItemStyle?.margin,
        ),
        hideSeparator: widget.hideSeparator,
      ),
    );
  }

<<<<<<< HEAD
  Widget getListItem(
      Group group, CometChatGroupsController controller, CometChatTheme theme, int index, BuildContext context) {
=======
  Widget getListItem(Group group, CometChatGroupsController controller,
      CometChatTheme theme, int index, BuildContext context) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (widget.listItemView != null) {
      return widget.listItemView!(group);
    } else {
      return getDefaultItem(group, controller, theme, index, context);
    }
  }

  Widget _getLoadingIndicator(BuildContext context, CometChatTheme theme) {
    if (widget.loadingStateView != null) {
      return Center(child: widget.loadingStateView!(context));
    } else {
      return Center(
        child: Image.asset(
          AssetConstants.spinner,
          package: UIConstants.packageName,
<<<<<<< HEAD
          color: widget.groupsStyle.loadingIconTint ?? theme.palette.getAccent600(),
=======
          color: widget.groupsStyle.loadingIconTint ??
              theme.palette.getAccent600(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        ),
      );
    }
  }

  Widget _getNoGroupIndicator(BuildContext context, CometChatTheme theme) {
    if (widget.emptyStateView != null) {
      return Center(child: widget.emptyStateView!(context));
    } else {
      return Center(
        child: Text(
<<<<<<< HEAD
          widget.emptyStateText ?? cc.Translations.of(context).no_groups_found,
=======
          widget.emptyStateText ?? cc.Translations.of(context).noGroupsFound,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          style: widget.groupsStyle.emptyTextStyle ??
              TextStyle(
                  fontSize: theme.typography.title1.fontSize,
                  fontWeight: theme.typography.title1.fontWeight,
                  color: theme.palette.getAccent400()),
        ),
      );
    }
  }

<<<<<<< HEAD
  _showErrorDialog(String errorText, BuildContext context, CometChatTheme theme, CometChatGroupsController controller) {
=======
  _showErrorDialog(String errorText, BuildContext context, CometChatTheme theme,
      CometChatGroupsController controller) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    showCometChatConfirmDialog(
        context: context,
        messageText: Text(
          widget.errorStateText ?? errorText,
          style: widget.groupsStyle.errorTextStyle ??
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
  _showError(CometChatGroupsController controller, BuildContext context, CometChatTheme theme) {
    if (widget.hideError == true) return;
    String error;
    if (controller.error != null && controller.error is CometChatException) {
      error = Utils.getErrorTranslatedText(context, (controller.error as CometChatException).code);
    } else {
      error = cc.Translations.of(context).no_groups_found;
=======
  _showError(CometChatGroupsController controller, BuildContext context,
      CometChatTheme theme) {
    if (widget.hideError == true) return;
    String error;
    if (controller.error != null && controller.error is CometChatException) {
      error = Utils.getErrorTranslatedText(
          context, (controller.error as CometChatException).code);
    } else {
      error = cc.Translations.of(context).noGroupsFound;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }
    if (widget.errorStateView != null) {}
    _showErrorDialog(error, context, theme, controller);
  }

  Widget _getList(BuildContext context, CometChatTheme theme) {
    return GetBuilder<CometChatGroupsController>(
      tag: widget.controllerTag ?? "default_tag_for_groups_$_currentDateTime",
      builder: (CometChatGroupsController value) {
        value.context = context;
        if (value.hasError == true) {
<<<<<<< HEAD
          WidgetsBinding.instance.addPostFrameCallback((_) => _showError(value, context, theme));
=======
          WidgetsBinding.instance
              .addPostFrameCallback((_) => _showError(value, context, theme));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

          if (widget.errorStateView != null) {
            return widget.errorStateView!(context);
          }

          return _getLoadingIndicator(context, theme);
        } else if (value.isLoading == true && (value.list.isEmpty)) {
          return _getLoadingIndicator(context, theme);
        } else if (value.list.isEmpty) {
          //----------- empty list widget-----------
          return _getNoGroupIndicator(context, theme);
        } else {
          return ListView.builder(
            controller: widget.controller,
<<<<<<< HEAD
            itemCount: value.hasMoreItems ? value.list.length + 1 : value.list.length,
=======
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
                  getListItem(value.list[index], value, theme, index, context),
                ],
              );
            },
          );
        }
      },
    );
  }

<<<<<<< HEAD
  Widget getSubmitWidget(CometChatGroupsController groupsController, CometChatTheme theme) {
=======
  Widget getSubmitWidget(
      CometChatGroupsController groupsController, CometChatTheme theme) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (_isSelectionOn.value) {
      return IconButton(
          onPressed: () {
            List<Group>? groups = groupsController.getSelectedList();
            if (widget.onSelection != null) {
              widget.onSelection!(groups);
            }
          },
          icon: widget.submitIcon ??
              Image.asset(AssetConstants.checkmark,
                  package: UIConstants.packageName,
<<<<<<< HEAD
                  color: widget.groupsStyle.submitIconTint ?? theme.palette.getPrimary()));
=======
                  color: widget.groupsStyle.submitIconTint ??
                      theme.palette.getPrimary()));
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
    CometChatTheme theme = widget.theme ?? cometChatTheme;

    if (widget.stateCallBack != null) {
<<<<<<< HEAD
      WidgetsBinding.instance.addPostFrameCallback((_) => widget.stateCallBack!(groupsController));
=======
      WidgetsBinding.instance
          .addPostFrameCallback((_) => widget.stateCallBack!(groupsController));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }

    return CometChatListBase(
        title: widget.title ?? cc.Translations.of(context).groups,
        hideSearch: widget.hideSearch,
        backIcon: widget.backButton,
        onBack: widget.onBack,
        placeholder: widget.searchPlaceholder,
        showBackButton: widget.showBackButton,
        searchBoxIcon: widget.searchBoxIcon,
        onSearch: groupsController.onSearch,
<<<<<<< HEAD
        ctheme: widget.theme,
=======
        theme: widget.theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
        hideAppBar: widget.hideAppbar,
        menuOptions: [
          if (widget.appBarOptions != null) ...widget.appBarOptions!(context),
          Obx(
            () => getSubmitWidget(groupsController, theme),
          )
        ],
        style: ListBaseStyle(
<<<<<<< HEAD
            background: widget.groupsStyle.gradient == null ? widget.groupsStyle.background : Colors.transparent,
=======
            background: widget.groupsStyle.gradient == null
                ? widget.groupsStyle.background
                : Colors.transparent,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
            titleStyle: widget.groupsStyle.titleStyle,
            gradient: widget.groupsStyle.gradient,
            height: widget.groupsStyle.height,
            width: widget.groupsStyle.width,
            backIconTint: widget.groupsStyle.backIconTint,
            searchIconTint: widget.groupsStyle.searchIconTint,
            border: widget.groupsStyle.border,
            borderRadius: widget.groupsStyle.borderRadius,
            searchTextStyle: widget.groupsStyle.searchTextStyle,
            searchPlaceholderStyle: widget.groupsStyle.searchPlaceholderStyle,
            searchBorderColor: widget.groupsStyle.searchBorderColor,
            searchBoxRadius: widget.groupsStyle.searchBorderRadius,
            searchBoxBackground: widget.groupsStyle.searchBackground,
            searchBorderWidth: widget.groupsStyle.searchBorderWidth),
        container: _getList(context, theme));
  }
}
