import 'package:dytehouse/main.dart';
import 'package:flutter/material.dart';

class Utils {
  Future<void> leave(BuildContext context, {bool release = false}) async {
    if (release) {
      final scaffold = ScaffoldMessenger.of(context);
      final result = await mobileClient.release();
      if (result) {
        await _cleanAndPopUiKit();
      } else {
        scaffold.showSnackBar(
          const SnackBar(
            content: Text("Failed to get release"),
          ),
        );
      }
    } else {
      await _cleanAndPopUiKit();
    }
  }

  Future<void> _cleanAndPopUiKit() async {
    await mobileClient.cleanAllNativeListeners();
  }
}
