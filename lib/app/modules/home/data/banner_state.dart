import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

part 'banner_state.freezed.dart';

@freezed
sealed class BannerState with _$BannerState {
  const factory BannerState({
    required BannerModel banner,
    VideoDetailModel? detail,
  }) = _BannerState;
}
