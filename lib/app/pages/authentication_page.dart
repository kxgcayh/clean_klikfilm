import 'package:fl_klikfilm/app/widgets/kf_app_bar.dart';
import 'package:fl_klikfilm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage(Assets.pictures.batikDrawer.path),
              fit: BoxFit.fitHeight,
              repeat: ImageRepeat.repeatY,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 16),
                  Assets.pictures.logo.image(
                    width: 218,
                    height: 42,
                    fit: BoxFit.fill,
                    isAntiAlias: true,
                    filterQuality: FilterQuality.high,
                  ),
                ],
              ),
              SizedBox(height: 81),
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 352,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 21),
                                child: Assets.icons.google.svg(width: 24, height: 24),
                              ),
                              Text(
                                'Sign in with Google',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 352,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 21),
                                child: Assets.icons.apple.image(width: 24, height: 24, color: Colors.white),
                              ),
                              Text(
                                'Sign in with Apple ID',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 352,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 21),
                                child: Assets.icons.email.svg(width: 24, height: 24),
                              ),
                              Text(
                                'Sign in with Email',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 352,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 21),
                                child: Assets.icons.phone.svg(width: 24, height: 24),
                              ),
                              Text(
                                'Sign in with Phone Number',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 0),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
