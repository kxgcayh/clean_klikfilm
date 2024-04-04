part of 'banner_notifier_provider.dart';

class BannerNotifier extends AsyncNotifier<BannerState> {
  @override
  FutureOr<BannerState> build() async {
    VideoDetailResponseModel? detailResponse;
    final LocalUserDataModel localUser = ref.watch(localUserNotifierProvider);
    final VideoCatalogRepository repository = ref.read(videoCatalogRepositoryProvider);
    final BannerResponseModel bannerResponse = await repository.bannerHighlights(
      tel: localUser.telcoCode,
      cc: localUser.countryCode,
    );
    final BannerModel banner = bannerResponse.data.first;
    if (banner.subcategory?.id != null) {
      detailResponse = await repository.videoDetailApp(
        tel: localUser.telcoCode,
        uid: '${localUser.userId}',
        cst: banner.custom,
        subCat: banner.subcategory?.id,
        vid: banner.id,
        tok: '${localUser.accessToken}',
        cc: localUser.countryCode,
      );
    }

    return BannerState(banner: bannerResponse.data.first, detail: detailResponse?.data);
  }
}
