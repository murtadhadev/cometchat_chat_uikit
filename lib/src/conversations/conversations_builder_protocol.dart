import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[ConversationsBuilderProtocol] is an interface that defines the structure for fetching the conversation.
///It provides a generic [requestBuilder] property and methods [getRequest] and [getSearchRequest] that needs to be overridden.
<<<<<<< HEAD
abstract class ConversationsBuilderProtocol extends BuilderProtocol<ConversationsRequestBuilder, ConversationsRequest> {
  const ConversationsBuilderProtocol(ConversationsRequestBuilder builder) : super(builder);
=======
abstract class ConversationsBuilderProtocol
    extends BuilderProtocol<ConversationsRequestBuilder, ConversationsRequest> {
  const ConversationsBuilderProtocol(super.builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}

///[UIConversationsBuilder] is the default [ConversationsBuilderProtocol] used when a custom conversations builder protocol is not passed
class UIConversationsBuilder extends ConversationsBuilderProtocol {
  ///the constructor takes [ConversationsRequestBuilder] as parameter and assigns to [requestBuilder]
<<<<<<< HEAD
  const UIConversationsBuilder(ConversationsRequestBuilder builder) : super(builder);
=======
  const UIConversationsBuilder(super.builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  /// [getRequest] method is used to get the request body for fetching conversations
  @override
  ConversationsRequest getRequest() {
    return requestBuilder.build();
  }

  /// [getSearchRequest] method will return the same result as [getRequest] method as Conversations cannot be searched
  @override
  ConversationsRequest getSearchRequest(String val) {
<<<<<<< HEAD
    //requestBuilder.searchKeyword = val;
=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    return requestBuilder.build();
  }
}
