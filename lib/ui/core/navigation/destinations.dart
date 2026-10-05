import 'package:flutter/material.dart';

import '../widgets/kiwi.dart';
import '../theme/app_colors.dart';

/// A quiet page that only marks where a feature will live.
class DestinationPage extends StatelessWidget {
  const DestinationPage({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  static void open(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => DestinationPage(title: title, message: message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: DestinationBody(title: title, message: message, showTitle: false),
    );
  }
}

class DestinationBody extends StatelessWidget {
  const DestinationBody({
    super.key,
    required this.title,
    required this.message,
    this.showTitle = true,
  });

  final String title;
  final String message;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: Kiwi(size: 112)),
            const SizedBox(height: 28),
            if (showTitle) ...[
              Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
            ],
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(color: AppColors.inkSoft),
            ),
          ],
        ),
      ),
    );
  }
}
