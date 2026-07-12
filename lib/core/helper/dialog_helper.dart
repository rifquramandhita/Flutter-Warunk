import 'package:flutter/material.dart';
import 'package:warunk/core/helper/global_helper.dart';

class DialogHelper {
  static showSnackBar({
    required BuildContext context,
    required String text,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        backgroundColor: color,
        duration: const Duration(seconds: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  static showErrorSnackBar({
    required BuildContext context,
    required String text,
  }) {
    showSnackBar(context: context, text: text, color: Colors.redAccent);
  }

  static showWarningSnackBar({
    required BuildContext context,
    required String text,
  }) {
    showSnackBar(context: context, text: text, color: Colors.orange);
  }

  static showBottomSheetDialog({
    required BuildContext context,
    required String title,
    bool canDismiss = true,
    required Widget content,
  }) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      isDismissible: canDismiss,
      enableDrag: canDismiss,
      builder: (context) => PopScope(
        canPop: canDismiss,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GlobalHelper.getTextTheme(
                          context,
                          appTextStyle: AppTextStyle.TITLE_MEDIUM,
                        )?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    (canDismiss)
                        ? IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.clear),
                          )
                        : SizedBox(),
                  ],
                ),
                SizedBox(height: 20),
                content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
