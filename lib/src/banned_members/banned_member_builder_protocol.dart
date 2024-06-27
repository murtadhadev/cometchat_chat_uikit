import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

abstract class BannedMemberBuilderProtocol extends BuilderProtocol<
    BannedGroupMembersRequestBuilder, BannedGroupMembersRequest> {
<<<<<<< HEAD
  const BannedMemberBuilderProtocol(BannedGroupMembersRequestBuilder builder)
      : super(builder);
}

class UIBannedMemberBuilder extends BannedMemberBuilderProtocol {
  const UIBannedMemberBuilder(BannedGroupMembersRequestBuilder builder)
      : super(builder);
=======
  const BannedMemberBuilderProtocol(super.builder);
}

class UIBannedMemberBuilder extends BannedMemberBuilderProtocol {
  const UIBannedMemberBuilder(super.builder);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  @override
  BannedGroupMembersRequest getRequest() {
    return requestBuilder.build();
  }

  @override
  BannedGroupMembersRequest getSearchRequest(String val) {
    requestBuilder.searchKeyword = val;
    return requestBuilder.build();
  }
}
