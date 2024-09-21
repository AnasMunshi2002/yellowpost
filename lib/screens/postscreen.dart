import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellowpost/screens/buildercomponent.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 121, 121, 121),
      appBar: AppBar(
        title: Text(
          "My Posts",
          style: GoogleFonts.abrilFatface(),
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: const MyBuilder()),
    );
  }
}
