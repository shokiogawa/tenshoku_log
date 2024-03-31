import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/db/db_definition.dart';
import 'package:tanshoku_log/page/home_page/component/selection_list_card.dart';

import '../../../feature/selection_compony/usecase/query/fetch_selection_company_list/fetch_selection_company_list_provider.dart';

class HomePageBody extends HookConsumerWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbAsyncValue = ref.watch(futureDbProvider);
    switch (dbAsyncValue) {
      // 正常処理
      case AsyncData(:final value):
        return const MainBody();
      // エラー処理
      case AsyncError(:final error):
        print(error);
        return Center(child: Text('Error: $error'));
      // ローディング処理
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class MainBody extends HookConsumerWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(futureFetchSelectionCompanyListProvider);
    switch (async) {
      // 正常処理
      case AsyncData(:final value):
        return ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              return SelectionListCard(selectionCompany: value[index]);
            });
      // エラー処理
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      // ローディング処理
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
