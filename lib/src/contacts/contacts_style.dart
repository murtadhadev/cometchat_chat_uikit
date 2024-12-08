import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[ContactsStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatContacts]
class ContactsStyle extends BaseStyles {
  const ContactsStyle({
    this.titleTextStyle,
    this.closeIconTint,
    this.selectedTabColor,
    this.tabColor,
    this.selectedTabTextStyle,
    this.tabTextStyle,
    this.tabBorderRadius,
    this.tabBorder,
    this.tabHeight,
    this.tabWidth,
    super.width,
    super.height,
    super.background,
    super.border,
    super.borderRadius,
    super.gradient,
  });

  ///[closeIconTint] provides color to back icon
  final Color? closeIconTint;

  ///[titleTextStyle] provides styling for title text
  final TextStyle? titleTextStyle;

  ///[selectedTabColor] provides color to the active/selected tab
  final Color? selectedTabColor;

  ///[tabColor] provides color to the inactive/unselected tabs
  final Color? tabColor;

  ///[selectedTabTextStyle] provides styling for the text in the active/selected tab
  final TextStyle? selectedTabTextStyle;

  ///[tabTextStyle] provides styling for the text in the inactive/unselected tab
  final TextStyle? tabTextStyle;

  ///[tabBorder] provides border to tab box
  final BoxBorder? tabBorder;

  ///[tabHeight] provides height to tab box
  final double? tabHeight;

  ///[tabWidth] provides width to tab box
  final double? tabWidth;

  ///[tabBorderRadius] provides borderRadius to tab box
  final double? tabBorderRadius;
}
