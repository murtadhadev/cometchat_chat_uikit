import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[GroupMembersBuilderProtocol] is an interface that defines the structure for fetching the group members.
///It provides a generic [requestBuilder] property and methods [getRequest] and [getSearchRequest] that needs to be overridden.
abstract class GroupMembersBuilderProtocol
    extends BuilderProtocol<GroupMembersRequestBuilder, GroupMembersRequest> {
<<<<<<< HEAD
  const GroupMembersBuilderProtocol(GroupMembersRequestBuilder _builder)
      : super(_builder);
=======
  const GroupMembersBuilderProtocol(super._builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}

///[UIGroupMembersBuilder] is the default [GroupMembersBuilderProtocol] used when a custom builder protocol is not passed
class UIGroupMembersBuilder extends GroupMembersBuilderProtocol {
<<<<<<< HEAD
  const UIGroupMembersBuilder(GroupMembersRequestBuilder _builder)
      : super(_builder);
=======
  const UIGroupMembersBuilder(super._builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  @override
  GroupMembersRequest getRequest() {
    return requestBuilder.build();
  }

  @override
  GroupMembersRequest getSearchRequest(String val) {
    requestBuilder.searchKeyword = val;
    return requestBuilder.build();
  }
}
