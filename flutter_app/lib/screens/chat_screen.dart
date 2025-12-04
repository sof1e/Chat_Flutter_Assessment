import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/message_list.dart';
import '../widgets/chat_input.dart';
import '../theme/theme_changer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _messages = [];
  Uint8List? _pickedImageBytes;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('messages') ?? [];
    setState(() {
      _messages = saved.map((jsonStr) {
        final map = jsonDecode(jsonStr) as Map<String, dynamic>;
        if (map['imageBase64'] != null) {
          map['imageBytes'] = base64Decode(map['imageBase64']);
        }
        return map;
      }).toList();
    });
  }

  Future<void> _saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final toSave = _messages.map((m) {
      final copy = Map<String, dynamic>.from(m);
      if (copy['imageBytes'] != null) {
        copy['imageBase64'] = base64Encode(copy['imageBytes']);
        copy.remove('imageBytes');
      }
      return jsonEncode(copy);
    }).toList();
    await prefs.setStringList('messages', toSave);
  }

  void _updatePickedImage(Uint8List? bytes) {
    setState(() => _pickedImageBytes = bytes);
  }

  void _addMessage(Map<String, dynamic> msg) {
    setState(() => _messages.add(msg));
    _saveMessages();
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 80,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Chat"),
        leading: IconButton(
          icon: Icon(context.watch<ThemeChanger>().isDark
              ? Icons.wb_sunny
              : Icons.nightlight_round),
          onPressed: () => context.read<ThemeChanger>().toggleTheme(),
        ),
        actions: [
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.screwdriverWrench,
              size: 18,
            ),
            onPressed: () => Navigator.pushNamed(context, '/dashboard'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: MessageList(
              messages: _messages,
              scrollController: _scrollController,
            ),
          ),
          ChatInput(
            controller: _controller,
            pickedImageBytes: _pickedImageBytes,
            onImagePicked: _updatePickedImage,
            onSend: (text) {
              if (text.trim().isEmpty && _pickedImageBytes == null) return;

              _addMessage({
                'text': text.isEmpty ? null : text,
                'imageBytes': _pickedImageBytes,
                'isMe': true,
                'time': TimeOfDay.now().format(context),
              });

              _controller.clear();
              _updatePickedImage(null);

              // Auto-reply
              Timer(const Duration(seconds: 1), () {
                final replies = [
                  "Thank you, we have received your message!",
                  "Hello! How can we help you?",
                  "We will get in touch with you soon.",
                ];
                _addMessage({
                  'text': replies[_messages.length % replies.length],
                  'isMe': false,
                  'time': TimeOfDay.now().format(context),
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
