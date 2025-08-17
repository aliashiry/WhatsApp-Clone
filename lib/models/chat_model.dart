class ChatModel {
  final String id;
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final DateTime timestamp;
  final int unreadCount;
  final bool isOnline;
  final bool isPinned;

  ChatModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.timestamp,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isPinned = false,
  });

  static List<ChatModel> getDummyChats() {
    return [
      ChatModel(
        id: '1',
        name: 'Mohammad Ali',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
        lastMessage: 'Hey! How are you doing today?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        unreadCount: 3,
        isOnline: true,
        isPinned: true,
      ),
      ChatModel(
        id: '2',
        name: 'Ali Hassan',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
        lastMessage: 'Thanks for the help yesterday!',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        unreadCount: 0,
        isOnline: false,
      ),
      ChatModel(
        id: '3',
        name: 'Mostafa Ahmed',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
        lastMessage: 'See you at the meeting tomorrow',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        unreadCount: 1,
        isOnline: true,
      ),
      ChatModel(
        id: '4',
        name: 'Ahmed Ali',
        avatarUrl: 'https://i.pravatar.cc/150?img=4',
        lastMessage: '👍',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        unreadCount: 0,
        isOnline: false,
      ),
      ChatModel(
        id: '5',
        name: 'Amira Ali',
        avatarUrl: 'https://i.pravatar.cc/150?img=5',
        lastMessage: 'New update is available!',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        unreadCount: 12,
        isOnline: false,
        isPinned: true,
      ),
    ];
  }
}