import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../db/db_definition.dart';

class MigrationPageBody extends HookConsumerWidget {
  const MigrationPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(futureDbProvider);
    switch (async) {
      // 正常処理
      case AsyncData(:final value):
        return Center(child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/home_page');
            },
            child: const Text("遷移する")));
      // エラー処理
      case AsyncError(:final error):
        return Text('Error: $error');
      // ローディング処理
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
