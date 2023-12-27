import 'package:flutter/material.dart';
import 'package:random_pass_generator/enum/strings_enum.dart';

class ResultContainerWidget extends StatefulWidget {
  const ResultContainerWidget({
    super.key,
    required this.password,
    required this.onPressed,
  });

  final String password;
  final VoidCallback onPressed;

  @override
  State<ResultContainerWidget> createState() => _ResultContainerWidgetState();
}

class _ResultContainerWidgetState extends State<ResultContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.red.shade100,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.generatedPass.value, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.deepPurple)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 21),
            child: Divider(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.password,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Divider(color: Colors.white),
          ),
          const SizedBox(height: 50),
          ElevatedButton(onPressed: widget.onPressed, child: Text(AppStrings.generate.value)),
        ],
      ),
    );
  }
}
