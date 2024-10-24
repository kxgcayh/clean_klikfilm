/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/fail_bouncy.json
  String get failBouncy => 'assets/animations/fail_bouncy.json';

  /// File path: assets/animations/loading_bar.json
  String get loadingBar => 'assets/animations/loading_bar.json';

  /// File path: assets/animations/loading_roller.json
  String get loadingRoller => 'assets/animations/loading_roller.json';

  /// File path: assets/animations/sad_not_found.json
  String get sadNotFound => 'assets/animations/sad_not_found.json';

  /// File path: assets/animations/success.json
  String get success => 'assets/animations/success.json';

  /// List of all assets
  List<String> get values =>
      [failBouncy, loadingBar, loadingRoller, sadNotFound, success];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/account.svg
  SvgGenImage get account => const SvgGenImage('assets/icons/account.svg');

  /// File path: assets/icons/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/icons/apple.png');

  /// File path: assets/icons/arcade.svg
  SvgGenImage get arcade => const SvgGenImage('assets/icons/arcade.svg');

  /// File path: assets/icons/download.svg
  SvgGenImage get download => const SvgGenImage('assets/icons/download.svg');

  /// File path: assets/icons/email.svg
  SvgGenImage get email => const SvgGenImage('assets/icons/email.svg');

  /// File path: assets/icons/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/google.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/kids.svg
  SvgGenImage get kids => const SvgGenImage('assets/icons/kids.svg');

  /// File path: assets/icons/logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/icons/logout.svg');

  /// File path: assets/icons/movie-ticket.svg
  SvgGenImage get movieTicket =>
      const SvgGenImage('assets/icons/movie-ticket.svg');

  /// File path: assets/icons/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/icons/phone.svg');

  /// File path: assets/icons/points.svg
  SvgGenImage get points => const SvgGenImage('assets/icons/points.svg');

  /// File path: assets/icons/rewards.svg
  SvgGenImage get rewards => const SvgGenImage('assets/icons/rewards.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/support.svg
  SvgGenImage get support => const SvgGenImage('assets/icons/support.svg');

  /// File path: assets/icons/tv.svg
  SvgGenImage get tv => const SvgGenImage('assets/icons/tv.svg');

  /// List of all assets
  List<dynamic> get values => [
        account,
        apple,
        arcade,
        download,
        email,
        google,
        home,
        kids,
        logout,
        movieTicket,
        phone,
        points,
        rewards,
        search,
        support,
        tv
      ];
}

class $AssetsPicturesGen {
  const $AssetsPicturesGen();

  /// File path: assets/pictures/batik_apb.png
  AssetGenImage get batikApb =>
      const AssetGenImage('assets/pictures/batik_apb.png');

  /// File path: assets/pictures/batik_drawer.png
  AssetGenImage get batikDrawer =>
      const AssetGenImage('assets/pictures/batik_drawer.png');

  /// File path: assets/pictures/batik_panel.png
  AssetGenImage get batikPanel =>
      const AssetGenImage('assets/pictures/batik_panel.png');

  /// File path: assets/pictures/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/pictures/logo.png');

  /// File path: assets/pictures/mini_logo.png
  AssetGenImage get miniLogo =>
      const AssetGenImage('assets/pictures/mini_logo.png');

  /// File path: assets/pictures/splash_background.png
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/pictures/splash_background.png');

  /// File path: assets/pictures/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/pictures/splash_logo.png');

  /// File path: assets/pictures/support_header.png
  AssetGenImage get supportHeader =>
      const AssetGenImage('assets/pictures/support_header.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        batikApb,
        batikDrawer,
        batikPanel,
        logo,
        miniLogo,
        splashBackground,
        splashLogo,
        supportHeader
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsPicturesGen pictures = $AssetsPicturesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
