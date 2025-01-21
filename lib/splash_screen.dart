import 'dart:async';

import 'package:chit_chat/Screen/chat_screen.dart';
import 'package:flutter/material.dart';

import 'utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
    });
  }

  bool _showSecondText = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig.initMediaQuery(context);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showSecondText = true;
      });
    });
    return Scaffold(
      body: Container(
        width: SizeConfig.width,
        height: SizeConfig.height,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 80),
        child: const Text('CHIT CHAT', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
