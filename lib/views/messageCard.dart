import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String name;
  final bool isAI;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.name,
    this.isAI = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isAI ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isAI)
            Container(
              margin: const EdgeInsets.only(left: 16, right: 8),
              child: CircleAvatar(
                child: Text(name[0]),
              ),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: isAI ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Text(
                  name,

                  style: const TextStyle(
                    fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6,
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 18,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!isAI)
            Container(
              margin: const EdgeInsets.only(left: 8, right: 16),
              child: CircleAvatar(
                child: Text(name[0]),
              ),
            ),
        ],
      ),
    );
  }
}
