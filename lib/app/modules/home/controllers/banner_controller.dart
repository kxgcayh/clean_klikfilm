import 'package:fl_klikfilm/app/modules/home/data/banner_state.dart';
import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class BannerController extends GetxController with StateMixin<BannerState> {
  final UserAuthData authenticated;
  BannerController({required this.authenticated});

  @override
  Future<void> onInit() async {
    final videoRepository = Get.find<VideoCatalogRepository>();
    change(null, status: RxStatus.loading());

    final banner = await videoRepository.bannerHighlights();
    klog.i(banner);
    if (banner.data.isNotEmpty) {
      change(BannerState(banner: banner.data.first), status: RxStatus.success());

      if (state != null && state?.banner.subcategory?.id != null) {
        final detail = await videoRepository.videoDetailApp(
          uid: authenticated.userId,
          cst: int.tryParse('${state?.banner.custom}'),
          subCat: int.parse('${state?.banner.subcategory?.id}'),
          vid: int.parse('${state?.banner.id}'),
          tok: authenticated.accessToken,
        );
        change(state!.copyWith(detail: detail.data), status: RxStatus.success());
      }
    } else {
      change(null, status: RxStatus.error());
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
