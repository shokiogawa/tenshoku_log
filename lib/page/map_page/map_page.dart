import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/feature/map/usecase/search_position_provider.dart';

import '../../feature/map/usecase/fetch_current_position_provider.dart';

class GoogleMapPage extends HookConsumerWidget {
  const GoogleMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GoogleMapBody(),
    );
  }
}

class GoogleMapBody extends HookConsumerWidget {
  GoogleMapBody({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionCompany = ref.watch(selectionCompanyScopedProvider);
    final asyncValue =
        ref.watch(futureSearchPositionFamilyProvider(selectionCompany.name ?? "東京タワー"));
    switch (asyncValue) {
      // 正常処理
      case AsyncData(:final value):
        final Set<Marker> marks = {
          Marker(
              markerId: const MarkerId("current"),
              position: value,
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: const InfoWindow(title: "現在地"))
        };
        return Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(target: value, zoom: 17),
              myLocationEnabled: true,
              markers: marks,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.orangeAccent,
                  child: const Text("カーソル配置")),
            )
          ],
        );
      // エラー処理
      case AsyncError(:final error):
        final currentValue =
            ref.watch(fetchCurrentPositionProvider).requireValue;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            "位置情報を取得できませんでした。",
          )));
        });

        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(target: currentValue, zoom: 17),
          myLocationEnabled: true,
          //markers: marks,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        );
      // ローディング処理
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
