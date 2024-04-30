import 'package:fl_klikfilm/app/providers/banner/banner_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

final bannerStateProvider = FutureProvider((ref) async {
  VideoDetailResponseModel? detailResponse;
  final LocalUserDataModel localUser = ref.watch(localUserNotifierProvider);
  final VideoCatalogRepository repository = ref.read(videoCatalogRepositoryProvider);
  final BannerResponseModel bannerResponse = await ref.read(bannerHighlightsProvider);
  final BannerModel banner = bannerResponse.data.first;
  if (banner.subcategory?.id != null) {
    detailResponse = await repository.videoDetailApp(
      tel: localUser.telcoCode,
      uid: localUser.userId,
      cst: banner.custom,
      subCat: banner.subcategory?.id,
      vid: banner.id,
      tok: localUser.accessToken,
      cc: localUser.countryCode,
    );
  }

  return BannerState(banner: bannerResponse.data.first, detail: detailResponse?.data);
});
