import 'package:flutter/material.dart';
import 'package:warunk/core/helper/global_helper.dart';

class LoadingAppWidget extends StatelessWidget {
  final double? size;

  const LoadingAppWidget({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: GlobalHelper.getColorSchema(
          context,
        ).surface.withValues(alpha: 0.8),
        child: Center(
          child: Container(
            width: size ?? 200,
            height: size ?? 200,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
