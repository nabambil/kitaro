/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsGifsGen {
  const $AssetsGifsGen();

  String get greenApng => 'assets/gifs/green.apng';
  AssetGenImage get greenPng => const AssetGenImage('assets/gifs/green.png');
  AssetGenImage get marker => const AssetGenImage('assets/gifs/marker.png');
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  AssetGenImage get balloon => const AssetGenImage('assets/icons/balloon.png');
  AssetGenImage get can => const AssetGenImage('assets/icons/can.png');
  AssetGenImage get favourite =>
      const AssetGenImage('assets/icons/favourite.png');
  AssetGenImage get leave => const AssetGenImage('assets/icons/leave.png');
  AssetGenImage get paper => const AssetGenImage('assets/icons/paper.png');
  AssetGenImage get plasticBottle =>
      const AssetGenImage('assets/icons/plastic_bottle.png');
  AssetGenImage get temporary =>
      const AssetGenImage('assets/icons/temporary.png');
  AssetGenImage get warning => const AssetGenImage('assets/icons/warning.png');
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

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
