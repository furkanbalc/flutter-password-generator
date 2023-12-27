import 'package:flutter/material.dart';

class AddParameterWidget extends StatefulWidget {
  const AddParameterWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.buttonColor,
    this.onPressed,
  });

  final String text;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback? onPressed;

  @override
  State<AddParameterWidget> createState() => _AddParameterWidgetState();
}

class _AddParameterWidgetState extends State<AddParameterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(side: BorderSide(color: widget.buttonColor, width: 2)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(widget.buttonText, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: widget.buttonColor)),
          ),
        ),
        Text(widget.text, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: widget.buttonColor)),
      ],
    );
  }
}
