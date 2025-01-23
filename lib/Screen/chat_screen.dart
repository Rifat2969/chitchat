// ignore_for_file: deprecated_member_use

import 'package:chit_chat/Model/chat_buddy.dart';
import 'package:chit_chat/Model/user.dart';
import 'package:chit_chat/Screen/inbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text("Chats",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svg_icons/pencil-50.svg',
                        color: Colors.white,
                        height: 22, // Decreased height for the icon
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 70,
                child: ListView.builder(
                  itemCount: ALL_USERS.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final controller = AnimationController(
                      duration: const Duration(milliseconds: 800),
                      vsync: this,
                    );

                    Future.delayed(Duration(milliseconds: index * 100), () {
                      controller.forward();
                    });

                    return AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return AnimatedOpacity(
                          opacity: controller.value,
                          duration: const Duration(milliseconds: 100),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black26,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        ALL_USERS[index].avatar != null ? NetworkImage(ALL_USERS[index].avatar!) : null,
                                    child: ALL_USERS[index].avatar == null
                                        ? const Icon(Icons.person, color: Colors.grey)
                                        : null,
                                  ),
                                ),
                                Text(
                                  ALL_USERS[index].name ?? "Unknown User",
                                  style: const TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: CHAT_BUDDIES.length,
                  itemBuilder: (context, index) {
                    final controller = AnimationController(
                      duration: const Duration(milliseconds: 800),
                      vsync: this,
                    );

                    Future.delayed(Duration(milliseconds: index * 100), () {
                      controller.forward();
                    });

                    return GestureDetector(
                      onTap: () {
                        final user = CHAT_BUDDIES[index].user;
                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Inbox(user: user),
                            ),
                          );
                        }
                      },
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return AnimatedOpacity(
                            opacity: controller.value,
                            duration: const Duration(milliseconds: 100),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black26,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: CHAT_BUDDIES[index].user?.avatar != null
                                            ? NetworkImage(CHAT_BUDDIES[index].user!.avatar!)
                                            : null,
                                        child: CHAT_BUDDIES[index].user?.avatar == null
                                            ? const Icon(Icons.person, color: Colors.grey)
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            CHAT_BUDDIES[index].user?.name ?? "Unknown User",
                                            style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                                          ),
                                          Text(
                                            CHAT_BUDDIES[index].message ?? "",
                                            style: const TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                if (index != CHAT_BUDDIES.length - 1) const Divider(),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
