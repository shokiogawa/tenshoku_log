import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/core/configuration.dart';
import 'package:tanshoku_log/page/home_page/home_page.dart';
import 'package:tanshoku_log/page/map_page/map_page.dart';
import 'package:tanshoku_log/urility/loading_provider.dart';

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
        cardTheme: const CardTheme(color: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        useMaterial3: true,
      ),
      home: const HomePage(),
      builder: (context, child) {
        return Consumer(builder: (context, ref, _) {
          final isLoading = ref.watch(loadingNotifierProvider);
          return Stack(
            children: [
              child!,
              isLoading
                  ? const ColoredBox(
                      color: Colors.black26,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(),
            ],
          );
        });
      },
      routes: {
        '/home_page': (context) => const HomePage(),
        '/map_page': (context) => const GoogleMapPage()
      },
    );
  }
}
