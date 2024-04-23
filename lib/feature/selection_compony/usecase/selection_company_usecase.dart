import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tanshoku_log/feature/selection_compony/repository/selection_company_repository.dart';
import 'package:tanshoku_log/urility/loading_provider.dart';
import '../../../db/model/selection_company_model/selection_company_model.dart';
import '../../selection_result_master/model/selection_result_master_enum.dart';
import '../read_model/selection_company.dart';

part 'selection_company_usecase.g.dart';

// 検索用プロバイダー
@riverpod
class IsIncludeDeclineFlag extends _$IsIncludeDeclineFlag {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

// 参照プロバイダー
@riverpod
class FetchSelectionCompanyUseCase extends _$FetchSelectionCompanyUseCase {
  @override
  FutureOr<List<SelectionCompany>> build() {
    return _future();
  }

  // データ取得
  Future<List<SelectionCompany>> _future() async {
    final isIncludeFlag = ref.watch(isIncludeDeclineFlagProvider);
    final listAll =
        await ref.watch(selectionCompanyRepositoryProvider).fetchList();
    return isIncludeFlag
        ? listAll
        : listAll
            .where((element) => element.selectionStatusMasterId != 9)
            .toList();
  }

  Future<void> search() async {
    // 変更
    ref.watch(isIncludeDeclineFlagProvider.notifier).toggle();

    // 読み込み中の状態
    state =
        const AsyncLoading<List<SelectionCompany>>().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      return await _future();
    });
  }

  // 順番変更
  Future<void> changeOrder(List<SelectionCompany> currentList, int targetId,
      int oldIndex, int newIndex) async {
    final newList = [...currentList];
    final targetData = newList.removeAt(oldIndex);
    newList.insert(newIndex, targetData);

    final List<SelectionCompanyModel> list = [];
    newList.asMap().forEach((index, value) {
      final newValue = SelectionCompanyModel(
          id: value.id, orderNumber: index + 1, name: value.name);
      list.add(newValue);
    });

    // メモリ上で順番変更を反映
    update((data) {
      data = newList;
      return data;
    });
    state =
        const AsyncLoading<List<SelectionCompany>>().copyWithPrevious(state);
    state = (await AsyncValue.guard(()async{
      await ref.watch(selectionCompanyRepositoryProvider).orderChange(list);
      return await _future();
    }));
  }
}

// 更新プロバイダー
@riverpod
class SelectionCompanyUseCase extends _$SelectionCompanyUseCase {
  @override
  FutureOr<void> build() {}

  // 追加処理
  Future<void> addInvoke(String name, String memo, String url,
      DateTime? nextScheduleDateTime) async {
    await Future.delayed(const Duration(seconds: 5));
    final data = SelectionCompanyModel(
        name: name,
        memo: memo,
        url: url,
        nextScheduledDate: nextScheduleDateTime,
        selectionResultMasterId: SelectionResultMasterEnum.inSelection.value,
        selectionStatusMasterId: 1);

    // 読み込み中の状態
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      ref.watch(selectionCompanyRepositoryProvider).add(data);
    });

    ref.invalidate(fetchSelectionCompanyUseCaseProvider);
  }

  // 更新処理
  Future<void> updateInvoke(SelectionCompany data) async {
    final updateValue = SelectionCompanyModel(
        id: data.id,
        name: data.name,
        memo: data.memo,
        url: data.url,
        nextScheduledDate: data.nextScheduledDate,
        agentId: data.agentId,
        selectionResultMasterId: data.selectionResultMasterId,
        selectionStatusMasterId: data.selectionStatusMasterId,
        orderNumber: data.orderNumber ?? 0,
        createdAt: data.createdAt);

    // 読み込み中の状態
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      ref.watch(selectionCompanyRepositoryProvider).update(updateValue);
    });
    ref.invalidate(fetchSelectionCompanyUseCaseProvider);
  }

  // 削除処理
  Future<void> delete(int id) async {
    final loadingNotifier = ref.watch(loadingNotifierProvider.notifier);
    loadingNotifier.show();
    // 読み込み中の状態
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      ref.watch(selectionCompanyRepositoryProvider).delete(id);
    });
    ref.invalidate(fetchSelectionCompanyUseCaseProvider);
    loadingNotifier.hide();
  }
}
