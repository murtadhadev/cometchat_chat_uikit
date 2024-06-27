///[AIMessageStatus] is an enum that defines the status of message being sent
enum AIMessageStatus { sent, inProgress, error }

<<<<<<< HEAD
class AIAssistBotMessage{

  AIAssistBotMessage({
  this.message,
  required this.id,
  this.isSentByMe = false,
    this.sentStatus,
    this.sentAt
  });
  String? message;
  int id;
  bool isSentByMe;
  AIMessageStatus?  sentStatus;
=======
class AIAssistBotMessage {
  AIAssistBotMessage(
      {this.message,
      required this.id,
      this.isSentByMe = false,
      this.sentStatus,
      this.sentAt});
  String? message;
  int id;
  bool isSentByMe;
  AIMessageStatus? sentStatus;
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
  DateTime? sentAt;

  @override
  String toString() {
    return 'AIAssistBotMessage{message: $message, id: $id, isSentByMe: $isSentByMe, sentStatus: $sentStatus}';
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 505e7ce063d0534c0c0b7a796b3601f100dee178
