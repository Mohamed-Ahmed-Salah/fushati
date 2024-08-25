/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/policy.png
  AssetGenImage get policy => const AssetGenImage('assets/img/policy.png');

  /// List of all assets
  List<AssetGenImage> get values => [policy];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/Flow 1.json
  String get flow1 => 'assets/lottie/Flow 1.json';

  /// File path: assets/lottie/loader.json
  String get loader => 'assets/lottie/loader.json';

  /// File path: assets/lottie/nfc_scan.json
  String get nfcScan => 'assets/lottie/nfc_scan.json';

  /// File path: assets/lottie/splash.json
  String get splash => 'assets/lottie/splash.json';

  /// List of all assets
  List<String> get values => [flow1, loader, nfcScan, splash];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/blocks.svg
  String get blocks => 'assets/svg/blocks.svg';

  /// File path: assets/svg/bubble.svg
  String get bubble => 'assets/svg/bubble.svg';

  /// File path: assets/svg/card_success.svg
  String get cardSuccess => 'assets/svg/card_success.svg';

  /// File path: assets/svg/card_warning.svg
  String get cardWarning => 'assets/svg/card_warning.svg';

  /// File path: assets/svg/delete.svg
  String get delete => 'assets/svg/delete.svg';

  /// File path: assets/svg/delete_card.svg
  String get deleteCard => 'assets/svg/delete_card.svg';

  /// File path: assets/svg/delete_profile.svg
  String get deleteProfile => 'assets/svg/delete_profile.svg';

  /// File path: assets/svg/electric_bolt.svg
  String get electricBolt => 'assets/svg/electric_bolt.svg';

  /// File path: assets/svg/female.svg
  String get female => 'assets/svg/female.svg';

  /// File path: assets/svg/language.svg
  String get language => 'assets/svg/language.svg';

  /// File path: assets/svg/logo.svg
  String get logo => 'assets/svg/logo.svg';

  /// File path: assets/svg/logout.svg
  String get logout => 'assets/svg/logout.svg';

  /// File path: assets/svg/male.svg
  String get male => 'assets/svg/male.svg';

  /// File path: assets/svg/okay.svg
  String get okay => 'assets/svg/okay.svg';

  /// File path: assets/svg/person.svg
  String get person => 'assets/svg/person.svg';

  /// File path: assets/svg/person_edit.svg
  String get personEdit => 'assets/svg/person_edit.svg';

  /// File path: assets/svg/sa.svg
  String get sa => 'assets/svg/sa.svg';

  /// File path: assets/svg/safe.svg
  String get safe => 'assets/svg/safe.svg';

  /// File path: assets/svg/star.svg
  String get star => 'assets/svg/star.svg';

  /// File path: assets/svg/students.svg
  String get students => 'assets/svg/students.svg';

  /// File path: assets/svg/support_agent.svg
  String get supportAgent => 'assets/svg/support_agent.svg';

  /// List of all assets
  List<String> get values => [
        blocks,
        bubble,
        cardSuccess,
        cardWarning,
        delete,
        deleteCard,
        deleteProfile,
        electricBolt,
        female,
        language,
        logo,
        logout,
        male,
        okay,
        person,
        personEdit,
        sa,
        safe,
        star,
        students,
        supportAgent
      ];
}

class Assets {
  Assets._();

  static const $AssetsImgGen img = $AssetsImgGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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
    bool gaplessPlayback = false,
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
