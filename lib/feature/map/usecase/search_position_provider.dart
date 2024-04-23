import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../selection_compony/read_model/selection_company.dart';

part 'search_position_provider.g.dart';

@riverpod
class SearchPosition extends _$SearchPosition{
  @override
  LatLng build() {
    return const LatLng(100, 100);
    // API通信などの非同期処理で初期化
  }
}

@Riverpod(keepAlive: false)
Future<LatLng> futureSearchPositionFamily(FutureSearchPositionFamilyRef ref, String areaName) async {
  final position = await locationFromAddress(areaName);
  return LatLng(position.first.latitude, position.first.longitude);
}

@riverpod
SelectionCompany selectionCompanyScoped(SelectionCompanyScopedRef ref){
  return SelectionCompany();
}