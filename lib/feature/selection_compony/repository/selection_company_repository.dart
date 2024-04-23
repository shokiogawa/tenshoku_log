import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tanshoku_log/core/configuration.dart';
import '../../../db/db_definition.dart';
import '../../../db/model/selection_company_model/selection_company_model.dart';
import '../read_model/selection_company.dart';

part 'selection_company_repository.g.dart';

@riverpod
SelectionCompanyRepository selectionCompanyRepository(
    SelectionCompanyRepositoryRef ref) {
  return SelectionCompanyRepository(ref);
}

class SelectionCompanyRepository {
  SelectionCompanyRepository(this.ref);

  static const tableName = "selection_companies";

  final Ref ref;

  // リストデータ取得
  Future<List<SelectionCompany>> fetchList() async {
    final db = ref.watch(futureDbProvider).requireValue;

    var query = "SELECT "
        "sc.*, "
        "srm.name AS 'selectionResultName',"
        "ssm.name AS 'selectionStatusName' "
        "FROM selection_companies AS sc"
        " INNER JOIN selection_result_masters AS srm ON sc.selectionResultMasterId = srm.id "
        " INNER JOIN selection_status_masters ssm ON sc.selectionStatusMasterId = ssm.id"
        " ORDER BY sc.orderNumber asc";

    final result = await db.rawQuery(query);
    final resultList = result.map((e) => SelectionCompany.fromJson(e)).toList();
    // throw Exception("エラーだよ");
    return resultList;
  }

  // 詳細データ取得
  Future<SelectionCompany?> fetchDetail(int id) async {
    final db = ref.watch(futureDbProvider).requireValue;
    final resultMapList = await db
        .rawQuery("SELECT * FROM selection_companies WHERE id = ?", [id]);
    return SelectionCompany.fromJson(resultMapList.first);
  }

  // データ追加
  Future<void> add(SelectionCompanyModel data) async {
    final insertData =
        data.copyWith(createdAt: DateTime.now(), updatedAt: DateTime.now());
    final db = await ref.watch(futureDbProvider.future);
    await db.insert('selection_companies', insertData.toJson());
  }

  // 更新処理
  Future<void> update(SelectionCompanyModel data) async {
    data = data.copyWith(updatedAt: DateTime.now());
    final db = await ref.watch(futureDbProvider.future);
    await db.update('selection_companies', data.toJson(),
        where: "id=?", whereArgs: [data.id]);
  }

  // 削除
  Future<void> delete(int id) async {
    await Future.delayed(const Duration(seconds: 3));
    final db = await ref.watch(futureDbProvider.future);
    await db.delete('selection_companies', where: "id=?", whereArgs: [id]);
  }

  // 順番変更
  Future<void> orderChange(List<SelectionCompanyModel> dataList) async {
    final db = ref.watch(futureDbProvider).requireValue;
    await db.transaction((txn) async {
      await Future.forEach(dataList, (data) async {
        print(data.name);
        await txn.rawUpdate(
            'UPDATE selection_companies SET orderNumber = ? WHERE id = ?;',
            [data.orderNumber, data.id]);
      });
    });
  }
}
