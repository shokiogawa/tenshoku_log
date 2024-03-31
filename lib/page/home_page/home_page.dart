import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/page/home_page/main/home_page_app_bar.dart';
import 'package:tanshoku_log/page/home_page/main/home_page_body.dart';
import 'package:tanshoku_log/page/home_page/main/home_page_floating_action_button.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      floatingActionButton: HomePageFloatingActionButton(),
      appBar: HomePageAppBar(),
      body: HomePageBody(),
      // bottomNavigationBar: HomePageBottom(),
    );
  }
}