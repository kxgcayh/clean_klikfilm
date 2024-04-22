import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

part 'video_categories_state.freezed.dart';

@freezed
class VideoCategoriesState with _$VideoCategoriesState {
  const factory VideoCategoriesState({
    @Default(0) int total,
    @Default(0) int index,
    @Default(<VideoHomeCategoryModel>[]) List<VideoHomeCategoryModel> data,
  }) = _VideoCategoriesState;
}
