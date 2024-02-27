import 'package:personal_ai/views/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {



  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title:const  Text("Personal AI"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                    width: 250,
                    child: Image.asset('assets/3.png')),
                Card(
                  elevation: 7,
                  child: Center(
                    child: Text(
                      "Welcome to your \n \t\t\t\t   AI bot",
                      style: GoogleFonts.alef(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Enter your name",
                    style: GoogleFonts.alef(
                      fontSize: 30,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _controller,
                  decoration:const  InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontSize: 20, // Adjust font size as needed
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String name = _controller.text; // Get the text from the controller
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatBot(name: name),
                      ),
                    );
                  },
                  child:const  Text("Enter"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
