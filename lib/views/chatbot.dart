import 'dart:convert';

import 'package:flutter/material.dart';
import 'messageCard.dart';
import 'package:http/http.dart'as http;
class ChatBot extends StatefulWidget {
  const ChatBot({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {

  final TextEditingController _controller = TextEditingController();
  final List<Widget> list = [];
  final url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCorK5GW4OXnCQ6QRqsJJGrY0tU8appaLM';

  // https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=YOUR_API_KEY
  final header = {
    'Content-Type': 'application/json',
  };

  void onSend() async {
    if (_controller.text.isEmpty) return;

    ChatMessage message = ChatMessage(
        message: _controller.text, name: widget.name);
    setState(() {
      list.insert(0, message);
    });


    var data = {
      "contents": [
        {
          "parts": [
            {"text": _controller.text}
          ]
        }
      ]
    };
   _controller.clear();
    await http
        .post(Uri.parse(url), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage m1 = ChatMessage(
          isAI: true,
            message: result['candidates'][0]['content']['parts'][0]['text'],
            name: 'Personal AI');
        list.insert(0, m1);
      } else {
        print("error occured");
      }
    })
        .catchError((e) {});

    setState(() {

    });

    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hey ${widget.name} !  how can I help you"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        backgroundColor: Colors.blue[50], // Light blue background color for the entire page
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => list[index],
                itemCount: list.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue[100], // Lighter blue background color for text field
                        borderRadius: BorderRadius.circular(20), // Circular edges
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: TextField(
                          controller: _controller,
                          style: TextStyle(
                            fontSize: 16
                          ),
                          onSubmitted: (value) => onSend(),
                          decoration: InputDecoration.collapsed(
                            hintText: "write prompt here",
                            hintStyle: TextStyle()
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onSend,
                    icon: Icon(Icons.send),
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}