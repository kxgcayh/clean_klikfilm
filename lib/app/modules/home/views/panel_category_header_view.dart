import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PanelCategoryHeader extends GetWidget {
  final int index;
  final String title;
  final void Function()? onTapMore;
  final Widget? child;

  const PanelCategoryHeader({
    super.key,
    this.index = -1,
    required this.title,
    this.onTapMore,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemingController>();
    if (child == null) return SizedBox.shrink();
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
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.nunito,
                        color: HexColor(
                          index == 0
                              ? theme.data.value.general.text.tertiary
                              : theme.data.value.general.text.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 24,
                      height: 3,
                      decoration: BoxDecoration(
                        color: HexColor(
                          index == 0
                              ? theme.data.value.general.link.underline.inactive
                              : theme.data.value.general.link.underline.active,
                        ),
                        borderRadius: BorderRadius.circular(4.5),
                      ),
                    ),
                  ],
                ),
                if (onTapMore != null)
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: onTapMore,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(2),
                        child: Column(
                          children: [
                            Text(
                              'more',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.nunito,
                                color: HexColor(
                                  index == 0
                                      ? theme.data.value.general.text.tertiary
                                      : theme.data.value.general.text.primary,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: 12,
                              height: 3,
                              decoration: BoxDecoration(
                                color: HexColor(
                                  index == 0
                                      ? theme.data.value.general.link.underline.inactive
                                      : theme.data.value.general.link.underline.active,
                                ),
                                borderRadius: BorderRadius.circular(4.5),
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
          if (child != null) child!,
        ],
      ),
    );
  }
}
