import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/chat_screen.dart';
import 'screens/dashboard_screen.dart';
import 'theme/theme_changer.dart';
import 'theme/theme.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeChanger>().themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: ChatScreen(),
      routes: {
        '/dashboard': (_) => const DashboardScreen(),
      },
    );
  }
}
