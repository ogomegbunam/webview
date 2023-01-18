import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:provider/provider.dart';
import 'bottomnavigation.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          final text =
              Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
                  ? 'DarkTheme'
                  : 'LightTheme';
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: Bottom(),
          );
        },
      );
}
