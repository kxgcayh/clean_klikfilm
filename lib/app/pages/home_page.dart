import 'package:fl_klikfilm/app/providers/banner/banner_provider.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/app/widgets/kf_image.dart';
import 'package:fl_klikfilm/app/widgets/kf_shimmer.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetController = useMemoized(() => SheetController());
    final bannerProvider = ref.watch(bannerStateProvider);
    // final categoriesProvider = ref.watch(categoriesFutureProvider);
    final dummies = List.generate(100, (index) => 'Item-$index');
    return Scaffold(
      appBar: KfAppBar(),
      body: SlidingSheet(
        elevation: 1.0,
        extendBody: true,
        cornerRadius: 0,
        controller: sheetController,
        listener: (SheetState state) {
          klog.d('$state');
        },
        addTopViewPaddingOnFullscreen: true,
        minHeight: MediaQuery.of(context).size.height,
        duration: Duration(milliseconds: 1250),
        closeOnBackdropTap: true,
        isBackdropInteractable: true,
        scrollSpec: ScrollSpec(overscroll: true, overscrollColor: Colors.yellow),
        parallaxSpec: const ParallaxSpec(
          enabled: true,
          amount: 0.35,
          endExtent: 0.6,
        ),
        liftOnScrollHeaderElevation: 12.0,
        liftOnScrollFooterElevation: 12.0,

        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.255, 0.65, 1.0],
          positioning: SnapPositioning.relativeToSheetHeight,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.525,
          child: bannerProvider.when(
            data: (state) {
              return KFImage(
                width: double.infinity,
                '${state.banner.thumbnail?.the380x543}',
                onTap: () {},
              );
            },
            error: (error, stack) => GestureDetector(
              onTap: () => ref.invalidate(bannerStateProvider),
              child: KfShimmer(highlightColor: Colors.red),
            ),
            loading: () => KfShimmer(),
          ),
        ),
        // customBuilder:(context, controller, state) {},
        builder: (context, SheetState state) {
          // customBuilder: (context, controller, state) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.pictures.batikDrawer.path),
                alignment: Alignment.centerLeft,
                fit: BoxFit.fitHeight,
                repeat: ImageRepeat.repeatY,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            // child: Assets.pictures.batikDrawer.image(
            //   alignment: Alignment.centerLeft,
            //   fit: BoxFit.fitHeight,
            //   repeat: ImageRepeat.repeatY,
            // ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8FB001),
                        Color(0xFF6C8501),
                        Color(0xFF495A01),
                        Color(0xFF232B00),
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Assets.pictures.batikPanel.image(repeat: ImageRepeat.repeatX),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: dummies
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KfShimmer(
                                      width: 166,
                                      height: 27,
                                      baseColor: KColors.primaryGrey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(4.5),
                                    ),
                                    SizedBox(height: 4),
                                    KfShimmer(
                                      width: 24,
                                      height: 3,
                                      baseColor: KColors.primaryGrey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(4.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
