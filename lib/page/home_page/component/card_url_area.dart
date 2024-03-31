import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/feature/selection_compony/usecase/query/fetch_hp_meta_data/fetch_hp_meta_data_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CardUrlArea extends HookConsumerWidget {
  const CardUrlArea({super.key, required this.hpUrl});

  final String hpUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(futureFetchHpMetaDataProvider(hpUrl));
    switch (asyncValue) {
      // 正常処理
      case AsyncData(:final value):
        return GestureDetector(
          onTap: () async {
            if (!await launchUrl(Uri.parse(hpUrl))) {
              throw 'Could not launch $hpUrl';
            }
          },
          child: Row(
            children: [
              // 画像エリア
              (value.imageUrl != null || value.imageUrl != "")
                  ? Expanded(
                      flex: 1,
                      child: Image(
                          image: CachedNetworkImageProvider(value.imageUrl!)))
                  : Container(),

              // HPタイトル
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      value.hpTitle ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
              const Expanded(flex: 1, child: Icon(Icons.navigate_next))
              // Image(image: value.imageUrl ?? "")
              // Image(image: value.)
            ],
          ),
        );
      // エラー処理
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      // ローディング処理
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
