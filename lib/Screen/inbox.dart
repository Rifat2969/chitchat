import 'dart:io';

import 'package:chit_chat/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Inbox extends StatefulWidget {
  final User user;

  const Inbox({super.key, required this.user});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];
  final List<String> _hints = ["Hi there", "Hello", "Any discount available?"];
  bool _hasMessages = false;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  void _sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      setState(() {
        _messages.add(message.trim());
        _messageController.clear();
        _hasMessages = true;
      });
    }
  }

  void _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Save the picked image temporarily
      });
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Open Camera'),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_album),
              title: const Text('Open Gallery'),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // Show the full image in a dialog when tapped
  void _showFullImage(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Image.file(
              File(_messages[index]),
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 17,
                    backgroundImage: widget.user.avatar != null ? NetworkImage(widget.user.avatar!) : null,
                    child: widget.user.avatar == null ? const Icon(Icons.person, size: 20, color: Colors.grey) : null,
                  ),
                  const SizedBox(width: 10), // Space between avatar and name
                  Text(
                    widget.user.name ?? "User Details",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              Expanded(
                child: _hasMessages
                    ? ListView.builder(
                        padding: const EdgeInsets.all(20.0),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          if (index >= _messages.length) {
                            return const SizedBox.shrink(); // Prevents out-of-bounds access
                          }

                          if (_messages[index].endsWith('.jpg') || _messages[index].endsWith('.png')) {
                            return Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Align(
                                alignment: Alignment.centerRight, // Align images to the right
                                child: GestureDetector(
                                  onTap: () => _showFullImage(index),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.file(
                                        File(_messages[index]),
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    _messages[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      )
                    : Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: widget.user.avatar != null ? NetworkImage(widget.user.avatar!) : null,
                                child: widget.user.avatar == null
                                    ? const Icon(Icons.person, size: 50, color: Colors.grey)
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                widget.user.name ?? "Unknown User",
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                widget.user.email ?? "No Email",
                                style: const TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  children: [
                    if (!_hasMessages)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _hints.map((hint) {
                            return GestureDetector(
                              onTap: () => _sendMessage(hint),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  hint,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _showBottomSheet,
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              hintText: "Message",
                              hintStyle: const TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey.shade800,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            String message = _messageController.text.trim();
                            if (_imageFile != null) {
                              _sendMessage(_imageFile!.path); // Send the image path if selected
                              setState(() {
                                _imageFile = null; // Reset image after sending
                              });
                            } else {
                              _sendMessage(message); // Send the text message
                            }
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Display the preview of the selected image
                    if (_imageFile != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.file(
                          _imageFile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
