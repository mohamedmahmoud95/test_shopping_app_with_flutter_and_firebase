import 'package:flutter/material.dart';

class TextField_widget extends StatefulWidget {
  final int MaxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextField_widget({
    Key? key,
    this.MaxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<TextField_widget> createState() => _TextField_widgetState();
}

class _TextField_widgetState extends State<TextField_widget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        TextField(
          controller: controller,
          maxLines: widget.MaxLines,
        )
      ],
    );
  }
}
