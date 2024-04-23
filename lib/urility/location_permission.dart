import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

enum LocationSettingResult {
  serviceDisabled,
  permissionDenied,
  permissionDeniedForever,
  enabled,
}

// 位置情報に関するパーミションを確認
Future<LocationSettingResult> checkLocationSetting() async {
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // logger.w('Location services are disabled.');
    return Future.value(LocationSettingResult.serviceDisabled);
  }
  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // logger.w('Location permissions are denied.');
      return Future.value(LocationSettingResult.permissionDenied);
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // logger.w('Location permissions are permanently denied.');
    return Future.value(LocationSettingResult.permissionDeniedForever);
  }
  return Future.value(LocationSettingResult.enabled);
}

Future<void> recoverLocationSettings(
    BuildContext context, LocationSettingResult locationResult) async {
  if (locationResult == LocationSettingResult.enabled) {
    return;
  }
  final result = await showOkCancelAlertDialog(
    context: context,
    okLabel: 'OK',
    cancelLabel: 'キャンセル',
    title: 'xxxxxxx',
    message: 'xxxxxxxxxxxx',
  );
  if (result == OkCancelResult.cancel) {
    // logger.w('Cancel recover location settings.');
  } else {
    locationResult == LocationSettingResult.serviceDisabled
        ? await Geolocator.openLocationSettings()
        : await Geolocator.openAppSettings();
  }
}