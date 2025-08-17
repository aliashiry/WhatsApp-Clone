class StoryModel {
  final String id;
  final String userId;
  final String userName;
  final String userAvatar;
  final String imageUrl;
  final DateTime timestamp;
  final bool isViewed;

  StoryModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAvatar,
    required this.imageUrl,
    required this.timestamp,
    this.isViewed = false,
  });

  static List<StoryModel> getDummyStories() {
    return [
      StoryModel(
        id: '1',
        userId: 'me',
        userName: 'My Status',
        userAvatar: 'https://i.pravatar.cc/150?img=20',
        imageUrl: 'https://picsum.photos/400/600?random=1',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isViewed: true,
      ),
      StoryModel(
        id: '2',
        userId: '1',
        userName: 'Mohammad Ali',
        userAvatar: 'https://i.pravatar.cc/150?img=1',
        imageUrl: 'https://picsum.photos/400/600?random=2',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        isViewed: false,
      ),
      StoryModel(
        id: '3',
        userId: '3',
        userName: 'Ali Hassan',
        userAvatar: 'https://i.pravatar.cc/150?img=3',
        imageUrl: 'https://picsum.photos/400/600?random=3',
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
        isViewed: false,
      ),
      StoryModel(
        id: '4',
        userId: '5',
        userName: 'Amira Ali',
        userAvatar: 'https://i.pravatar.cc/150?img=5',
        imageUrl: 'https://picsum.photos/400/600?random=4',
        timestamp: DateTime.now().subtract(const Duration(hours: 6)),
        isViewed: true,
      ),
    ];
  }
}