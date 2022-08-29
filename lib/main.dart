import 'package:dark_mode/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _themeNotifier = ThemeNotifier();

  @override
  void initState() {
    super.initState();

    _themeNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeNotifier.currentTheme(),
      title: 'Dark Mode',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CupertinoSwitch(
                activeColor: Colors.pinkAccent,
                onChanged: (_) {
                setState(() {
                    _themeNotifier.switchTheme();
                  });
                },
                value: _themeNotifier.currentTheme() == ThemeMode.dark,
              ),
              const SizedBox(width: 8),
              const Text(
                'Dark Mode',
                style: TextStyle(fontSize: 36),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
