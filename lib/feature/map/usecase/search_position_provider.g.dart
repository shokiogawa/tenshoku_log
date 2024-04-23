// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_position_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$futureSearchPositionFamilyHash() =>
    r'9fd304ae19b6bfd6866a5ebfea909574bf5e0d48';

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

/// See also [futureSearchPositionFamily].
@ProviderFor(futureSearchPositionFamily)
const futureSearchPositionFamilyProvider = FutureSearchPositionFamilyFamily();

/// See also [futureSearchPositionFamily].
class FutureSearchPositionFamilyFamily extends Family<AsyncValue<LatLng>> {
  /// See also [futureSearchPositionFamily].
  const FutureSearchPositionFamilyFamily();

  /// See also [futureSearchPositionFamily].
  FutureSearchPositionFamilyProvider call(
    String areaName,
  ) {
    return FutureSearchPositionFamilyProvider(
      areaName,
    );
  }

  @override
  FutureSearchPositionFamilyProvider getProviderOverride(
    covariant FutureSearchPositionFamilyProvider provider,
  ) {
    return call(
      provider.areaName,
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
  String? get name => r'futureSearchPositionFamilyProvider';
}

/// See also [futureSearchPositionFamily].
class FutureSearchPositionFamilyProvider
    extends AutoDisposeFutureProvider<LatLng> {
  /// See also [futureSearchPositionFamily].
  FutureSearchPositionFamilyProvider(
    String areaName,
  ) : this._internal(
          (ref) => futureSearchPositionFamily(
            ref as FutureSearchPositionFamilyRef,
            areaName,
          ),
          from: futureSearchPositionFamilyProvider,
          name: r'futureSearchPositionFamilyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$futureSearchPositionFamilyHash,
          dependencies: FutureSearchPositionFamilyFamily._dependencies,
          allTransitiveDependencies:
              FutureSearchPositionFamilyFamily._allTransitiveDependencies,
          areaName: areaName,
        );

  FutureSearchPositionFamilyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.areaName,
  }) : super.internal();

  final String areaName;

  @override
  Override overrideWith(
    FutureOr<LatLng> Function(FutureSearchPositionFamilyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FutureSearchPositionFamilyProvider._internal(
        (ref) => create(ref as FutureSearchPositionFamilyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        areaName: areaName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LatLng> createElement() {
    return _FutureSearchPositionFamilyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FutureSearchPositionFamilyProvider &&
        other.areaName == areaName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, areaName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FutureSearchPositionFamilyRef on AutoDisposeFutureProviderRef<LatLng> {
  /// The parameter `areaName` of this provider.
  String get areaName;
}

class _FutureSearchPositionFamilyProviderElement
    extends AutoDisposeFutureProviderElement<LatLng>
    with FutureSearchPositionFamilyRef {
  _FutureSearchPositionFamilyProviderElement(super.provider);

  @override
  String get areaName =>
      (origin as FutureSearchPositionFamilyProvider).areaName;
}

String _$selectionCompanyScopedHash() =>
    r'cb3e48f418c198d72ddeb8c4cee27a028b49cac9';

/// See also [selectionCompanyScoped].
@ProviderFor(selectionCompanyScoped)
final selectionCompanyScopedProvider =
    AutoDisposeProvider<SelectionCompany>.internal(
  selectionCompanyScoped,
  name: r'selectionCompanyScopedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectionCompanyScopedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SelectionCompanyScopedRef = AutoDisposeProviderRef<SelectionCompany>;
String _$searchPositionHash() => r'348bbcea0b31d4b06cf79589a47b3a8d3922ee2c';

/// See also [SearchPosition].
@ProviderFor(SearchPosition)
final searchPositionProvider =
    AutoDisposeNotifierProvider<SearchPosition, LatLng>.internal(
  SearchPosition.new,
  name: r'searchPositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchPositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchPosition = AutoDisposeNotifier<LatLng>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
