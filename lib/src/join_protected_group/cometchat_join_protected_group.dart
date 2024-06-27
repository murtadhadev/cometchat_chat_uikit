import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
<<<<<<< HEAD
// import 'package:cometchat_chat_uikit/src/utils/loading_indicator.dart';
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

///[CometChatJoinProtectedGroup] is a component that provides a screen with a form field to join a password protected group
///
/// ```dart
/// CometChatJoinProtectedGroup(
///       group: Group(),
///       closeIcon: Container(),
///       title: 'Join Group',
///       hideCloseButton: false,
///       joinIcon:Icon(),
///       onJoinTap: (group){},
///       joinProtectedGroupStyle: JoinProtectedGroupStyle(
///         background: Colors.white,
///         titleStyle: TextStyle()
///       )
//   );
/// ```
class CometChatJoinProtectedGroup extends StatelessWidget {
  CometChatJoinProtectedGroup(
<<<<<<< HEAD
      {Key? key,
=======
      {super.key,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      required Group group,
      this.title,
      this.description,
      this.passwordPlaceholderText,
      Function({Group group, String password})? onJoinTap,
      this.closeIcon,
      this.joinIcon,
      this.joinProtectedGroupStyle,
      OnError? onError,
<<<<<<< HEAD
      this.ctheme,
      this.onBack,
      String? errorStateText})
      : cometChatJoinProtectedGroupController = CometChatJoinProtectedGroupController(
            group: group,
            onError: onError,
            onJoinTap: onJoinTap,
            background: joinProtectedGroupStyle?.background,
            errorStateText: errorStateText,
            errorTextStyle: joinProtectedGroupStyle?.errorTextStyle),
        super(key: key);
=======
      this.theme,
      this.onBack,
      String? errorStateText})
      : cometChatJoinProtectedGroupController =
            CometChatJoinProtectedGroupController(
                group: group,
                onError: onError,
                onJoinTap: onJoinTap,
                background: joinProtectedGroupStyle?.background,
                errorStateText: errorStateText,
                errorTextStyle: joinProtectedGroupStyle?.errorTextStyle);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[title] sets title of the component
  final String? title;

  ///[description] sets description of the component
  final String? description;

  ///[closeIcon] replace back button
  final Widget? closeIcon;

  ///[joinIcon] replace join icon
  final Widget? joinIcon;

  ///[joinProtectedGroupStyle] set styling properties
  final JoinProtectedGroupStyle? joinProtectedGroupStyle;

  ///[theme] set custom theme
<<<<<<< HEAD
  final CometChatTheme? ctheme;
=======
  final CometChatTheme? theme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[passwordPlaceholderText] placeholder for password input field
  final String? passwordPlaceholderText;

  ///[onBack] callback triggered on closing this screen
  final VoidCallback? onBack;

<<<<<<< HEAD
  final CometChatJoinProtectedGroupController cometChatJoinProtectedGroupController;

  @override
  Widget build(BuildContext context) {
    CometChatTheme theme = ctheme ?? cometChatTheme;
=======
  final CometChatJoinProtectedGroupController
      cometChatJoinProtectedGroupController;

  @override
  Widget build(BuildContext context) {
    CometChatTheme theme = this.theme ?? cometChatTheme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

    return GetBuilder(
        init: cometChatJoinProtectedGroupController,
        global: false,
<<<<<<< HEAD
        dispose: (GetBuilderState<CometChatJoinProtectedGroupController> state) => state.controller?.onClose(),
        builder: (CometChatJoinProtectedGroupController controller) {
          return CometChatListBase(
              title: title ?? Translations.of(context).protected_group,
              ctheme: theme,
=======
        dispose:
            (GetBuilderState<CometChatJoinProtectedGroupController> state) =>
                state.controller?.onClose(),
        builder: (CometChatJoinProtectedGroupController controller) {
          return CometChatListBase(
              title: title ?? Translations.of(context).protectedGroup,
              theme: theme,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
              backIcon: closeIcon ??
                  Image.asset(
                    AssetConstants.close,
                    package: UIConstants.packageName,
<<<<<<< HEAD
                    color: joinProtectedGroupStyle?.closeIconTint ?? theme.palette.getPrimary(),
=======
                    color: joinProtectedGroupStyle?.closeIconTint ??
                        theme.palette.getPrimary(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                  ),
              showBackButton: true,
              onBack: onBack,
              hideSearch: true,
              style: ListBaseStyle(
                  backIconTint: joinProtectedGroupStyle?.closeIconTint,
                  background: joinProtectedGroupStyle?.background,
                  titleStyle: joinProtectedGroupStyle?.titleStyle,
                  gradient: joinProtectedGroupStyle?.gradient,
                  border: joinProtectedGroupStyle?.border,
                  borderRadius: joinProtectedGroupStyle?.borderRadius,
                  width: joinProtectedGroupStyle?.width,
                  height: joinProtectedGroupStyle?.height),
              menuOptions: [
                IconButton(
<<<<<<< HEAD
                    onPressed: () => controller.requestJoinGroup(context, theme),
=======
                    onPressed: () =>
                        controller.requestJoinGroup(context, theme),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                    icon: joinIcon ??
                        Image.asset(
                          AssetConstants.checkmark,
                          package: UIConstants.packageName,
<<<<<<< HEAD
                          color: joinProtectedGroupStyle?.joinIconTint ?? theme.palette.getPrimary(),
=======
                          color: joinProtectedGroupStyle?.joinIconTint ??
                              theme.palette.getPrimary(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                        ))
              ],
              container: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Text(
                      description ??
<<<<<<< HEAD
                          '${Translations.of(context).enter_password_to_access} ${controller.getGroupName(context)}.',
=======
                          '${Translations.of(context).enterPasswordToAccess} ${controller.getGroupName(context)}.',
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                      style: TextStyle(
                        color: theme.palette.getAccent(),
                        fontSize: theme.typography.subtitle1.fontSize,
                        fontFamily: theme.typography.subtitle1.fontFamily,
                        fontWeight: theme.typography.subtitle1.fontWeight,
                      ).merge(joinProtectedGroupStyle?.descriptionTextStyle),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 56,
                      child: TextFormField(
                        key: controller.passwordsFieldKey,
                        keyboardAppearance:
<<<<<<< HEAD
                            theme.palette.mode == PaletteThemeModes.light ? Brightness.light : Brightness.dark,
                        obscureText: true,
                        validator: (value) => controller.validatePassword(value, context),
=======
                            theme.palette.mode == PaletteThemeModes.light
                                ? Brightness.light
                                : Brightness.dark,
                        obscureText: true,
                        validator: (value) =>
                            controller.validatePassword(value, context),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                        controller: controller.textEditingController,
                        maxLength: 16,
                        style: TextStyle(
                          color: theme.palette.getAccent(),
                          fontSize: theme.typography.body.fontSize,
                          fontFamily: theme.typography.body.fontFamily,
                          fontWeight: theme.typography.body.fontWeight,
<<<<<<< HEAD
                        ).merge(joinProtectedGroupStyle?.passwordInputTextStyle),
=======
                        ).merge(
                            joinProtectedGroupStyle?.passwordInputTextStyle),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                        decoration: InputDecoration(
                            counterText: '',
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
<<<<<<< HEAD
                                  color: joinProtectedGroupStyle?.inputBorderColor ?? theme.palette.getAccent100()),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: joinProtectedGroupStyle?.inputBorderColor ?? theme.palette.getAccent100()),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: joinProtectedGroupStyle?.inputBorderColor ?? theme.palette.getAccent100()),
                            ),
                            hintText: passwordPlaceholderText ?? Translations.of(context).group_password,
=======
                                  color: joinProtectedGroupStyle
                                          ?.inputBorderColor ??
                                      theme.palette.getAccent100()),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: joinProtectedGroupStyle
                                          ?.inputBorderColor ??
                                      theme.palette.getAccent100()),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: joinProtectedGroupStyle
                                          ?.inputBorderColor ??
                                      theme.palette.getAccent100()),
                            ),
                            hintText: passwordPlaceholderText ??
                                Translations.of(context).groupPassword,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                            hintStyle: TextStyle(
                              color: theme.palette.getAccent600(),
                              fontSize: theme.typography.body.fontSize,
                              fontFamily: theme.typography.body.fontFamily,
                              fontWeight: theme.typography.body.fontWeight,
<<<<<<< HEAD
                            ).merge(joinProtectedGroupStyle?.passwordPlaceholderStyle)),
=======
                            ).merge(joinProtectedGroupStyle
                                ?.passwordPlaceholderStyle)),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
