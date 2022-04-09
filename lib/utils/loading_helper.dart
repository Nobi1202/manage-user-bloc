import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoadingHelper {
  static showLoading(BuildContext context) {
    context.loaderOverlay.show(
      widget: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static hideLoading(BuildContext context) {
    context.loaderOverlay.hide();
  }
}