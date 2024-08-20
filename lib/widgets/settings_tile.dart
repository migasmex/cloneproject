import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/themes/theme_provider.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final Widget action;
  const SettingsTile({super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(left: 25, right: 25, top: 10),
      padding: EdgeInsets.all(17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          action,
        ],
      ),
    );
  }
}
