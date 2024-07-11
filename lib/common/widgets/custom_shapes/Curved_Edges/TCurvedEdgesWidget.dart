import 'package:flutter/material.dart';
import 'package:football_app/common/widgets/custom_shapes/Curved_Edges/TCustomeCurvedEdge.dart';

class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomeCurvedEdge(), child: child);
  }
}
