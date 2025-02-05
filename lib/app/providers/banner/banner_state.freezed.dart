// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BannerState {
  BannerModel get banner => throw _privateConstructorUsedError;
  VideoDetailModel? get detail => throw _privateConstructorUsedError;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerStateCopyWith<BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
          BannerState value, $Res Function(BannerState) then) =
      _$BannerStateCopyWithImpl<$Res, BannerState>;
  @useResult
  $Res call({BannerModel banner, VideoDetailModel? detail});
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banner = null,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as BannerModel,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as VideoDetailModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerStateImplCopyWith<$Res>
    implements $BannerStateCopyWith<$Res> {
  factory _$$BannerStateImplCopyWith(
          _$BannerStateImpl value, $Res Function(_$BannerStateImpl) then) =
      __$$BannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BannerModel banner, VideoDetailModel? detail});
}

/// @nodoc
class __$$BannerStateImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerStateImpl>
    implements _$$BannerStateImplCopyWith<$Res> {
  __$$BannerStateImplCopyWithImpl(
      _$BannerStateImpl _value, $Res Function(_$BannerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banner = null,
    Object? detail = freezed,
  }) {
    return _then(_$BannerStateImpl(
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as BannerModel,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as VideoDetailModel?,
    ));
  }
}

/// @nodoc

class _$BannerStateImpl implements _BannerState {
  const _$BannerStateImpl({required this.banner, this.detail});

  @override
  final BannerModel banner;
  @override
  final VideoDetailModel? detail;

  @override
  String toString() {
    return 'BannerState(banner: $banner, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerStateImpl &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, banner, detail);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      __$$BannerStateImplCopyWithImpl<_$BannerStateImpl>(this, _$identity);
}

abstract class _BannerState implements BannerState {
  const factory _BannerState(
      {required final BannerModel banner,
      final VideoDetailModel? detail}) = _$BannerStateImpl;

  @override
  BannerModel get banner;
  @override
  VideoDetailModel? get detail;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
