import 'package:flutter/material.dart';
import 'dart:typed_data';

class MessageBubble extends StatelessWidget {
  final String? message;
  final Uint8List? imageBytes;
  final bool isMe;
  final String time;

  const MessageBubble({
    super.key,
    this.message,
    this.imageBytes,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isMe ? const Color(0xFF218AFF) : Colors.grey[300];
    final textColor = isMe ? Colors.white : Colors.black87;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );

    List<Widget> content = [];

    if (message != null) {
      content.add(
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: radius,
          ),
          child: Text(
            message!,
            style: TextStyle(color: textColor),
          ),
        ),
      );
    }

    if (imageBytes != null) {
      content.add(
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.memory(
              imageBytes!,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    content.add(
      Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(
          time,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: align,
      children: content
          .map((w) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: w,
              ))
          .toList(),
    );
  }
}
