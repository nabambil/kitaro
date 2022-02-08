/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsGifsGen {
  const $AssetsGifsGen();

  /// File path: assets/gifs/green.apng
  String get greenApng => 'assets/gifs/green.apng';

  /// File path: assets/gifs/green.png
  AssetGenImage get greenPng => const AssetGenImage('assets/gifs/green.png');

  /// File path: assets/gifs/location.png
  AssetGenImage get location => const AssetGenImage('assets/gifs/location.png');

  /// File path: assets/gifs/marker.png
  AssetGenImage get marker => const AssetGenImage('assets/gifs/marker.png');

  /// File path: assets/gifs/recycle.png
  AssetGenImage get recycle => const AssetGenImage('assets/gifs/recycle.png');

  /// File path: assets/gifs/scan_qr.png
  AssetGenImage get scanQr => const AssetGenImage('assets/gifs/scan_qr.png');
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/balloon.png
  AssetGenImage get balloon => const AssetGenImage('assets/icons/balloon.png');

  /// File path: assets/icons/can.png
  AssetGenImage get can => const AssetGenImage('assets/icons/can.png');

  /// File path: assets/icons/favourite.png
  AssetGenImage get favourite =>
      const AssetGenImage('assets/icons/favourite.png');

  /// File path: assets/icons/leave.png
  AssetGenImage get leave => const AssetGenImage('assets/icons/leave.png');

  /// File path: assets/icons/paper.png
  AssetGenImage get paper => const AssetGenImage('assets/icons/paper.png');

  /// File path: assets/icons/plastic_bottle.png
  AssetGenImage get plasticBottle =>
      const AssetGenImage('assets/icons/plastic_bottle.png');

  /// File path: assets/icons/temporary.png
  AssetGenImage get temporary =>
      const AssetGenImage('assets/icons/temporary.png');

  /// File path: assets/icons/warning.png
  AssetGenImage get warning => const AssetGenImage('assets/icons/warning.png');

  /// File path: assets/icons/whatsapp.png
  AssetGenImage get whatsapp =>
      const AssetGenImage('assets/icons/whatsapp.png');
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/logos/facebook.png');

  /// File path: assets/logos/google.png
  AssetGenImage get google => const AssetGenImage('assets/logos/google.png');

  /// File path: assets/logos/kitaro_logo.png
  AssetGenImage get kitaroLogo =>
      const AssetGenImage('assets/logos/kitaro_logo.png');

  /// File path: assets/logos/kitaro_logo_main.png
  AssetGenImage get kitaroLogoMain =>
      const AssetGenImage('assets/logos/kitaro_logo_main.png');

  /// File path: assets/logos/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/logos/logo.png');
}

class Assets {
  Assets._();

  static const $AssetsGifsGen gifs = $AssetsGifsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
