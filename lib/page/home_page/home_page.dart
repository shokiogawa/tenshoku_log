import 'package:flutter/material.dart';
import 'package:tanshoku_log/page/home_page/main/home_page_app_bar.dart';
import 'package:tanshoku_log/page/home_page/main/home_page_body.dart';
import 'package:tanshoku_log/page/home_page/main/home_page_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomePageAppBar(),
      body: HomePageBody(),
      bottomNavigationBar: HomePageBottom(),
    );
  }
}