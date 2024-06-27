import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

///[AIAssistBotExtension] is the controller class for enabling and disabling the extension
///enabling this extension you can use the assist bot ai feature
class AIAssistBotExtension extends AIExtension {
  AIAssistBotConfiguration? configuration;
  AIAssistBotExtension({this.configuration});

  @override
  void addExtension() {
<<<<<<< HEAD
    ChatConfigurator.enable((dataSource) => AIAssistBotDecorator(
        dataSource,
        configuration: configuration));
=======
    ChatConfigurator.enable((dataSource) =>
        AIAssistBotDecorator(dataSource, configuration: configuration));
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  }

  @override
  String getExtensionId() {
    return AIFeatureConstants.aiAssistBot;
  }
}
