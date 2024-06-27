import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

enum CometChatPollsBubbleType { result, poll }

///[CometChatPollsBubble] is a widget that is rendered as the content view for [PollsExtension]
///
/// ```dart
/// CometChatPollsBubble(
///  pollQuestion: "What is your favorite color?",
///  options: [
///    PollOptions(id: "1", optionText: "Red"),
///    PollOptions(id: "2", optionText: "Green"),
///    PollOptions(id: "3", optionText: "Blue")
///  ],
///  pollId: "123456",
///  choosePoll: (String vote, String id) async {
///    // Code to handle the poll vote
///  },
/// );
///
/// ```
class CometChatPollsBubble extends StatelessWidget {
  const CometChatPollsBubble(
<<<<<<< HEAD
      {Key? key,
=======
      {super.key,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      this.loggedInUser,
      this.pollQuestion,
      this.options,
      this.pollId,
<<<<<<< HEAD
      this.ctheme,
      required this.choosePoll,
      this.senderUid,
      this.metadata,
      this.style})
      : super(key: key);
=======
      this.theme,
      required this.choosePoll,
      this.senderUid,
      this.metadata,
      this.style});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[pollQuestion] if poll question is passed then that is used instead of poll question from message Object
  final String? pollQuestion;

  ///[options] if options is passed then that is used instead of options from message Object
  final List<PollOptions>? options;

  ///[pollId] if poll id is passed then that is used instead of poll id from message Object
  final String? pollId;

<<<<<<< HEAD
  final CometChatTheme? ctheme;
=======
  final CometChatTheme? theme;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[loggedInUser] logged in user id to check if logged user voted or not
  final String? loggedInUser;

  ///[choosePoll] vote for the poll
  final Future<void> Function(String vote, String id) choosePoll;

  ///[senderUid] uid of poll creator
  final String? senderUid;

  ///[metadata] metadata attached to the poll message
  final Map<String, dynamic>? metadata;

  final PollsBubbleStyle? style;

<<<<<<< HEAD
  getRadio(int index, String id, String value, String chosenId, String pollId, CometChatTheme theme) {
    return GestureDetector(
      onTap: () async {
        if (loggedInUser != null && senderUid != null && senderUid == loggedInUser) {
=======
  getRadio(int index, String id, String value, String chosenId, String pollId,
      CometChatTheme theme) {
    return GestureDetector(
      onTap: () async {
        if (loggedInUser != null &&
            senderUid != null &&
            senderUid == loggedInUser) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          return;
        }
        await choosePoll(id, pollId);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 0, 4, 6),
        child: Container(
          decoration: BoxDecoration(
<<<<<<< HEAD
              color: style?.pollOptionsBackgroundColor ?? theme.palette.getBackground(),
              borderRadius: const BorderRadius.all(Radius.circular(6.0))),
          height: 42,
          // width: style.width,
          // decoration: BoxDecoration(
          //   border: style.border,
          //   borderRadius: BorderRadius.circular(style.borderRadius??0),
          //   color: style.gradient==null?style.background??Colors.transparent:null,
          //   gradient: style.gradient
          // ),
=======
              color: style?.pollOptionsBackgroundColor ??
                  theme.palette.getBackground(),
              borderRadius: const BorderRadius.all(Radius.circular(6.0))),
          height: 42,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.only(left: 11, right: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
<<<<<<< HEAD
                    color: style?.radioButtonColor ?? theme.palette.getAccent100(),
=======
                    color:
                        style?.radioButtonColor ?? theme.palette.getAccent100(),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                  )),
              Flexible(
                child: Text(
                  value,
                  maxLines: 2,
<<<<<<< HEAD
                  style: TextStyle(color: theme.palette.getAccent(), fontSize: 13).merge(style?.pollOptionsTextStyle),
=======
                  style:
                      TextStyle(color: theme.palette.getAccent(), fontSize: 13)
                          .merge(style?.pollOptionsTextStyle),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget getPollWidget(List<PollOptions> options, String chosenId, String pollId, CometChatTheme theme) {
    return Column(
      children: [
        for (int index = 0; index < options.length; index++)
          getRadio(index, options[index].id, options[index].optionText, chosenId, pollId, theme),
=======
  Widget getPollWidget(List<PollOptions> options, String chosenId,
      String pollId, CometChatTheme theme) {
    return Column(
      children: [
        for (int index = 0; index < options.length; index++)
          getRadio(index, options[index].id, options[index].optionText,
              chosenId, pollId, theme),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      ],
    );
  }

<<<<<<< HEAD
  Widget getPollBar(int index, String id, List<PollOptions> options, int totalVote, String chosenId, String pollId,
      CometChatTheme theme) {
    int count = options[index].voteCount;
    String text = options[index].optionText;
    double percentage = totalVote == 0 ? 0 : (count / totalVote * 100);
    Color progressColor = style?.unSelectedOptionColor ?? theme.palette.getAccent100();
    Color background = style?.pollOptionsBackgroundColor ?? theme.palette.getBackground();

    if (id == chosenId) {
      progressColor = style?.selectedOptionColor ?? theme.palette.getPrimary200();
=======
  Widget getPollBar(int index, String id, List<PollOptions> options,
      int totalVote, String chosenId, String pollId, CometChatTheme theme) {
    int count = options[index].voteCount;
    String text = options[index].optionText;
    double percentage = totalVote == 0 ? 0 : (count / totalVote * 100);
    Color progressColor =
        style?.unSelectedOptionColor ?? theme.palette.getAccent100();
    Color background =
        style?.pollOptionsBackgroundColor ?? theme.palette.getBackground();

    if (id == chosenId) {
      progressColor =
          style?.selectedOptionColor ?? theme.palette.getPrimary200();
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, right: 4, left: 4),
      child: GestureDetector(
        onTap: () {
<<<<<<< HEAD
          if (loggedInUser != null && senderUid != null && senderUid == loggedInUser) {
            return;
          }

          int previousChosen = options.indexWhere((PollOptions element) => element.id == chosenId);
=======
          if (loggedInUser != null &&
              senderUid != null &&
              senderUid == loggedInUser) {
            return;
          }

          int previousChosen = options
              .indexWhere((PollOptions element) => element.id == chosenId);
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          if (previousChosen != -1) {
            options[previousChosen].voteCount--;
          } else {
            totalVote++;
          }

          chosenId = id;
          options[index].voteCount++;
          choosePoll(id, pollId);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: LinearProgressIndicator(
                  backgroundColor: background,
                  minHeight: 42,
                  value: percentage / 100,
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                                fontSize: theme.typography.subtitle1.fontSize,
<<<<<<< HEAD
                                fontWeight: theme.typography.subtitle1.fontWeight,
                                fontFamily: theme.typography.subtitle1.fontFamily,
=======
                                fontWeight:
                                    theme.typography.subtitle1.fontWeight,
                                fontFamily:
                                    theme.typography.subtitle1.fontFamily,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                                color: theme.palette.getAccent())
                            .merge(style?.pollOptionsTextStyle),
                      ),
                    )),
                Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 11),
                      child: Text(
                        "${percentage.toStringAsFixed(1)}%",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                                fontSize: theme.typography.subtitle2.fontSize,
<<<<<<< HEAD
                                fontWeight: theme.typography.subtitle2.fontWeight,
                                fontFamily: theme.typography.subtitle2.fontFamily,
=======
                                fontWeight:
                                    theme.typography.subtitle2.fontWeight,
                                fontFamily:
                                    theme.typography.subtitle2.fontFamily,
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
                                color: theme.palette.getAccent600())
                            .merge(style?.pollResultTextStyle),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

<<<<<<< HEAD
  getPollResultWidget(List<PollOptions> options, int totalVote, String chosenId, String pollId, CometChatTheme theme) {
    return Column(
      children: [
        for (int index = 0; index < options.length; index++)
          getPollBar(index, options[index].id, options, totalVote, chosenId, pollId, theme)
=======
  getPollResultWidget(List<PollOptions> options, int totalVote, String chosenId,
      String pollId, CometChatTheme theme) {
    return Column(
      children: [
        for (int index = 0; index < options.length; index++)
          getPollBar(index, options[index].id, options, totalVote, chosenId,
              pollId, theme)
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String chosenId = "";
    int totalVote = 0;
    CometChatPollsBubbleType bubbleType = CometChatPollsBubbleType.poll;
    List<PollOptions> options = [];
<<<<<<< HEAD
    // String? _pollId;
    CometChatTheme theme = ctheme ?? cometChatTheme;

    if (options != null) {
      options = options;
    } else if (metadata != null) {
      // Map<String, dynamic>? metadata =
      //     Extensions.getPollsResult(messageObject!);
      // _pollId = messageObject?.customData?["id"];

=======
    CometChatTheme theme = this.theme ?? cometChatTheme;

    if (this.options != null) {
      options = this.options!;
    } else if (metadata != null) {
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      if (metadata != null && metadata!.isNotEmpty) {
        totalVote = metadata?["total"];
        Map<String, dynamic> opt = metadata?["options"] ?? {};
        for (var item in opt.keys) {
          Map<String, dynamic> votersUid = opt[item]["voters"] ?? {};

          PollOptions optionModel = PollOptions(
              id: item.toString(),
              optionText: opt[item]["text"],
              voteCount: opt[item]["count"],
              votersUid: votersUid.keys.toList());
          options.add(optionModel);
        }
      }
    }

    for (PollOptions opt in options) {
      if (opt.votersUid.contains(loggedInUser)) {
        chosenId = opt.id;
      }
    }

<<<<<<< HEAD
    // if (totalVoteCount != null) {
    //   _totalVote = totalVoteCount!;
    // }

=======
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
    if (totalVote > 0) {
      bubbleType = CometChatPollsBubbleType.result;
    }

<<<<<<< HEAD
    // if (pollId != null) {
    //   _pollId = pollId;
    // }

    return Container(
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * .618, maxWidth: MediaQuery.of(context).size.width * .75),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: style?.backgroundColor ?? Colors.transparent),
=======
    return Container(
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * .618,
          maxWidth: MediaQuery.of(context).size.width * .75),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: style?.backgroundColor ?? Colors.transparent),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 7, 12, 9),
            child: Text(
              pollQuestion ?? '',
              style: TextStyle(
                      fontSize: theme.typography.name.fontSize,
                      fontWeight: theme.typography.name.fontWeight,
                      fontFamily: theme.typography.name.fontFamily,
                      color: theme.palette.getAccent())
                  .merge(style?.questionTextStyle),
            ),
          ),
<<<<<<< HEAD
          if (bubbleType == CometChatPollsBubbleType.poll) getPollWidget(options, chosenId, pollId ?? '', theme),
          if (bubbleType == CometChatPollsBubbleType.result)
            getPollResultWidget(options, totalVote, chosenId, pollId ?? '', theme),
=======
          if (bubbleType == CometChatPollsBubbleType.poll)
            getPollWidget(options, chosenId, pollId ?? '', theme),
          if (bubbleType == CometChatPollsBubbleType.result)
            getPollResultWidget(
                options, totalVote, chosenId, pollId ?? '', theme),
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 12, left: 12),
            child: Text(
              "$totalVote ${Translations.of(context).peopleVoted}",
              style: TextStyle(
                      fontSize: theme.typography.subtitle1.fontSize,
                      fontWeight: theme.typography.subtitle1.fontWeight,
                      fontFamily: theme.typography.subtitle1.fontFamily,
                      color: theme.palette.getAccent600())
                  .merge(style?.voteCountTextStyle),
            ),
          )
        ],
      ),
    );
  }
}

class PollOptions {
  ///creates model for poll options and result
<<<<<<< HEAD
  PollOptions({required this.optionText, required this.voteCount, required this.id, required this.votersUid});
=======
  PollOptions(
      {required this.optionText,
      required this.voteCount,
      required this.id,
      required this.votersUid});
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178

  ///[id] poll option id
  final String id;

  ///[optionText] option text
  final String optionText;

  ///[voteCount] vote count for this option
  int voteCount;

  ///[votersUid] list of voters uid
  final List<String> votersUid;
}
