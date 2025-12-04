import 'package:flutter/material.dart';
import 'message_bubble.dart';
import 'dart:typed_data';

class MessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final ScrollController scrollController;

  const MessageList({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return MessageBubble(
          message: msg['text'],
          imageBytes: msg['imageBytes'] as Uint8List?,
          isMe: msg['isMe'],
          time: msg['time'],
        );
      },
    );
  }
}
