import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/services/auth/auth_gate.dart';
import 'package:spotify/themes/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: routes,
      home: AuthGate(),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
