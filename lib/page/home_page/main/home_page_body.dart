import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/db/db_definition.dart';
import 'package:tanshoku_log/feature/map/usecase/fetch_current_position_provider.dart';
import 'package:tanshoku_log/feature/map/usecase/search_position_provider.dart';
import 'package:tanshoku_log/feature/selection_compony/usecase/selection_company_usecase.dart';
import 'package:tanshoku_log/page/home_page/component/selection_list_card.dart';

class HomePageBody extends HookConsumerWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbAsyncValue = ref.watch(futureDbProvider);
    ref.watch(fetchCurrentPositionProvider);
    switch (dbAsyncValue) {
      // 正常処理
      case AsyncData(:final value):
        return const MainBody();
      // エラー処理
      case AsyncError(:final error):
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
    final async = ref.watch(fetchSelectionCompanyUseCaseProvider);

    // 参照系 & 更新系
    ref.listen(
        fetchSelectionCompanyUseCaseProvider,
            (previous, next) {
      if (next.hasError && next.hasValue && !next.isLoading) {
        // 更新処理時、エラー発生した場合のエラーハンドリング
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red.withOpacity(0.7),
            content: const Text("エラーが発生しました。")));
      }
      if (next.hasValue) {}
      if (next.isLoading) {}
    },onError: (err, stac){

    });

    // 更新処理系
    ref.listen(selectionCompanyUseCaseProvider, (previous, next) {
      if (next.hasError) {
        // 更新処理時、エラー発生した場合のエラーハンドリング
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red.withOpacity(0.7),
            content: const Text("エラーが発生しました。")));
      }
      if (next.hasValue && !next.isLoading && !next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green.withOpacity(0.7),
            content: const Text(
              "保存しました。",
            )));
      }
    });
    switch (async) {
      // データが存在していて、エラーが存在している場合
      // case AsyncValue(hasValue: true, :final value):
      //   return const Text("エラー");
      // 正常処理
      // データを持っていて、エラーも持っている可能性のある場合。
      case AsyncValue(hasValue: true, :final value?):
        return ReorderableListView.builder(
            proxyDecorator: (widget, index, animation) {
              return Material(
                color: Colors.transparent,
                child: widget,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return ProviderScope(
                  key: ValueKey(value[index]),
                  overrides: [
                    selectionCompanyScopedProvider
                        .overrideWithValue(value[index])
                  ],
                  child: const SelectionCompanyCard());
            },
            itemCount: value.length,
            onReorder: (oldIndex, newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              ref
                  .read(fetchSelectionCompanyUseCaseProvider.notifier)
                  .changeOrder(value, value[oldIndex].id!, oldIndex, newIndex);
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
