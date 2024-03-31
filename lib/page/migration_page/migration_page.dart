import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/page/migration_page/main/migration_page_body.dart';

class MigrationPage extends ConsumerWidget {
  const MigrationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: MigrationPageBody(),
    );
  }
}
