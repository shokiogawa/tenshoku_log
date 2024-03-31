import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tanshoku_log/feature/selection_compony/repository/selection_company_repository.dart';

import '../../../read_model/selection_company.dart';
part 'fetch_selection_company_list_provider.g.dart';

@riverpod
Future<List<SelectionCompany>> futureFetchSelectionCompanyList(FutureFetchSelectionCompanyListRef ref)async{
  final repository = ref.watch(selectionCompanyRepositoryProvider);
  return await repository.fetchList();
}