import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tanshoku_log/db/db_definition.dart';
import 'package:tanshoku_log/db/model/selection_result_status_model/selection_status_master_model.dart';
import '../entity/selection_status_master.dart';

part 'selection_status_master_repository.g.dart';

@riverpod
SelectionStatusMasterRepository selectionStatusMasterRepository(
    SelectionStatusMasterRepositoryRef ref) {
  return SelectionStatusMasterRepository(ref);
}

class SelectionStatusMasterRepository {
  SelectionStatusMasterRepository(this.ref);

  final Ref ref;

  Future<List<SelectionStatusMaster>> fetchList() async {
    final db = ref.watch(futureDbProvider).requireValue;
    var query = "SELECT * FROM selection_status_masters";
    final result = await db.rawQuery(query);
    final resultList =
        result.map((e) => SelectionStatusMasterModel.fromJson(e)).toList();
    final returnValue = resultList
        .map((e) => SelectionStatusMaster(
            id: e.id,
            name: e.name,
            createdAt: e.createdAt,
            updatedAt: e.updatedAt))
        .toList();
    return returnValue;
  }
}
