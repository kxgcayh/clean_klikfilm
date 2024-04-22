// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoCategoriesState {
  int get total => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  List<VideoHomeCategoryModel> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoCategoriesStateCopyWith<VideoCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCategoriesStateCopyWith<$Res> {
  factory $VideoCategoriesStateCopyWith(VideoCategoriesState value,
          $Res Function(VideoCategoriesState) then) =
      _$VideoCategoriesStateCopyWithImpl<$Res, VideoCategoriesState>;
  @useResult
  $Res call({int total, int index, List<VideoHomeCategoryModel> data});
}

/// @nodoc
class _$VideoCategoriesStateCopyWithImpl<$Res,
        $Val extends VideoCategoriesState>
    implements $VideoCategoriesStateCopyWith<$Res> {
  _$VideoCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? index = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VideoHomeCategoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoCategoriesStateImplCopyWith<$Res>
    implements $VideoCategoriesStateCopyWith<$Res> {
  factory _$$VideoCategoriesStateImplCopyWith(_$VideoCategoriesStateImpl value,
          $Res Function(_$VideoCategoriesStateImpl) then) =
      __$$VideoCategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int index, List<VideoHomeCategoryModel> data});
}

/// @nodoc
class __$$VideoCategoriesStateImplCopyWithImpl<$Res>
    extends _$VideoCategoriesStateCopyWithImpl<$Res, _$VideoCategoriesStateImpl>
    implements _$$VideoCategoriesStateImplCopyWith<$Res> {
  __$$VideoCategoriesStateImplCopyWithImpl(_$VideoCategoriesStateImpl _value,
      $Res Function(_$VideoCategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? index = null,
    Object? data = null,
  }) {
    return _then(_$VideoCategoriesStateImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VideoHomeCategoryModel>,
    ));
  }
}

/// @nodoc

class _$VideoCategoriesStateImpl implements _VideoCategoriesState {
  const _$VideoCategoriesStateImpl(
      {this.total = 0,
      this.index = 0,
      final List<VideoHomeCategoryModel> data =
          const <VideoHomeCategoryModel>[]})
      : _data = data;

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int index;
  final List<VideoHomeCategoryModel> _data;
  @override
  @JsonKey()
  List<VideoHomeCategoryModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'VideoCategoriesState(total: $total, index: $index, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoCategoriesStateImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, total, index, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoCategoriesStateImplCopyWith<_$VideoCategoriesStateImpl>
      get copyWith =>
          __$$VideoCategoriesStateImplCopyWithImpl<_$VideoCategoriesStateImpl>(
              this, _$identity);
}

abstract class _VideoCategoriesState implements VideoCategoriesState {
  const factory _VideoCategoriesState(
      {final int total,
      final int index,
      final List<VideoHomeCategoryModel> data}) = _$VideoCategoriesStateImpl;

  @override
  int get total;
  @override
  int get index;
  @override
  List<VideoHomeCategoryModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$VideoCategoriesStateImplCopyWith<_$VideoCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
