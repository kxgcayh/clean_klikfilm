import 'package:fl_klikfilm/app/providers/banner/banner_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

final bannerStateProvider = FutureProvider((ref) async {
  VideoDetailResponseModel? detailResponse;
  final BannerResponseModel bannerResponse = await ref.watch(bannerHighlightsProvider);
  if (bannerResponse.data.isNotEmpty) {
    final BannerModel banner = bannerResponse.data.first;
    detailResponse = await ref.read(
      videoDetailProvider(
        VideoDetailFamily(custom: banner.custom, subcategoryId: banner.subcategory?.id, videoId: banner.id),
      ),
    );
  }

  return BannerState(banner: bannerResponse.data.first, detail: detailResponse?.data);
});
