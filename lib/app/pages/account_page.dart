import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:lottie/lottie.dart';

part 'account_page.p.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.watch(localUserNotifierProvider);
    final userInfo = ref.watch(userInfoProvider);
    return Scaffold(
      appBar: KfAppBar(title: 'My Account', showLogo: false),
      body: userInfo.when(
        data: (result) => SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: KColors.darkRed,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(Assets.pictures.batikApb.path),
                          fit: BoxFit.contain,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // if (local.isNonIdOnIos)
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              width: 35,
                              height: 35,
                              child: PopupMenuButton(
                                splashRadius: 10,
                                color: KColors.grey,
                                icon: FaIcon(FontAwesomeIcons.ellipsis),
                                iconSize: 20,
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () => DeleteAccountRoute().push(context),
                                    child: Text(
                                      'Delete Account',
                                      style: TextStyle(color: KColors.darkRed),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 16, vertical: local.isNonIdOnIos ? 5 : 16),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50 / 2),
                                        color: Colors.black,
                                      ),
                                      child: Center(
                                        child: FaIcon(FontAwesomeIcons.solidUser),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Profile',
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                                Text(
                                                  result.data?.email != null
                                                      ? '${result.data?.email}'
                                                      : result.data?.mobile ?? '-',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'KlikFilm Point',
                                                maxLines: 1,
                                                style:
                                                    TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
                                              ),
                                              Text(
                                                '${result.data?.points.available ?? '-'}',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Active Until',
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        result.data?.points.expired ?? '-',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (result.data.hasService) SizedBox(height: 162),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (result.data.hasService)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 27,
                        vertical: local.isNonIdOnIos ? 135 : 123,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Layanan Aktif',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (result.data.hasSvod)
                            AccountServiceContentContainer(
                              index: 1,
                              title: 'Paket Nonton Seribuan Film',
                              expiry: '${result.data?.service.svod}',
                            ),
                          if (result.data.hasTvod)
                            Builder(
                              builder: (context) {
                                final tvods = result.data?.service.tvod ?? [];
                                final entries = tvods.asMap().entries;
                                return Column(
                                  children: entries.map((item) {
                                    return AccountServiceContentContainer(
                                      index: item.key,
                                      title: item.value.video.title,
                                      expiry: item.value.expiry,
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text('ERROR'),
        ),
        loading: () => Center(
          child: LottieBuilder.asset(Assets.animations.loadingRoller, width: 75, height: 75),
        ),
      ),
    );
  }
}
