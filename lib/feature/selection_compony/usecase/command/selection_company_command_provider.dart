import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tanshoku_log/db/model/selection_company_model/selection_company_model.dart';
import 'package:tanshoku_log/feature/selection_compony/repository/selection_company_repository.dart';
import 'package:tanshoku_log/feature/selection_compony/usecase/query/fetch_selection_company_list/fetch_selection_company_list_provider.dart';
import 'package:tanshoku_log/feature/selection_status_master/usecase/query/fetch_selection_status_master_list/fetch_selection_status_master_list_usecase.dart';

part 'selection_company_command_provider.g.dart';

@riverpod
class SelectionCompanyCommand extends _$SelectionCompanyCommand {
  @override
  Future<void> build() async => {};

  // 追加処理
  Future<void> addSelectionCompany(SelectionCompanyModel data) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 10));

    state = await AsyncValue.guard(
        () => ref.watch(selectionCompanyRepositoryProvider).add(data));

    ref.invalidate(futureFetchSelectionCompanyListProvider);
  }
}
