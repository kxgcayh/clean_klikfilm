import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/data/app_colors.dart';
import 'package:fl_klikfilm/app/data/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeCategoriesLoadingView extends GetView {
  const HomeCategoriesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemingController>();
    return GetBuilder<ThemingController>(builder: (context) {
      return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            decoration: index == 0
                ? BoxDecoration(
                    image: theme.data.value.pattern.drawer.isNotEmpty
                        ? DecorationImage(
                            image: CachedNetworkImageProvider(theme.data.value.pattern.bottom),
                            alignment: Alignment.centerLeft,
                            fit: context.isTablet ? BoxFit.fitHeight : BoxFit.fill,
                            repeat: context.isTablet ? ImageRepeat.repeatX : ImageRepeat.noRepeat,
                          )
                        : null,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        HexColor(theme.data.value.drawer.background.color.begin),
                        HexColor(theme.data.value.drawer.background.color.end),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  )
                : null,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: index == 0 ? 12 : 24,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppShimmer(
                            width: 166,
                            height: 27,
                            baseColor: AppColors.primaryGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4.5),
                          ),
                          SizedBox(height: 4),
                          AppShimmer(
                            width: 24,
                            height: 3,
                            baseColor: AppColors.primaryGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4.5),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AppShimmer(
                            width: 32,
                            height: 16,
                            baseColor: AppColors.primaryGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4.5),
                          ),
                          SizedBox(height: 4),
                          AppShimmer(
                            width: 12,
                            height: 3,
                            baseColor: AppColors.primaryGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: index == 0 ? 230 : 200,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemExtent: index == 0 ? 170 : 140,
                    padding: EdgeInsets.only(left: 12, right: 4),
                    itemBuilder: (context, index) {
                      return LayoutBuilder(builder: (context, constraints) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: AppShimmer(borderRadius: BorderRadius.circular(10)),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
