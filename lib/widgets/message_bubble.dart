import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/message_model.dart';

class MessageBubble extends StatefulWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(widget.message.isMe ? 1.0 : -1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Align(
          alignment: widget.message.isMe
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(
              left: widget.message.isMe ? 80 : 8,
              right: widget.message.isMe ? 8 : 80,
              top: 4,
              bottom: 4,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.message.isMe
                  ? const Color(0xFF005C4B)
                  : (isDark ? const Color(0xFF202C33) : Colors.white),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: widget.message.isMe
                    ? const Radius.circular(12)
                    : const Radius.circular(2),
                bottomRight: widget.message.isMe
                    ? const Radius.circular(2)
                    : const Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message.content,
                  style: TextStyle(
                    color: widget.message.isMe
                        ? Colors.white
                        : theme.colorScheme.onSurface,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('HH:mm').format(widget.message.timestamp),
                      style: TextStyle(
                        color: widget.message.isMe
                            ? Colors.white70
                            : theme.colorScheme.secondary,
                        fontSize: 12,
                      ),
                    ),
                    if (widget.message.isMe) ...[
                      const SizedBox(width: 4),
                      Icon(
                        widget.message.isRead
                            ? Icons.done_all
                            : Icons.done,
                        size: 16,
                        color: widget.message.isRead
                            ? const Color(0xFF53BDEB)
                            : Colors.white70,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}