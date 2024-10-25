import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/views/views/app_button_type.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AppButton extends GetView {
  final String text;
  final double? width;
  final double? height;
  final void Function()? onTap;
  final Widget? prefix;
  final double? fontSize;
  final String? fontFamily;
  final MainAxisAlignment? mainAxisAlignment;
  final AppButtonType buttonType;
  final EdgeInsets? contentPadding;
  final bool enabled;
  final Color? color;

  const AppButton({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.onTap,
    this.prefix,
    this.fontSize,
    this.fontFamily,
    this.mainAxisAlignment,
    this.buttonType = AppButtonType.regular,
    this.contentPadding,
    this.enabled = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // final lastTimeClicked = useState<int>(0);
    // final AppThemeResponse theme = ref.watch(themeAppSourceProvider).requireValue;
    final theme = Get.find<ThemingController>();

    return Material(
      borderRadius: BorderRadius.circular(26),
      color: enabled
          ? buttonType.isRegular
              ? HexColor(theme.data.value.buttons.login.background.color)
              : buttonType.isDetail
                  ? HexColor(theme.data.value.buttons.detail.background.color)
                  : Colors.transparent
          : Colors.grey,
      child: InkWell(
        onTap: onTap != null
            ? () {
                // final now = DateTime.now().millisecondsSinceEpoch;
                // if (now - lastTimeClicked.value < 1000) return;
                // lastTimeClicked.value = now;
                onTap!();
              }
            : null,
        borderRadius: BorderRadius.circular(26),
        splashColor: HexColor(theme.data.value.buttons.login.text).withOpacity(0.15),
        child: Container(
          width: width,
          height: height,
          padding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: buttonType.isDetail ? 7 : 12,
                horizontal: buttonType.isDetail ? 8 : 14,
              ),
          decoration: BoxDecoration(
            border: buttonType.isDetail && theme.data.value.buttons.detail.outline.isNotEmpty
                ? Border.all(color: HexColor(theme.data.value.buttons.detail.outline))
                : null,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment != null
                ? mainAxisAlignment!
                : prefix != null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
            children: [
              if (prefix != null)
                Padding(
                  padding: EdgeInsets.only(right: buttonType.isDetail ? 2 : 8),
                  child: prefix,
                ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: buttonType.isRegular ? FontWeight.w500 : FontWeight.w700,
                  fontSize: fontSize ?? 18,
                  fontFamily: fontFamily ?? FontFamily.nunito,
                  color: color ??
                      HexColor(
                        buttonType.isRegular
                            ? theme.data.value.buttons.login.text
                            : buttonType.isDetail
                                ? theme.data.value.buttons.detail.text
                                : theme.data.value.login.email.link,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
