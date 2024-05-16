import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class KfAppBar extends HookWidget implements PreferredSizeWidget {
  final double? elevation;
  final bool showLogo;
  final String? title;
  const KfAppBar({
    super.key,
    this.elevation,
    this.showLogo = true,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final String? path = useMemoized(() => GoRouterState.of(context).name);

    return AppBar(
      backgroundColor: Colors.black,
      elevation: elevation,
      surfaceTintColor: KColors.grey,
      title: (showLogo || title == null)
          ? Assets.pictures.logo.image(width: 134, height: 26)
          : Text(
              '$title',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
      centerTitle: true,
      flexibleSpace: Assets.pictures.batikApb.image(fit: BoxFit.fitWidth),
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            if (path != HomeRoute.name) {
              GoRouter.of(context).pop();
            } else {
              MenuRoute().push(context);
            }
          },
          icon: Builder(builder: (context) {
            return Icon(
              path != HomeRoute.name ? Icons.arrow_back_ios_new_rounded : Icons.menu_rounded,
              color: Colors.white,
              size: 24,
            );
          }),
        );
      }),
      actions: [
        if (path == HomeRoute.name)
          IconButton(
            onPressed: () => SearchRoute().push(context),
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.05);
}
