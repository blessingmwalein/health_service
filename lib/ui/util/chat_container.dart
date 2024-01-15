import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/shared/bottom_bar.dart';
import 'package:health_service/ui/util/shared/chat_bar.dart';

class ChatPageLayout extends StatefulWidget {
  const ChatPageLayout(
      {super.key, required this.child, required this.title, this.bottom});

  final Widget child;
  final Widget? bottom;
  final String title;
  @override
  State<ChatPageLayout> createState() => _ChatPageLayoutState();
}

class _ChatPageLayoutState extends State<ChatPageLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      body: Container(
          margin: const EdgeInsets.only(bottom: 75), child: widget.child),
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(80), // You can adjust the height if needed
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 10),
          padding: const EdgeInsets.all(0),
          color: primaryWhite,
          child: ChatAppBar(title: widget.title),
        ),
      ),
      bottomSheet: widget.bottom,
      bottomNavigationBar: const CustomBottomAppBar(
        pageName: 'Chat',
      ),
    );
  }
}
