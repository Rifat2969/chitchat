import 'package:chit_chat/Model/chat_buddy.dart';
import 'package:chit_chat/Model/user.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 40,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ahammed Rifat", style: TextStyle(fontSize: 12)),
                      Text("Bashundhara R/A", style: TextStyle(color: Colors.black87, fontSize: 10)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black26, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.black45,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Chat with Your Providers',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              // Search bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search...',
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
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
                                    backgroundImage:
                                        ALL_USERS[index].avatar != null ? NetworkImage(ALL_USERS[index].avatar!) : null,
                                    child: ALL_USERS[index].avatar == null
                                        ? const Icon(Icons.person, color: Colors.grey)
                                        : null,
                                  ),
                                ),
                                Text(
                                  ALL_USERS[index].name ?? "Unknown User",
                                  style: const TextStyle(fontSize: 12, color: Colors.black54),
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

              Text(
                'Recent Masseges',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: CHAT_BUDDIES.length,
                  itemBuilder: (context, index) {
                    final controller = AnimationController(
                      duration: const Duration(milliseconds: 800), // Slower animation duration
                      vsync: this,
                    );

                    Future.delayed(Duration(milliseconds: index * 100), () {
                      controller.forward(); // Trigger animation with a delay
                    });

                    return AnimatedBuilder(
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
                                        color: Colors.black26, // Border color
                                        width: 1.0, // Border width
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
                                          style: const TextStyle(fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          CHAT_BUDDIES[index].message ?? "",
                                          style: const TextStyle(color: Colors.black54),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
