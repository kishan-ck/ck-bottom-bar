import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart' as widget;

class Stack extends widget.Stack {
  /// Create stack instance
  const Stack({
    widget.Key? key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
    List<widget.Widget> children = const <widget.Widget>[],
  }) : super(
          key: key,
          alignment: alignment,
          textDirection: textDirection,
          fit: fit,
          clipBehavior: clipBehavior,
          children: children,
        );

  @override
  RenderStack createRenderObject(widget.BuildContext context) {
    return _RenderStack(
      alignment: alignment,
      textDirection: textDirection ?? widget.Directionality.of(context),
      fit: fit,
      clipBehavior: clipBehavior,
    );
  }
}

/// Enable overflow hitTest
class _RenderStack extends RenderStack {
  _RenderStack({
    List<RenderBox>? children,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) : super(
          children: children,
          alignment: alignment,
          textDirection: textDirection,
          clipBehavior: clipBehavior,
          fit: fit,
        );

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (clipBehavior == Clip.none || size.contains(position)) {
      if (hitTestChildren(result, position: position) ||
          hitTestSelf(position)) {
        result.add(BoxHitTestEntry(this, position));
        return true;
      }
    }
    return false;
  }
}
