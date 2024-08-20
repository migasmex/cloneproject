import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/themes/theme_provider.dart';
import 'package:spotify/features/settings/widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.primary,
            title: Text("Settings")),
        body: Column(
          children: [
            SettingsTile(
              title: "Dark mode",
              action: Switch(
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
              ),
            )
          ],
        ));
  }
}
