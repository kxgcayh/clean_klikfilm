import 'package:fl_klikfilm/app/data/app_shimmer.dart';
import 'package:fl_klikfilm/app/views/views/app_image.dart';
import 'package:flutter/material.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class PanelCategoryContents extends StatelessWidget {
  final int parentIndex;
  final List<VideoContentModel> contents;
  final void Function(VideoContentModel content)? onTap;

  const PanelCategoryContents({
    super.key,
    this.parentIndex = -1,
    this.contents = const <VideoContentModel>[],
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: parentIndex == 0 ? 230 : 200,
      child: ListView.builder(
        shrinkWrap: false,
        itemCount: contents.isNotEmpty ? contents.length : 6,
        scrollDirection: Axis.horizontal,
        itemExtent: parentIndex == 0 ? 170 : 140,
        padding: EdgeInsets.only(left: 12, right: 4),
        itemBuilder: (context, index) {
          if (contents.isNotEmpty) {
            final VideoContentModel item = contents[index];
            return Padding(
              padding: EdgeInsets.only(right: 8),
              child: AppImage(
                '${item.thumbnail?.the150x214}',
                height: parentIndex == 0 ? 230 : 200,
                width: parentIndex == 0 ? 170 : 140,
                borderRadius: BorderRadius.circular(10),
                onTap: onTap != null ? () => onTap!(item) : null,
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: AppShimmer(borderRadius: BorderRadius.circular(10)),
          );
        },
      ),
    );
  }
}
