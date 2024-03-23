import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/theme.dart';

/// [TltBlur]
///
/// Add blur effect to any of widget using [TltBlur]
///
/// [TltBlur] is using [BackdropFilter] with [ImageFilter.blur] to achieve the effect.
///
/// Use [overlay] to show content over the blurred widget.
///
/// If you feel `blur effect` is not accurate, assign `Clip.antiAliasWithSaveLayer` to [clipBehavior].
/// This is very slow. It has no bleeding edge artifacts. Use it only when you really need it.
class TltBlur extends StatelessWidget {
  static final TltTheme _theme = TltTheme.instance;

  /// A widget that is shown behind the blurred widget.
  ///
  /// If borderRadius is used. Add same value to [borderRadius] also to render correctly.
  final Widget child;

  /// Amount of blur will be applied to the [child].
  ///
  /// Increasing the value will make the widget more blurry.
  final double blur;

  /// Color used to render the blur effect.
  ///
  /// Using transparent color will give weird result.
  final Color blurColor;

  /// Use same borderRadius that is used in [child] to render the blur shape similar to its child.
  final BorderRadius borderRadius;

  /// Opacity of the blur color.
  ///
  /// decreasing the value will reveal the [child] more.
  ///
  /// Maximum value will completely the hide the child.
  /// Use between [0.0 .... 1.0]. More than 1 will be consider as 1.
  final double colorOpacity;

  /// Widget that can be shown over the blurred content.
  final Widget? overlay;

  /// Decides the alignment of the [overlay] within the blurred content.
  final AlignmentGeometry overlayAlignment;

  /// Used to clip the edges of the blurred content.
  /// Without clip, blur effect will affect the other widgets that is placed closely.
  ///
  ///  * [Clip.none] - No clipping.
  ///  * [Clip.hardEdge] - The fastest clipping, but with lower fidelity. Used as default.
  ///  * [Clip.antiAlias] - which is a little slower than [Clip.hardEdge], but with smoothed edges.
  ///  * [Clip.antiAliasWithSaveLayer] - which is much slower than [antiAlias], If you feel the edges
  /// are not rendered properly, use this. Otherwise don't compromise the performance.
  final Clip clipBehavior;

  /// [TltBlur]
  ///
  /// Add blur effect to any of widget using [TltBlur]
  ///
  /// [TltBlur] is using [BackdropFilter] with [ImageFilter.blur] to achieve the effect.
  ///
  /// Use [overlay] to show content over the blurred widget.
  ///
  /// If you feel `blur effect` is not accurate, assign `Clip.antiAliasWithSaveLayer` to [clipBehavior].
  /// This is very slow. It has no bleeding edge artifacts. Use it only when you really need it.
  TltBlur({
    Key? key,
    required this.child,
    double? blur,
    Color? blurColor,
    BorderRadius? borderRadius,
    double? colorOpacity,
    this.overlay,
    AlignmentGeometry? overlayAlignment,
    Clip? clipBehavior,
  })  : blur = blur ?? _theme.blurAmount,
        blurColor = blurColor ?? _theme.blurColor,
        borderRadius = borderRadius ?? _theme.blurBorderRadius,
        colorOpacity = colorOpacity ?? _theme.blurColorOpacity,
        overlayAlignment = overlayAlignment ?? _theme.blurOverlayAlignment,
        clipBehavior = clipBehavior ?? _theme.blurClipBehavior,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                decoration: BoxDecoration(
                  color: blurColor
                      .withOpacity(colorOpacity > 1 ? 1 : colorOpacity),
                ),
                alignment: overlayAlignment,
                child: overlay,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension TltBlurExtension on Widget {
  /// [TltBlur]
  ///
  /// Add blur effect to any of widget using [TltBlur]
  ///
  /// [TltBlur] is using [BackdropFilter] with [ImageFilter.blur] to achieve the effect.
  ///
  /// Use [overlay] to show content over the blurred widget.
  ///
  /// If you feel `blur effect` is not accurate, assign `Clip.antiAliasWithSaveLayer` to [clipBehavior].
  /// This is very slow. It has no bleeding edge artifacts. Use it only when you really need it.
  TltBlur tltBlur({
    double? blur,
    Color? blurColor,
    BorderRadius? borderRadius,
    double? colorOpacity,
    Widget? overlay,
    AlignmentGeometry? overlayAlignment,
    Clip? clipBehavior,
  }) {
    return TltBlur(
      blur: blur,
      blurColor: blurColor,
      borderRadius: borderRadius,
      colorOpacity: colorOpacity,
      overlay: overlay,
      overlayAlignment: overlayAlignment,
      clipBehavior: clipBehavior,
      child: this,
    );
  }
}
