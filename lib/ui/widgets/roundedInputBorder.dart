import 'package:flutter/material.dart';

class RoundedInputBorder extends InputBorder {
  /// Creates an rounded border for an [InputDecorator].
  ///
  /// The [borderSide] parameter defaults to [BorderSide.none] (it must not be
  /// null). Applications typically do not specify a [borderSide] parameter
  /// because the input decorator substitutes its own, using [copyWith], based
  /// on the current theme and [InputDecorator.isFocused].
  ///
  /// The [borderRadius] parameter defaults to a value where the all corners
  /// have a circular radius of 4.0. The [borderRadius] parameter must not be null.
  const RoundedInputBorder({
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
  })  : assert(borderRadius != null),
        super(borderSide: BorderSide.none);

  /// The radii of the border's rounded rectangle corners.
  ///
  /// When this border is used with a filled input decorator, see
  /// [InputDecoration.filled], the border radius defines the shape
  /// of the background fill.
  ///
  /// By default all corners have a circular radius of 4.0.
  final BorderRadius borderRadius;

  @override
  bool get isOutline => false;

  @override
  RoundedInputBorder copyWith(
      {BorderSide borderSide, BorderRadius borderRadius}) {
    return RoundedInputBorder(
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  RoundedInputBorder scale(double t) =>
      RoundedInputBorder(borderRadius: borderRadius);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()..addRect(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    if (a is RoundedInputBorder) {
      return RoundedInputBorder(
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    if (b is RoundedInputBorder) {
      return RoundedInputBorder(
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection textDirection,
  }) {
    // Do not paint.
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoundedInputBorder &&
          runtimeType == other.runtimeType &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => borderRadius.hashCode;
}
