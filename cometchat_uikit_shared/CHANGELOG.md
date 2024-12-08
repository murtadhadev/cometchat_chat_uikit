## 4.4.9

**New**
- Added event listeners `onMessagesDeliveredToAll` and `onMessagesReadByAll` to notify sender of a message when their group messages are delivered or read by every other member in the group.

**Enhancements**
- Updated `cometchat_sdk` to version `4.0.17`.

**Fixes**
- Fixed an issue where the actual height of `CometChatAvatar` was being restricted by `CometChatListItem`.


## 4.4.8

**Fixes**
- Fixed an issue where the `sendCustomInteractiveMessage()` function was missing.
- Fixed an issue where the `listItemStyle` was not working in `CometChatReactionList`.


## 4.4.7:

**Removals**
- Removed unnecessary location permission.


## 4.4.6

**Enhancements**
- Updated `cometchat_sdk` to version `4.0.16`.

**Fixes**
- Resolved an issue where component colors weren't applied to the safe area, ensuring seamless visual consistency.
- Fixed an issue where height was not being applied to `SectionSeparator` shown in `CometChatUsersWithMessages`.

## 4.4.5

**Fixes**
- Resolved an issue where overriding the `inputTextStyle` in the `messageComposerStyle` prop was not functioning correctly.
- Resolved an issue where `border` and `border-radius` style were not being applied to the `CometChatListBase` component.

## 4.4.4

**Enhancements**
- Introduced an enum `MentionsVisibility` in `CometChatMentionsFormatter` to control the visibility of the list of users who can be mentioned.
- Updated `cometchat_sdk` to version `4.0.14`.

**Fixes**
- Fixed an issue where `separatorColor` was not overriding in `CometChatListItem`.

## 4.4.3

**Enhancements**
- Updated `cometchat_sdk` to version `4.0.13`

**Fixes**
- Fixed a problem where auto logging the user into the app did not reload the call extensions and default extensions. This fix ensures that all necessary extensions are loaded correctly upon login, enhancing the app's reliability and user experience.

## 4.4.2

**New**
- Introduced real-time updates for the last message and unread count in conversations based on App setting configured via dashboard, ensuring up-to-date information is displayed.

**Enhancements**
- Updated `cometchat_sdk` to version `4.0.12`

## 4.4.1

**Fixes**
- Rectified a critical issue that was causing the scheduler bubble to crash, enhancing stability.

## 4.4.0
**Enhancements**
- Updated all 3rd-party plugins versions.
- Resolved all static Dart Analyser suggestions
- Added namespaces in build.gradle to avoid conflicts.

**Fixes**
- Fixed a critical issue that was causing the app to crash within the scheduler message bubble.

## 4.3.0
**New**
- Text Formatters:
    - Introduced `CometChatMentionsFormatter` to format a text if it contains a mention of a user.
    - Introduced `CometChatUrlFormatter` to format a text if it contains a URL.
    - Introduced `CometChatEmailFormatter` to format a text if it contains an email.
    - Introduced `CometChatPhoneNumberFormatter` to format a text if it contains a phone number.
    - Introduced `CometChatTextFormatter` an abstract class that structure for creating custom text formatters to format text in the message composer and message bubbles and last message of conversations in conversation list.
    - Added `CustomTextEditingController` to handle custom formatting of text in the message composer.
    - Added `AttributedText` to handle custom formatting of text wherever formatting is required.

**Enhancements**
- Updated `cometchat_sdk` to version `4.0.10`
- Added method `getConversationSubtitle()` in Data Source which returns a Widget that would be displayed as the subtitle for conversations shown in `CometChatConversations`
- Introduced a new parameter `additionalConfigurations` in the methods `getTextMessageContentView()` and `getTextMessageBubble()` to enable developers to customize the formatting of text in `CometChatTextBubble` by passing a list of `CometChatTextFormatter` objects to the `textFormatters` property of `AdditionalConfigurations`.

## 4.2.10
**Fixes**
- Addressed a usability issue by removing the View Profile button in User Profile for streamlined navigation.
- Resolved an issue related to incorrect timezone display for Daylight Saving Time to ensure timely and correct information.

## 4.2.9
**Enhancements**
- Reordered the message options, such as react, reply, delete, etc., to improve the overall usability and user experience.
- Updated `cometchat_sdk` to version `4.0.8`

## 4.2.8
**New**
- Added support for the Hungarian Language in the localization feature.

**Enhancements**
- All `send*Message()` methods of the `CometChatUIkit` class now automatically set the logged-in user as the `sender` for the message object provided as an argument, regardless of any other value set as the sender.
- All `send*Message()` methods of the `CometChatUIkit` class will now automatically set a random `muid` if it is not already set with the message object.

## 4.2.7
**New**
- Added refresh icon in `CometChatImageBubble` and `ImageViewer`
- Introduced a placeholder in `ImageViewer`

**Fixes**
- Addressed a problem where the image view state was not refreshing from the error state, ensuring a smooth viewing experience.

## 4.2.6
**New**
- Added property `loadingIcon` in `CometChatReactionList` and `ReactionsConfiguration` to override the default icon shown when the reactions are being fetched
- Added properties `margin` and `padding` in `ReactionsStyle`

**Fixes**
- Fixed pixelation of AI features icon shown in `CometChatMessageComposer`

## 4.2.5
**New**
- Added `CometChatReactions` component to display reactions in `CometChatMessageBubble`,  using `ReactionCount` provided with the Reactions feature from `cometchat_sdk: ^4.0.7` 
- Added `ReactionsStyle` to customize the UI of this `CometChatReactions`, and `ReactionsConfiguration` to further configure the appearance and behavior of this component
- Added `CometChatReactionList` component to fetch and display reactions made on a particular message, using `ReactionsRequest` provided with the Reactions feature from `cometchat_sdk: ^4.0.7` 
- Added `ReactionListStyle` to customize the UI of this component, and `ReactionListConfiguration` to further configure the appearance and behavior of this component
- Added `icon` property in `CometChatButton`

̆**Enhancements**
- Upgraded `cometchat_sdk` to version `4.0.7`

## 4.2.4
**Fixed**
- `CET` and `GMT` TimeZone fix while initializing time zone

## 4.2.3
**Fixed**
- Media picker crash on Android devices when `targetSdkVersion` is 33 and above
- `CometChatMediaRecorder` emitting events even after being disposed on Android devices

## 4.2.2
**Added**
- New Widgets: `CometChatSchedulerBubble` for scheduling events, `CometChatTimeSlotSelector` for generating time slots
- New style classes: `SchedulerBubbleStyle`, `TimeSlotSelectorStyle`
- Support for selecting date time in `CometChatFormBubble` and updated overall UI of `CometChatFormBubble`

**Changed**
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.5`

**Fixed**
- Fixed issue of captions and tags not being passed in `MediaMessage` when using media picker on iOS devices

## 4.1.0
**Added**
- Support for downloading videos in  `CometChatCallLogRecordings` widget of [cometchat_calls_uikit](https://pub.dev/packages/cometchat_calls_uikit)
- Methods `copyWith` and `merge` in `DateStyle`

**Changed**
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.4`

## 4.0.5
**Fixed**
- Removed permission.MANAGE_EXTERNAL_STORAGE

## 4.0.4
**Added**
- Added support for Interactive messages 
- New Widgets: `CometChatQuickView`, `CometChatSingleSelect`, `CometChatFormBubble`
- New style classes: `QuickViewStyle`, `FormBubbleStyle`
- Introduced margin and padding in `CometChatListItem` via `ListItemStyle`

**Changed**
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.3`

**Fixed**
- Message sending failed when file path contains space when using media picker on iOS devices

## 4.0.3
**Changed**
- Name of class `AiExtension` changed to `AIExtension`. `AIExtension` is the protocol layer for enabling the AI features in the CometChat Chat UI Kit.

## 4.0.2
**Added**
- Support for ai features in `AiExtension`
- New ui events `ccComposeMessage` and `onAiFeatureTapped`  in `CometChatUIEvents`, and its listeners in `CometChatUIEventListener`

**Changed**
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.2`

## 4.0.1
**Added**
- Code level documentation

## 4.0.0
**Added**
- Properties in `UIKitSettings` to override admin and client host urls
- Methods `addExtension` and `getExtensionId` in `ExtensionsDataSource`
- Localized Strings

**Changed**
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.1`
- [GetX](https://pub.dev/packages/get) dependency upgraded to `get: ^4.6.5`
- Order of options shown for a message
- `SoundManager` converted to a singleton class

**Removed**
- Unused imports
- Dead code

**Fixed**
- Size of media recorder icon in message composer

## 4.0.0-beta.1
- Initial release
