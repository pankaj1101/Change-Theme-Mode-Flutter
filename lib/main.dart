import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/theme_changer_provider.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(),
        )
      ],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
              brightness: Brightness.light, primarySwatch: Colors.indigo),
          darkTheme: ThemeData(brightness: Brightness.dark),
          home: const HomePage(),
        );
      }),
    );
  }
}
