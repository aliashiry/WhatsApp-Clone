import 'package:flutter/material.dart';
import 'package:whats_app_clone/screens/chat_screen.dart';
import 'package:whats_app_clone/screens/stories_screen.dart';
import 'package:whats_app_clone/theme/app_theme.dart';
import 'package:whats_app_clone/widgets/chat_list_item.dart';
import 'package:whats_app_clone/widgets/story_item.dart';
import '../models/chat_model.dart';
import '../models/story_model.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;

  const HomeScreen({
    super.key,
    required this.onThemeToggle,
    required this.currentThemeMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<ChatModel> _chats = ChatModel.getDummyChats();
  final List<StoryModel> _stories = StoryModel.getDummyStories();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'theme') {
                widget.onThemeToggle();
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'new_group',
                child: Text('New group'),
              ),
              const PopupMenuItem<String>(
                value: 'new_broadcast',
                child: Text('New broadcast'),
              ),
              const PopupMenuItem<String>(
                value: 'linked_devices',
                child: Text('Linked devices'),
              ),
              const PopupMenuItem<String>(
                value: 'starred',
                child: Text('Starred messages'),
              ),
              PopupMenuItem<String>(
                value: 'theme',
                child: Row(
                  children: [
                    Icon(
                      widget.currentThemeMode == ThemeMode.light
                          ? Icons.light_mode_sharp
                          : Icons.dark_mode,
                      size: 22,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppTheme.lightSecondary
                          : AppTheme.lightBackground,
                    ),
                    const SizedBox(width: 12),
                    const Text('Theme'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Text('Settings'),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'CALLS'),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Calls Tab
          const Center(
            child: Text(
              'Calls',
              style: TextStyle(fontSize: 24),
            ),
          ),
          // Chats Tab
          _buildChatsTab(),
          // Status Tab
          _buildStatusTab(),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildChatsTab() {
    return ListView.builder(
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        final chat = _chats[index];
        return ChatListItem(
          chat: chat,
          onTap: () => _openChat(chat),
        );
      },
    );
  }

  Widget _buildStatusTab() {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _stories.length,
            itemBuilder: (context, index) {
              final story = _stories[index];
              return StoryItem(
                story: story,
                onTap: () => _openStory(story, index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, child) {
        return FloatingActionButton(
          onPressed: () {},
          child: Icon(_getFloatingActionButtonIcon()),
        );
      },
    );
  }

  IconData _getFloatingActionButtonIcon() {
    switch (_tabController.index) {
      case 0:
        return Icons.add_call;
      case 1:
        return Icons.chat;
      case 2:
        return Icons.camera_alt;
      default:
        return Icons.chat;
    }
  }

  void _openChat(ChatModel chat) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ChatScreen(chat: chat),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void _openStory(StoryModel story, int index) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            StoriesScreen(stories: _stories, initialIndex: index),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
