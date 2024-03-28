import 'package:flutter/material.dart';

class BlogEditor extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int minLines;
  const BlogEditor({super.key, required this.controller, required this.hintText, this.minLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: null,
      minLines: minLines,
      decoration: InputDecoration(
        hintText: hintText
      ),
    );
  }
}
