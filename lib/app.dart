import 'package:flutter/material.dart';

import 'ui/core/theme/app_colors.dart';
import 'ui/core/theme/app_theme.dart';
import 'ui/features/shell/views/app_shell.dart';

class RealityAnchorApp extends StatelessWidget {
  const RealityAnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reality Anchor',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      builder: (context, child) {
        return ColoredBox(
          color: AppColors.mist,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        );
      },
      home: const AppShell(),
    );
  }
}
