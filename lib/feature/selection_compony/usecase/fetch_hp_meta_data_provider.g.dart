// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_hp_meta_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$futureFetchHpMetaDataHash() =>
    r'3b1f4d0148fa08ebfbf2b7f984b43304bd07b00a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [futureFetchHpMetaData].
@ProviderFor(futureFetchHpMetaData)
const futureFetchHpMetaDataProvider = FutureFetchHpMetaDataFamily();

/// See also [futureFetchHpMetaData].
class FutureFetchHpMetaDataFamily extends Family<AsyncValue<HpInfo>> {
  /// See also [futureFetchHpMetaData].
  const FutureFetchHpMetaDataFamily();

  /// See also [futureFetchHpMetaData].
  FutureFetchHpMetaDataProvider call(
    String hpUrl,
  ) {
    return FutureFetchHpMetaDataProvider(
      hpUrl,
    );
  }

  @override
  FutureFetchHpMetaDataProvider getProviderOverride(
    covariant FutureFetchHpMetaDataProvider provider,
  ) {
    return call(
      provider.hpUrl,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'futureFetchHpMetaDataProvider';
}

/// See also [futureFetchHpMetaData].
class FutureFetchHpMetaDataProvider extends AutoDisposeFutureProvider<HpInfo> {
  /// See also [futureFetchHpMetaData].
  FutureFetchHpMetaDataProvider(
    String hpUrl,
  ) : this._internal(
          (ref) => futureFetchHpMetaData(
            ref as FutureFetchHpMetaDataRef,
            hpUrl,
          ),
          from: futureFetchHpMetaDataProvider,
          name: r'futureFetchHpMetaDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$futureFetchHpMetaDataHash,
          dependencies: FutureFetchHpMetaDataFamily._dependencies,
          allTransitiveDependencies:
              FutureFetchHpMetaDataFamily._allTransitiveDependencies,
          hpUrl: hpUrl,
        );

  FutureFetchHpMetaDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.hpUrl,
  }) : super.internal();

  final String hpUrl;

  @override
  Override overrideWith(
    FutureOr<HpInfo> Function(FutureFetchHpMetaDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FutureFetchHpMetaDataProvider._internal(
        (ref) => create(ref as FutureFetchHpMetaDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        hpUrl: hpUrl,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<HpInfo> createElement() {
    return _FutureFetchHpMetaDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FutureFetchHpMetaDataProvider && other.hpUrl == hpUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hpUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FutureFetchHpMetaDataRef on AutoDisposeFutureProviderRef<HpInfo> {
  /// The parameter `hpUrl` of this provider.
  String get hpUrl;
}

class _FutureFetchHpMetaDataProviderElement
    extends AutoDisposeFutureProviderElement<HpInfo>
    with FutureFetchHpMetaDataRef {
  _FutureFetchHpMetaDataProviderElement(super.provider);

  @override
  String get hpUrl => (origin as FutureFetchHpMetaDataProvider).hpUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
