import 'package:fl_klikfilm/app/providers/categories/categories_provider.dart';
import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerPage extends HookConsumerWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localUserProvider = ref.watch(commonUserDataProvider);
    final auth = ref.watch(userAuthDataNotifier);
    final supportExpanded = useState(false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: KfAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage(Assets.pictures.batikDrawer.path),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 20,
                        contentPadding: EdgeInsets.symmetric(horizontal: 23),
                        leading: Assets.icons.home.svg(),
                        title: Text(
                          'HOME',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: FontFamily.poppins,
                          ),
                        ),
                        onTap: () => context.goNamed(HomeRoute.name),
                      ),
                      Visibility(
                        visible: !auth.authenticationType.isGuest,
                        child: ListTile(
                          horizontalTitleGap: 20,
                          contentPadding: EdgeInsets.symmetric(horizontal: 23),
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Icon(Icons.account_circle_rounded, color: Colors.white),
                          ),
                          title: Text(
                            'MY ACCOUNT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: FontFamily.poppins,
                            ),
                          ),
                          onTap: () => context.pushReplacementNamed(AccountRoute.name),
                        ),
                      ),
                      Visibility(
                        visible: !auth.authenticationType.isGuest,
                        child: ListTile(
                          horizontalTitleGap: 20,
                          contentPadding: EdgeInsets.symmetric(horizontal: 23),
                          leading: Assets.icons.points.svg(),
                          title: Text(
                            'POINTS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: FontFamily.poppins,
                            ),
                          ),
                          onTap: () => context.pushReplacementNamed(PointRoute.name),
                        ),
                      ),
                      Visibility(
                        visible: !auth.authenticationType.isGuest,
                        child: ListTile(
                          horizontalTitleGap: 20,
                          contentPadding: EdgeInsets.symmetric(horizontal: 23),
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Icon(
                              Icons.videogame_asset,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            'KLIKFILM ARCADE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: FontFamily.poppins,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      ListTile(
                        horizontalTitleGap: 20,
                        contentPadding: EdgeInsets.symmetric(horizontal: 23),
                        leading: Assets.icons.rewards.svg(),
                        title: Text(
                          'REWARDS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: FontFamily.poppins,
                          ),
                        ),
                        onTap: () async {
                          await launchUrl(
                            Uri.parse('https://klikfilm.com/v3/desktop/static_page/iphone'),
                          );
                        },
                      ),
                      Visibility(
                        visible: !auth.authenticationType.isGuest,
                        child: ListTile(
                          horizontalTitleGap: 20,
                          contentPadding: EdgeInsets.symmetric(horizontal: 23),
                          leading: Assets.icons.tv.svg(width: 24, height: 24),
                          title: Text(
                            'LINK TO TV',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: FontFamily.poppins,
                            ),
                          ),
                          onTap: () => context.pushReplacementNamed(LinkToTvRoute.name),
                        ),
                      ),
                      Visibility(
                        visible: !auth.authenticationType.isGuest,
                        child: ListTile(
                          horizontalTitleGap: 20,
                          contentPadding: EdgeInsets.symmetric(horizontal: 23),
                          leading: Assets.icons.kids.svg(),
                          title: Text(
                            'KIDS MODE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: FontFamily.poppins,
                            ),
                          ),
                          onTap: () => context.pushReplacementNamed(KidsModeRoute.name),
                          trailing: Stack(
                            alignment: localUserProvider.kidsMode.isNotEmpty
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            children: [
                              Container(
                                width: 45,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(
                                    localUserProvider.kidsMode.isNotEmpty ? 0.8 : 0.2,
                                  ),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                              ),
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color:
                                      localUserProvider.kidsMode.isNotEmpty ? KColors.primary : Colors.white,
                                  borderRadius: BorderRadius.circular(28 / 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          ListTile(
                            horizontalTitleGap: 20,
                            contentPadding: EdgeInsets.symmetric(horizontal: 23),
                            leading: Assets.icons.support.svg(),
                            title: Text(
                              'SUPPORTS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: FontFamily.poppins,
                              ),
                            ),
                            trailing: Icon(
                              supportExpanded.value
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              supportExpanded.value = !supportExpanded.value;
                            },
                          ),
                          AnimatedOpacity(
                            opacity: supportExpanded.value ? 1.0 : 0,
                            duration: Duration(milliseconds: 250),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 67),
                                  title: Text(
                                    'CONTACT US',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: FontFamily.poppins,
                                    ),
                                  ),
                                  onTap: () {
                                    SupportRoute(type: GeneralInformationType.contact).push(context);
                                  },
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 67),
                                  title: Text(
                                    'TERMS OF USE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: FontFamily.poppins,
                                    ),
                                  ),
                                  onTap: () {
                                    SupportRoute(type: GeneralInformationType.tou).push(context);
                                  },
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 67),
                                  title: Text(
                                    'FAQ',
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                  onTap: () {
                                    SupportRoute(type: GeneralInformationType.faq).push(context);
                                  },
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 67),
                                  title: Text(
                                    'PRIVACY POLICY',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: FontFamily.poppins,
                                    ),
                                  ),
                                  onTap: () {
                                    SupportRoute(type: GeneralInformationType.privacyPolicy).push(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                horizontalTitleGap: 20,
                contentPadding: EdgeInsets.symmetric(horizontal: 23),
                leading: Assets.icons.logout.svg(),
                title: Text(
                  auth.authenticationType.isGuest ? 'LOGIN' : 'LOGOUT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: FontFamily.poppins,
                  ),
                ),
                onTap: () async {
                  if (auth.authenticationType.isGuest) {
                    AuthenticationRoute().pushReplacement(context);
                  } else {
                    await ref.read(userAuthDataNotifier.notifier).setLogout().then((_) async {
                      await ref.read(categoriesAsyncNotifier.notifier).forceRefresh().then((_) {
                        return HomeRoute().go(context);
                      });
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
