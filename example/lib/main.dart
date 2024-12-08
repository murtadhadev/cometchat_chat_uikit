import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        Translations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('hi', ''),
        Locale('ar', ''),
        Locale('de', ''),
        Locale('es', ''),
        Locale('fr', ''),
        Locale('ms', ''),
        Locale('pt', ''),
        Locale('ru', ''),
        Locale('sv', ''),
        Locale('zh', ''),
      ],
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String appId = "2680283502da4b26"; //Replace with your app id
  static const String authKey = "a2d09e9a504e55798b1e2f2dfe645a09ac097750"; //Replace with your auth key";
  static const String region = "ar"; ////Replace with your Region code ";

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    initializeCometChat();
  }

  initializeCometChat() async {
    //CometChat SDk should be initialized at the start of application. No need to initialize it again
    UIKitSettings uiKitSettings = (UIKitSettingsBuilder()
          ..subscriptionType = CometChatSubscriptionType.allUsers
          ..region = region
          ..autoEstablishSocketConnection = true
          ..appId = appId
          ..authKey = authKey
          ..extensions = CometChatUIKitChatExtensions.getDefaultExtensions()
          ..aiFeature = CometChatUIKitChatAIFeatures.getDefaultAiFeatures())
        .build();

    CometChatUIKit.init(
        uiKitSettings: uiKitSettings,
        onSuccess: (String successMessage) {
          login();
        },
        onError: (CometChatException excep) {});
  }

  login() async {
    String userId = "cometchat-uid-1";
    await CometChatUIKit.login(userId, onSuccess: (User loggedInUser) {
      debugPrint("Login Successful : $loggedInUser");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const CometChatConversationsWithMessages()));
    }, onError: (CometChatException e) {
      debugPrint("Login failed with exception:  ${e.message}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
