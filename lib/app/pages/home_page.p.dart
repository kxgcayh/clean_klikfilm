part of 'home_page.dart';

class PanelCategoryHeader extends StatelessWidget {
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
    if (child == null) return SizedBox.shrink();
    return Container(
      decoration: index == 0
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.pictures.batikPanel.path),
                alignment: Alignment.topCenter,
                repeat: ImageRepeat.repeatX,
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB00101),
                  Color(0xFF850101),
                  Color(0xFF5A0101),
                  Color(0xFF2B0000),
                  Colors.black,
                  Colors.black.withOpacity(0.5),
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
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 24,
                      height: 3,
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.white : KColors.red,
                        borderRadius: BorderRadius.circular(4.5),
                      ),
                    ),
                  ],
                ),
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
                            'More',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.nunito,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            width: 12,
                            height: 3,
                            decoration: BoxDecoration(
                              color: index == 0 ? Colors.white : KColors.red,
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
        shrinkWrap: true,
        itemCount: contents.isNotEmpty ? contents.length : 6,
        scrollDirection: Axis.horizontal,
        itemExtent: parentIndex == 0 ? 170 : 140,
        padding: EdgeInsets.only(left: 12, right: 4),
        itemBuilder: (context, index) {
          if (contents.isNotEmpty) {
            final VideoContentModel item = contents[index];
            return Padding(
              padding: EdgeInsets.only(right: 8),
              child: KFImage(
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
            child: KfShimmer(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
