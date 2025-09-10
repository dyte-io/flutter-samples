import 'package:realtimekit_demo/constants/colors.dart';
import 'package:realtimekit_demo/di/di.dart';
import 'package:realtimekit_demo/logger.dart';
import 'package:realtimekit_demo/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependecies();
  runApp(ProviderScope(
    observers: [Logger()],
    child: const RealtimeKitSampleApp(),
  ));
}

class RealtimeKitSampleApp extends StatelessWidget {
  const RealtimeKitSampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.dark();
    return MaterialApp(
      theme: theme.copyWith(
        scaffoldBackgroundColor: RealtimeKitColors.background,
        primaryColor: RealtimeKitColors.primary,
        colorScheme: theme.colorScheme
            .copyWith(
              secondary: RealtimeKitColors.primary,
            )
            .copyWith(surface: RealtimeKitColors.background),
      ),
      home: const HomePage(),
    );
  }
}
