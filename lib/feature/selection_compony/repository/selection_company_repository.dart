import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tanshoku_log/db/model/selection_company_model/selection_company_model.dart';

import '../../../db/db_definition.dart';
import '../read_model/selection_company.dart';
part 'selection_company_repository.g.dart';

@riverpod
SelectionCompanyRepository selectionCompanyRepository(SelectionCompanyRepositoryRef ref){
  return SelectionCompanyRepository(ref);
}

class SelectionCompanyRepository {
  SelectionCompanyRepository(this.ref);

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
        " INNER JOIN selection_status_masters ssm ON sc.selectionStatusMasterId = ssm.id";

    final result = await db.rawQuery(query);
    final resultList = result.map((e) => SelectionCompany.fromJson(e)).toList();
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
  Future<void> add(SelectionCompanyModel data)async{
    final db = ref.watch(futureDbProvider).requireValue;
    await db.insert('selection_companies', data.toJson());
  }
}
