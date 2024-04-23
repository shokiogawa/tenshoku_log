
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_current_position_provider.g.dart';

@riverpod
Future<LatLng> fetchCurrentPosition(FetchCurrentPositionRef ref) async {
  final position = await Geolocator.getCurrentPosition();
  // locationFromAddress(address)
  return LatLng(position.latitude, position.longitude);
}