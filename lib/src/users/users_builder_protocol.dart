import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[UsersBuilderProtocol] is an interface that defines the structure for fetching the users.
///It provides a generic [requestBuilder] property and methods [getRequest] and [getSearchRequest] that needs to be overridden.
abstract class UsersBuilderProtocol
    extends BuilderProtocol<UsersRequestBuilder, UsersRequest> {
<<<<<<< HEAD
  const UsersBuilderProtocol(UsersRequestBuilder _builder) : super(_builder);
=======
  const UsersBuilderProtocol(super._builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}

///[UIUsersBuilder] is the default [UsersBuilderProtocol] used when a custom builder protocol is not passed
class UIUsersBuilder extends UsersBuilderProtocol {
<<<<<<< HEAD
  const UIUsersBuilder(UsersRequestBuilder _builder) : super(_builder);
=======
  const UIUsersBuilder(super._builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  @override
  UsersRequest getRequest() {
    return requestBuilder.build();
  }

  @override
  UsersRequest getSearchRequest(String val) {
    requestBuilder.searchKeyword = val;
    return requestBuilder.build();
  }
}
