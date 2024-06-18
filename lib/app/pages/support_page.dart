import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/app/widgets/kf_shimmer.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class SupportPage extends ConsumerWidget {
  final GeneralInformationType type;
  const SupportPage({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final support = ref.watch(generalInformationProvider(type));
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          image: AssetImage(Assets.pictures.batikDrawer.path),
          fit: BoxFit.fitHeight,
          repeat: ImageRepeat.repeatY,
        ),
      ),
      child: Scaffold(
        appBar: KfAppBar(),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Assets.pictures.supportHeader.image(
              height: 250,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
              fit: BoxFit.fill,
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: support.when(
                  data: (result) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 155),
                      Text(
                        '${result.data?.title}',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: HtmlWidget(
                            '${result.data?.text}',
                            textStyle: TextStyle(
                              color: KColors.grey,
                              fontSize: 16,
                              fontFamily: FontFamily.nunito,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  error: (error, stackTrace) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 155),
                      Text(
                        'Error',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: TextButton(
                              onPressed: () => ref.invalidate(generalInformationProvider(type)),
                              child: Text('Refresh')),
                        ),
                      ),
                    ],
                  ),
                  loading: () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 155),
                      KfShimmer(
                        height: 26,
                        width: 100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SizedBox(height: 22),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: KfShimmer(
                            height: 28,
                            width: 100,
                            baseColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
