import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../read_model/hp_info.dart';

part 'hp_meta_data_repository.g.dart';

@riverpod
HpMetaDataRepository httpRepository(HttpRepositoryRef ref) {
  return HpMetaDataRepository();
}

class HpMetaDataRepository {
  Future<HpInfo> getHpInfo(String url) async {
    late HpInfo returnValue = HpInfo();
    final Response response = await get(Uri.parse(url));

    var document = parse(response.body);
    // title取得
    final title = document.head!.getElementsByTagName('title')[0].innerHtml;
    // meta情報取得
    final metas = document.head!.getElementsByTagName('meta');
    returnValue = returnValue.copyWith(hpTitle: title);
    for (var meta in metas) {
      if (meta.attributes['property'] == 'og:image') {
        returnValue =
            returnValue.copyWith(imageUrl: meta.attributes['content'] ?? "");
      }
    }
    return returnValue;
  }
}
