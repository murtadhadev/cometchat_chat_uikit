<<<<<<< HEAD
## 4.3.0 - 21st March 2024

### New
=======
## 4.5.3

**Enhancements**
- Updated `cometchat_uikit_shared` to version `4.4.3`.
- Updated `cometchat_sdk` to version `4.0.13`.

**Fixes**
- Fixed an issue where the overriding onSendButtonTap function would fail to trigger upon tapping the send button after editing a message.

## 4.5.2
**New**
- Introduced real-time updates for the last message and unread count in conversations based on App setting configured via dashboard, ensuring up-to-date information is displayed.

**Enhancements**
- Updated `cometchat_uikit_shared` to version `4.4.2`.
- Updated `cometchat_sdk` to version `4.0.12`.

**Fixes**
- Fixed the issue where the textEditingController property  in `CometChatMessageComposer`  was causing UI  issues within `CometChatMessageList`.

## 4.5.1
**Enhancements**
- Enhanced the CometChatMessageComposer by exposing ‘TextEditingController’, thus improving customization options.

**Fixes**
- Fixed rendering flex issues that were encountered when opening message information for scheduler messages.

## 4.5.0
**Enhancements**
- Updated all 3rd-party plugins versions.
- Resolved all static Dart Analyser suggestions
- Added namespaces in build.gradle to avoid conflicts.

**Fixes**
- Resolved a functional problem where changes in scope were not altering options in the details page in real time.

## 4.4.0
**New**
- User Mention Support:
    - Added support for mentioning users in a conversation using the @ symbol in the message composer.
    - Mentioned users will be highlighted in the message composer, text bubble, and subtitle of conversations in the conversation list if the last message is a text message containing a mention.
  
**Enhancements**
- The `cometchat_sdk` dependency has been updated to version `4.0.10` for better performance.
- The `cometchat_uikit_shared` dependency has been updated to `4.3.0` for better performance
- Upgraded `CometChatMessageList`, `CometChatMessageComposer`, and `CometChatConversations` components to accept an array of `CometChatTextFormatter`, providing a flexible text formatting system based on various regex patterns. This will help in differentiating between user mentions and URLs within a message.

**Fixes**
- Fixed an issue that caused the app to crash when trying to open a thread while a message was still in the sending state.
- Resolved an issue where smart replies were visible in threaded messages even if the last message was not a text message.
- Real-Time Updates:
    - The `GroupsWithMessages` Component not updating when the logged-in user is added to a new group.
    - Members not being removed from the View Members list when kicked, leaving, or being banned from a group.
    - Ensured visibility of form messages received in real-time.
    - Updated the conversation list when a form message is received in real-time.

## 4.3.4
**Fixes**
- Addressed a usability issue by removing the View Profile button in User Profile for streamlined navigation.
- Rectified a functionality issue with the polls, where users were unable to swipe and remove answers.
- Corrected an issue with the threaded messages count being incremented improperly.

**Enhancements**
- Enhanced `ThreadedMessagesConfiguration` and `CometChatThreadedMessages` by adding `messageComposerView`, `messageListView` and `hideMessageComposer` for better configuration control.
- Updated the `CreatePoll` functionality by adding a suffix icon to allow users to easily remove answers.
- Updated `cometchat_uikit_shared` to version `4.2.10`.

## 4.3.3
**Fixes**
- Addressed an issue with duplicate messages appearing in CometChatMessageList when a media message was sent.
- Resolved an issue where smart replies did not disappear after sending or receiving messages.

**Enhancements**
- Upgraded `cometchat_uikit_shared` to version `4.2.9`
- Upgraded `cometchat_sdk` to version `4.0.8`

## 4.3.2
**Fixes**
- Resolved a padding issue with the `CometChatMessageHeader` to improve user experience.
- Corrected an issue where the user name was missing in the typing indicator for a group in the `CometChatConversations` Component.
- Fixed an issue where the user name was not displayed before the last message for a group in the `CometChatConversations` Component.

**Enhancements**
- Upgraded `cometchat_uikit_shared` to version `4.2.8`

## 4.3.1
**Fixes**
- Addressed an issue with user presence not updating correctly in `CometChatConversations` and `CometChatConversationsWithMessages`, ensuring accurate user status.
- Resolved render flex overflow issue in the `headerView` of `CometChatMessageBubble` in `CometChatMessageList` for smoother UI experience.

**Enhancements**
- Upgraded `cometchat_uikit_shared` to version `4.2.7`

## 4.3.0
**New**
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
- support for the new `Reaction` feature from `cometchat_sdk: ^4.0.7`
- `CometChatReactions` will be displayed on `CometChatMessageBubble` using `reactions` property of `TextMessage`, `MediaMessage` and `CustomMessage` in `CometChatMessageList`.
- `CometChatReactionList` can be accessed on long pressing on `CometChatReactions` from `CometChatMessageList`.

<<<<<<< HEAD
### Enhancements
- Upgraded `cometchat_sdk` to version `4.0.7`
- Upgraded `cometchat_uikit_shared` to version `4.2.6`

### Fixes
=======
**Enhancements**
- Upgraded `cometchat_sdk` to version `4.0.7`
- Upgraded `cometchat_uikit_shared` to version `4.2.6`

**Fixes**
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
- Added spacing between `leadingView` and `contentView` of `CometChatMessageBubble` constructed in `CometChatMessageList`.
- Issue of member count not updating when we are performing Group related actions like adding, banning or removing a `GroupMember` or trying to transfer ownership to another group member.
- Fixed pixelation of AI features icon shown in `CometChatMessageComposer`

<<<<<<< HEAD
## 4.2.3 - 5th March 2024

### Fixed
- duplication issue in `CometChatConversations`, `CometChatUsers`, and `CometChatGroups`. 
- real time message receiving when filtering categories and types from `messageRequestBuilder` in `CometChatMessageList`.

## 4.2.2 - 22nd February 2024

### Fixed
- `bubbleView` alignment issue fixed in `CometChatMessageList`
- missing configurations `hideAppBar`, `submitIcon`, `selectionIcon` forwarded from `CometChatUsersWithMessages`, `CometChatGroupsWithMessages`, `CometChatConversationsWithMessages` to `CometChatUsers`, `CometChatGroups`, `CometChatConversations` respectively.


## 4.2.1 - 4th February 2024

### Added
- onSchedulerMessageReceived listeners implemented  in `CometChatMessageList`,`CometChatThreadedMessages`,`SmartReplyExtension`, `AIConversationStarter` , `AIConversationSummary` and `AiSmartReplyExtension`.
- `hideAppBar` property added in `CometChatConversations`  


### Changed

=======
## 4.2.3
**Fixes**
- Duplication issue in `CometChatConversations`, `CometChatUsers`, and `CometChatGroups`. 
- Real time message receiving when filtering categories and types from `messageRequestBuilder` in `CometChatMessageList`.

## 4.2.2
**Fixes**
- `bubbleView` alignment issue fixed in `CometChatMessageList`
- Missing configurations `hideAppBar`, `submitIcon`, `selectionIcon` forwarded from `CometChatUsersWithMessages`, `CometChatGroupsWithMessages`, `CometChatConversationsWithMessages` to `CometChatUsers`, `CometChatGroups`, `CometChatConversations` respectively.


## 4.2.1
**Added**
- onSchedulerMessageReceived listeners implemented  in `CometChatMessageList`,`CometChatThreadedMessages`,`SmartReplyExtension`, `AIConversationStarter` , `AIConversationSummary` and `AiSmartReplyExtension`.
- `hideAppBar` property added in `CometChatConversations`

**Changed**
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.5`
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.2.1`


<<<<<<< HEAD
## 4.1.0 - 14th December 2023

### Added
- components `AIAssistBot` and `AIConversationSummary`
- dateSeparatorStyle in CometChatMessageList
- apiConfiguration in `AIAssistBot`, `AIConversationStarter`, `AIConversationSummary` and `AISmartReplies`
- support for customizing the AI option in `CometChatMessageComposer` using the properties: `aiIcon`, `aiIconURL`, `aiIconPackageName` and `aiOptionStyle`


### Changed

- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.4`
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.7`

## 4.0.5 - 24th November 2023

### Fixed
- removed permission.MANAGE_EXTERNAL_STORAGE

### Changed

- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.5`


## 4.0.4 - 13th November 2023

### Added
- support for Interactive Messages i.e Form Message and Card Message
- support for modifying margin and padding in CometchatListItem

### Changed

- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.3`
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.4`


## 4.0.3 - 18th October 2023

### Fixed
- Emoji keyboard interferes with the virtual home button on iPhone

### Changed
=======
## 4.1.0
**Added**
- Components `AIAssistBot` and `AIConversationSummary`
- DateSeparatorStyle in CometChatMessageList
- ApiConfiguration in `AIAssistBot`, `AIConversationStarter`, `AIConversationSummary` and `AISmartReplies`
- Support for customizing the AI option in `CometChatMessageComposer` using the properties: `aiIcon`, `aiIconURL`, `aiIconPackageName` and `aiOptionStyle`

**Changed**
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.4`
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.7`

## 4.0.5
**Fixes**
- removed permission.MANAGE_EXTERNAL_STORAGE

**Changed**
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.5`

## 4.0.4
**Added**
- Support for Interactive Messages i.e Form Message and Card Message
- Support for modifying margin and padding in CometchatListItem

**Changed**
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.3`
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.4`

## 4.0.3
**Fixes**
- Emoji keyboard interferes with the virtual home button on iPhone

**Changed**
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.3`
- Class name AiExtension changed to  AiExtension
- Changed `smartReplyView` and `conversationStarterView` properties to `customView`

<<<<<<< HEAD
## 4.0.2 - 14th October 2023

### Added
- support for modifying the color of the voice recording button in `CometChatMessageComposer` using `voiceRecordingIconTint` property of `MessageComposerStyle`.
- support for custom attachment options, sound and ability to disable read receipts in `CometChatThreadedMessages`.

### Fixed
- import issues of `AiConversationStarter`.
- theme issues in `CometChatThreadedMessages`.

### Removed
- unnecessary logs

## 4.0.1 - 13th October 2023

### Added

- support for ai features: `AiSmartReply` and `AiConversationStarter`
- `AiSmartReply` provides a list of replies generated using AI for a received message in a conversation
- `AiConversationStarter` gives a list of opening messages generated using AI for starting a conversation when no messages have been exchanged between the participants in a conversation
- a button has been added in `CometChatMessageComposer` tapping on which will list the enabled ai features

### Changed

- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.2`
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.2`

## 4.0.0 - 5th September 2023

### Added

- support for handling events received when disconnected websocket connection is reestablished in `CometChatUsers`, `CometChatGroups`, `CometChatConversations` and `CometChatMessageList`.
- support for handling calling events received in `CometChatConversations` 
- all Extension classes conform to the updated `ExtensionsDataSource` class by implementing new methods `addExtension` and `getExtensionId`.
- properties to configure color of the sticker icon shown in `CometChatMessageComposer`.
- 

### Changed

- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.1`
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.1`
- order of options shown for a message in `CometChatMessageList`
- replaced implementation of `SoundManager` with `CometChatUIKit.soundManager`.
- replaced implementation of `ChatConfigurator.getDataSource()` with `CometChatUIKit.getDataSource()`.

### Removed

- property `hideCreateGroup` from `CometChatGroupsWithMessages`
- Emoji and `emojiIconTint` from `CometChatMessageComposer`
- unused assets
- dead code

### Fixed

- background color of message reactions

## 4.0.0-beta.2 - 7th August 2023

### Added

- support for audio and video calling through CometChat's call ui kit plugin.
=======
## 4.0.2
**Added**
- Support for modifying the color of the voice recording button in `CometChatMessageComposer` using `voiceRecordingIconTint` property of `MessageComposerStyle`.
- Support for custom attachment options, sound and ability to disable read receipts in `CometChatThreadedMessages`.

**Fixes**
- Import issues of `AiConversationStarter`.
- Theme issues in `CometChatThreadedMessages`.

**Removed**
- Unnecessary logs

## 4.0.1
**Added**
- Support for ai features: `AiSmartReply` and `AiConversationStarter`
- `AiSmartReply` provides a list of replies generated using AI for a received message in a conversation
- `AiConversationStarter` gives a list of opening messages generated using AI for starting a conversation when no messages have been exchanged between the participants in a conversation
- Button has been added in `CometChatMessageComposer` tapping on which will list the enabled ai features

**Changed**
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.2`
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.2`

## 4.0.0
**Added**
- Support for handling events received when disconnected websocket connection is reestablished in `CometChatUsers`, `CometChatGroups`, `CometChatConversations` and `CometChatMessageList`.
- Support for handling calling events received in `CometChatConversations` 
- All Extension classes conform to the updated `ExtensionsDataSource` class by implementing new methods `addExtension` and `getExtensionId`.
- Properties to configure color of the sticker icon shown in `CometChatMessageComposer`.

**Changed**
- [CometChat Chat SDK](https://pub.dev/packages/cometchat_sdk) dependency upgraded to `cometchat_sdk: ^4.0.1`
- [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared) dependency upgraded to `cometchat_uikit_shared: ^4.0.1`
- Order of options shown for a message in `CometChatMessageList`
- Replaced implementation of `SoundManager` with `CometChatUIKit.soundManager`.
- Replaced implementation of `ChatConfigurator.getDataSource()` with `CometChatUIKit.getDataSource()`.

**Removed**
- property `hideCreateGroup` from `CometChatGroupsWithMessages`
- Emoji and `emojiIconTint` from `CometChatMessageComposer`
- Unused assets
- Dead code

**Fixes**
- Background color of message reactions

## 4.0.0-beta.2
**Added**
- Support for audio and video calling through CometChat's call ui kit plugin.
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
- Messages information for sent messages.
- Send audio recordings through CometChatMessageComposer.
- Share messages to other applications on the device.

<<<<<<< HEAD
### Changed

- Upgrade kotlin version for native code: 1.7.10.
- Callback function signature for onMessageSend parameter in ComeChatMessageComposer.

### Removed

- Shared module moved to a different package [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared).


## 4.0.0-beta.1 - 22nd June 2023

- 🎉 first release!
=======
**Changed**
- Upgrade kotlin version for native code: 1.7.10.
- Callback function signature for onMessageSend parameter in ComeChatMessageComposer.

**Removed**
- Shared module moved to a different package [cometchat_uikit_shared](https://pub.dev/packages/cometchat_uikit_shared).

## 4.0.0-beta.1
- 🎉 First release!
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
