import 'package:fl_klikfilm/app/providers/banner/banner_notifier_provider.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerProvider = ref.watch(bannerNotifierProvider);
    return Scaffold(
      appBar: KfAppBar(),
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
              onTap: () async {
                final result = await ref.read(listHomeCategoryProvider);
                klog.i(result);
              },
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
          return Container(
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
