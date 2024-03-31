import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/page/home_page/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

const locale = Locale("ja", "JP");
class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [locale],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/home_page': (context) => const HomePage(),
      },
    );
  }
}
