import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[MessagesBuilderProtocol] is an interface that defines the structure for fetching the messages.
///It provides a generic [requestBuilder] property and methods [getRequest] and [getSearchRequest] that needs to be overridden.
abstract class MessagesBuilderProtocol
    extends BuilderProtocol<MessagesRequestBuilder, MessagesRequest> {
<<<<<<< HEAD
  const MessagesBuilderProtocol(MessagesRequestBuilder _builder)
      : super(_builder);
=======
  const MessagesBuilderProtocol(super._builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}

///[UIMessagesBuilder] is the default [MessagesBuilderProtocol] used when a custom builder protocol is not passed
class UIMessagesBuilder extends MessagesBuilderProtocol {
<<<<<<< HEAD
  const UIMessagesBuilder(MessagesRequestBuilder _builder) : super(_builder);
=======
  const UIMessagesBuilder(super._builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  @override
  MessagesRequest getRequest() {
    return requestBuilder.build();
  }

  @override
  MessagesRequest getSearchRequest(String val) {
    requestBuilder.searchKeyword = val;
    return requestBuilder.build();
  }
}
