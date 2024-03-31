import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tanshoku_log/feature/selection_compony/repository/hp_meta_data_repository.dart';

import '../../../read_model/hp_info.dart';

part 'fetch_hp_meta_data_provider.g.dart';

@riverpod
Future<HpInfo> futureFetchHpMetaData(
    FutureFetchHpMetaDataRef ref, String hpUrl) async {
  final repository = ref.watch(httpRepositoryProvider);
  return await repository.getHpInfo(hpUrl);
}
