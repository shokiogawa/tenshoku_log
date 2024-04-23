import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_provider.g.dart';

@riverpod
class LoadingNotifier extends _$LoadingNotifier{

  @override
  bool build() => false;

  // ローディングを表示
  void show() => state = true;

  // ローディングを非表示
  void hide() => state = false;
}