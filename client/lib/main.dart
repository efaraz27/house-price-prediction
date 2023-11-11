import 'package:client/provider/dark_theme_provider.dart';
import 'package:client/screens/predict.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_schemes.g.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getDarkTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // provider for dark theme
          ChangeNotifierProvider(create: (_) => themeChangeProvider),
        ],
        child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            theme: ThemeData(
                useMaterial3: true,
                colorScheme:
                    value.darkTheme ? darkColorScheme : lightColorScheme),
            home: const Home(),
            debugShowCheckedModeBanner: false,
            routes: {
              '/predict': (context) => const Predict(),
            },
          );
        }));
  }
}
