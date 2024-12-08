import 'package:flutter/material.dart';
import 'package:cometchat_uikit_shared/cometchat_uikit_shared.dart';

///[CometChatListItem] is a top level container widget
///used internally for displaying each item in components like `CometChatUsers`, `CometChatGroups`, `CometChatConversations`, `CometChatGroupMembers`
/// ```dart
///                CometChatListItem(
///                    avatarName: _user.name,
///                    avatarURL: _user.avatar,
///                    title: _user.name,
///                    statusIndicatorColor: backgroundColor,
///                    statusIndicatorIcon: icon,
///                  );
/// ```
class CometChatListItem extends StatelessWidget {
  const CometChatListItem({
    super.key,
    this.avatarURL,
    this.avatarName,
    this.statusIndicatorColor,
    this.statusIndicatorIcon,
    this.title,
    this.subtitleView,
    this.options,
    this.tailView,
    this.hideSeparator = true,
    this.avatarStyle = const AvatarStyle(),
    this.statusIndicatorStyle = const StatusIndicatorStyle(),
    this.style = const ListItemStyle(),
    this.theme,
    this.id,
  }) : assert(avatarURL != null || avatarName != null);

  ///[avatarURL] sets image url to be shown in avatar
  final String? avatarURL;

  ///[avatarName] sets name  to be shown in avatar if avatarURL is not available
  final String? avatarName;

  ///[statusIndicatorColor] toggle visibility for status indicator
  final Color? statusIndicatorColor;

  ///[statusIndicatorIcon] sets status
  final Widget? statusIndicatorIcon;

  ///[title] sets title
  final String? title;

  ///[subtitleView] gives subtitle view
  final Widget? subtitleView;

  ///[options] set options for
  final List<CometChatOption>? options;

  ///[tailView] sets tail
  final Widget? tailView;

  ///[hideSeparator] toggle separator visibility
  final bool? hideSeparator;

  ///[style] style for DataItem
  final ListItemStyle style;

  final AvatarStyle avatarStyle;

  final StatusIndicatorStyle statusIndicatorStyle;

  ///[theme] can pass custom theme class or dark theme defaultDarkTheme object from CometChatTheme class, by default light theme
  final CometChatTheme? theme;

  ///[id] for list item
  final String? id;

  Widget getAvatar(CometChatTheme theme) {
    return CometChatAvatar(
      image: avatarURL,
      name: avatarName,
      style: AvatarStyle(
        width: avatarStyle.width,
        height: avatarStyle.height,
        background: avatarStyle.background ?? theme.palette.getAccent700(),
        borderRadius: avatarStyle.borderRadius,
        outerBorderRadius: avatarStyle.outerBorderRadius,
        border: avatarStyle.border,
        outerViewBackgroundColor: avatarStyle.outerViewBackgroundColor,
        nameTextStyle: avatarStyle.nameTextStyle ??
            TextStyle(
                color: theme.palette.getBackground(),
                fontSize: theme.typography.name.fontSize,
                fontWeight: theme.typography.name.fontWeight,
                fontFamily: theme.typography.name.fontFamily),
        outerViewBorder: avatarStyle.outerViewBorder,
        outerViewSpacing: avatarStyle.outerViewSpacing,
        outerViewWidth: avatarStyle.outerViewWidth,
      ),
    );
  }

  Widget getStatus(CometChatTheme theme) {
    return CometChatStatusIndicator(
      backgroundImage: statusIndicatorIcon,
      backgroundColor: statusIndicatorColor,
      style: StatusIndicatorStyle(
          border: statusIndicatorStyle.border,
          borderRadius: statusIndicatorStyle.borderRadius,
          height: statusIndicatorStyle.height,
          width: statusIndicatorStyle.width,
          gradient: statusIndicatorStyle.gradient),
    );
  }

  Widget? getTitle(CometChatTheme theme) {
    return Text(
      title ?? "",
      style: style.titleStyle ??
          TextStyle(
              color: theme.palette.getAccent(),
              fontWeight: theme.typography.name.fontWeight,
              fontSize: theme.typography.name.fontSize,
              fontFamily: theme.typography.name.fontFamily),
    );
  }

  Widget? getSubtitle(CometChatTheme theme) {
    return subtitleView;
  }

  @override
  Widget build(BuildContext context) {
    CometChatTheme theme = this.theme ?? cometChatTheme;
    return SwipeTile(
        menuItems: options ?? [],
        key: UniqueKey(),
        id: id,
        child: Container(
            margin: style.margin,
            padding: style.padding,
            alignment: Alignment.center,
            constraints: BoxConstraints(
                minHeight: style.height ?? 73,
                minWidth: style.width ?? double.infinity,),
            decoration: BoxDecoration(
                color: style.gradient == null
                    ? style.background ?? theme.palette.getBackground()
                    : null,
                gradient: style.gradient,
                border: style.border,
                borderRadius: BorderRadius.circular(style.borderRadius ?? 0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CometChatListTile(
                    contentPadding: const EdgeInsets.all(0),
                    height: ( style.height ?? 73)-1,
                    leading: Stack(
                      children: [
                        getAvatar(theme),
                        if (statusIndicatorColor != null ||
                            statusIndicatorIcon != null)
                          Positioned(
                            height: statusIndicatorStyle.height ?? 14,
                            width: statusIndicatorStyle.width ?? 14,
                            right: 0,
                            bottom: 0,
                            child: getStatus(theme),
                          )
                      ],
                    ),
                    title: getTitle(
                      theme,
                    ),
                    subtitle: getSubtitle(theme),
                    trailing: tailView),
                if (hideSeparator == false)
                  Divider(
                    thickness: 1,
                    indent: avatarStyle.width ?? 40,
                    height: 1,
                    color: style.separatorColor,
                  )
              ],
            )));
  }
}

///[_CometChatListTile] is a private class used internally in CometChatListItem
///to display the list tile with leading, title, subtitle and trailing widgets
///such that the widget is not constrained to a specific height
class _CometChatListTile extends StatelessWidget {

  const _CometChatListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.contentPadding,
    this.height,
    this.minLeadingWidth,
  }) : super(key: key);


  ///[leading] widget to be shown at the start of the tile
  final Widget? leading;

  ///[title] widget to be shown as title
  final Widget? title;

  ///[subtitle] widget to be shown as subtitle
  final Widget? subtitle;

  ///[trailing] widget to be shown at the end of the tile
  final Widget? trailing;

  ///[contentPadding] padding for the content
  final EdgeInsetsGeometry? contentPadding;

  ///[height] set tile height
  final double? height;

  ///[minLeadingWidth] set minimum leading width
  final double? minLeadingWidth;


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.transparent,
      padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
      constraints: BoxConstraints(minHeight: height ?? 56.0),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            SizedBox(width: minLeadingWidth ?? 16.0),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title ?? const SizedBox(),
                if (subtitle != null)
                 subtitle!,

              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 16.0),
            trailing!,
          ],
        ],
      ),
    );
  }
}


