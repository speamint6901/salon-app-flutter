enum MessageChatModelType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

class MessageChatModel {
  final String text;
  final MessageChatModelType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  MessageChatModel({
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}

List demeMessageChatModels = [
  MessageChatModel(
    text: "Hi Sajol,",
    messageType: MessageChatModelType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  MessageChatModel(
    text: "Hello, How are you?",
    messageType: MessageChatModelType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  MessageChatModel(
    text: "",
    messageType: MessageChatModelType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  MessageChatModel(
    text: "",
    messageType: MessageChatModelType.video,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  MessageChatModel(
    text: "Error happend",
    messageType: MessageChatModelType.text,
    messageStatus: MessageStatus.not_sent,
    isSender: true,
  ),
  MessageChatModel(
    text: "This looks great man!!",
    messageType: MessageChatModelType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  MessageChatModel(
    text: "Glad you like it",
    messageType: MessageChatModelType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
  ),
];
