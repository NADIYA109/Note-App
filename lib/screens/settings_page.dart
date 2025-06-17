import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SwitchListTile(
        title: Text("Dark Mode"),
        value: themeProvider.isDark,
        onChanged: (value) => themeProvider.toggleTheme(),
      ),
    );
  }
}
