import "package:flutter/material.dart";

class InputAlertBox extends StatelessWidget {
  final TextEditingController textContoller;
  final String hintText;
  final void Function()? onPressed;
  final String onPressedText;
  const InputAlertBox(
      {super.key,
      required this.textContoller,
      required this.hintText,
      required this.onPressed,
      required this.onPressedText});

  @override
  Widget build(context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: TextField(
        controller: textContoller,
        maxLength: 140,
        maxLines: 2,
        decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(12))),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              textContoller.clear();
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              onPressed!();
              textContoller.clear();
            },
            child: Text(onPressedText))
      ],
    );
  }
}
