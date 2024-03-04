import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  String getRoute() => "ChatScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          actions: const [
            Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            SizedBox(
              width: 20,
            )
          ],
          // shadowColor: Colors.black,
          elevation: 0,
          backgroundColor: Colors.transparent),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 2,
            color: Colors.black,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
