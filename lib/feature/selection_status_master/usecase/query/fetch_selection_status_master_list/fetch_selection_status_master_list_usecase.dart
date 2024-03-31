

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tanshoku_log/feature/selection_status_master/repository/selection_status_master_repository.dart';

import '../../../entity/selection_status_master.dart';

part 'fetch_selection_status_master_list_usecase.g.dart';

@riverpod
Future<List<SelectionStatusMaster>> futureFetchSelectionStatusMasterList(FutureFetchSelectionStatusMasterListRef ref)async{
  final repo = ref.watch(selectionStatusMasterRepositoryProvider);
  return await repo.fetchList();
}