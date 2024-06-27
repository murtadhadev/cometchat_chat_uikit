import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[GroupsBuilderProtocol] is an interface that defines the structure for fetching the groups.
///It provides a generic [requestBuilder] property and methods [getRequest] and [getSearchRequest] that needs to be overridden.
abstract class GroupsBuilderProtocol
    extends BuilderProtocol<GroupsRequestBuilder, GroupsRequest> {
<<<<<<< HEAD
  const GroupsBuilderProtocol(GroupsRequestBuilder _builder) : super(_builder);
=======
  const GroupsBuilderProtocol(super._builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
}

///[UIGroupsBuilder] is the default [GroupsBuilderProtocol] used when a custom builder protocol is not passed
class UIGroupsBuilder extends GroupsBuilderProtocol {
<<<<<<< HEAD
  const UIGroupsBuilder(GroupsRequestBuilder _builder) : super(_builder);
=======
  const UIGroupsBuilder(super._builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  @override
  GroupsRequest getRequest() {
    return requestBuilder.build();
  }

  @override
  GroupsRequest getSearchRequest(String val) {
    requestBuilder.searchKeyword = val;
    return requestBuilder.build();
  }
}
