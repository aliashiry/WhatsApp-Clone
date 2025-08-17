enum MessageType { text, image, audio, video }

class MessageModel {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final MessageType type;
  final DateTime timestamp;
  final bool isMe;
  final bool isRead;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.type,
    required this.timestamp,
    required this.isMe,
    this.isRead = false,
  });

  static List<MessageModel> getDummyMessages() {
    return [
      MessageModel(
        id: '1',
        senderId: '1',
        senderName: 'Mohammad Ali',
        content: 'Hey! How are you doing today?',
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isMe: false,
        isRead: true,
      ),
      MessageModel(
        id: '2',
        senderId: 'me',
        senderName: 'Me',
        content: 'I\'m doing great! Thanks for asking. How about you?',
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(hours: 2, minutes: 1)),
        isMe: true,
        isRead: true,
      ),
      MessageModel(
        id: '3',
        senderId: '1',
        senderName: 'Mohammad Ali',
        content: 'I\'m good too! Just working on some exciting new projects.',
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
        isMe: false,
        isRead: true,
      ),
      MessageModel(
        id: '4',
        senderId: 'me',
        senderName: 'Me',
        content: 'That sounds amazing! Would love to hear more about it.',
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        isMe: true,
        isRead: true,
      ),
      MessageModel(
        id: '5',
        senderId: '1',
        senderName: 'Mohammad Ali',
        content: 'Sure! Let\'s catch up soon. Are you free this weekend?',
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        isMe: false,
        isRead: false,
      ),
    ];
  }
}