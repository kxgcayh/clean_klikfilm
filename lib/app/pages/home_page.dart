import 'package:fl_klikfilm/app/providers/banner/banner_notifier_provider.dart';
import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerProvider = ref.watch(bannerNotifierProvider);
    return Scaffold(
      key: primaryScaffoldKey,
      backgroundColor: Colors.yellow,
      appBar: KfAppBar(),
      drawer: Drawer(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage(Assets.pictures.batikDrawer.path),
              fit: BoxFit.fitHeight,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: KfAppBar(
              elevation: 20,
            ),
          ),
        ),
      ),
      body: SlidingSheet(
        elevation: 1.0,
        extendBody: true,
        cornerRadius: 0,
        listener: (state) {
          //
        },
        addTopViewPaddingOnFullscreen: true,
        minHeight: MediaQuery.of(context).size.height,
        duration: Duration(milliseconds: 1250),
        closeOnBackdropTap: true,
        isBackdropInteractable: true,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.25, 0.65, 1.0],
          positioning: SnapPositioning.relativeToSheetHeight,
        ),
        body: bannerProvider.when(
          data: (state) {
            return GestureDetector(
              onTap: () => klog.i(state),
              child: Image.network('${state.banner.thumbnail?.the380x543}'),
            );
          },
          error: (error, stack) => Center(
            child: Text('BANNER ERROR'),
          ),
          loading: () => Center(
            child: Text('BANNER LOADING'),
          ),
        ),
        builder: (context, SheetState state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            // height: 500,
            child: Text(
              '($state)',
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
