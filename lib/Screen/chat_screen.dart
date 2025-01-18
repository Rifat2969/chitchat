import 'package:chit_chat/Extention/number_ext.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.height,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 60,
                  ),
                  SizedBox(width: 3.width),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahammed Rifat",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "Bashundhara R/A",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      )
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(backgroundColor: Colors.black12, child: Icon(Icons.notifications_outlined))
                ],
              ),
              SizedBox(
                height: 4.height,
              ),
              const Text(
                "Chat With Your Providers",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: .02),
              ),
              SizedBox(height: 2.height),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
