import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/theme.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSend;
  final Uint8List? pickedImageBytes;
  final void Function(Uint8List?) onImagePicked;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onSend,
    required this.pickedImageBytes,
    required this.onImagePicked,
  });

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );
    if (file != null) {
      final bytes = await file.readAsBytes();
      onImagePicked(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Row(
          children: [
            // + button
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(18))),
                  builder: (_) => SizedBox(
                    height: 160,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .buttonBg,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: FaIcon(FontAwesomeIcons.image, size: 14),
                            ),
                          ),
                          title: const Text("Choose from gallery"),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(context, ImageSource.gallery);
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .buttonBg,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: FaIcon(FontAwesomeIcons.camera, size: 14),
                            ),
                          ),
                          title: const Text("Take a photo"),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(context, ImageSource.camera);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).extension<CustomColors>()!.buttonBg,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: FaIcon(FontAwesomeIcons.plus, size: 14),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Preview
            if (pickedImageBytes != null)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Image.memory(
                      pickedImageBytes!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => onImagePicked(null),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: const Icon(Icons.close,
                              size: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Text input
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).extension<CustomColors>()!.inputBg,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: controller,
                  minLines: 1,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    hintText: "Type a message...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Send button
            GestureDetector(
              onTap: () => onSend(controller.text),
              child: Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).extension<CustomColors>()!.buttonBg,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: FaIcon(FontAwesomeIcons.paperPlane, size: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
