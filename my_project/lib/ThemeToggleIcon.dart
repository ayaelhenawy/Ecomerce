import 'package:flutter/material.dart';
import 'package:my_project/ThemeNotifier.dart';
import 'package:provider/provider.dart';

class ThemeToggleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Provider.of<ThemeNotifier>(context).themeMode == ThemeMode.dark
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
      onPressed: () {
        Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
      },
    );
  }
}
