import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Size get preferredSize {
    return const Size(double.infinity, 56.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text("一覧データ取得"));
  }
}
