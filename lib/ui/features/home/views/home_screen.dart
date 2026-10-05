import 'package:flutter/material.dart';

import '../../../../domain/models/self_care_topic.dart';
import '../../../core/navigation/destinations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/kiwi.dart';
import '../home_greeting.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.now});

  /// Injectable clock so the greeting can be tested. Defaults to the current time.
  final DateTime? now;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final greeting = homeGreeting(now ?? DateTime.now());

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        children: [
          Semantics(
            explicitChildNodes: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(greeting, style: textTheme.headlineMedium),
                ),
                const _ProfileButton(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const _KiwiIntroCard(),
          const SizedBox(height: 16),
          const _CheckInCard(),
          const SizedBox(height: 28),
          Text('Daily Self-Care', style: textTheme.titleMedium),
          const SizedBox(height: 12),
          const _SelfCareRow(),
        ],
      ),
    );
  }
}

class _ProfileButton extends StatelessWidget {
  const _ProfileButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      shape: const CircleBorder(side: BorderSide(color: AppColors.line)),
      child: InkWell(
        key: const Key('profile-button'),
        customBorder: const CircleBorder(),
        onTap: () => DestinationPage.open(
          context,
          title: 'Profile',
          message: 'Your profile will live here.',
        ),
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Icon(
            Icons.person_outline_rounded,
            color: AppColors.teal,
            semanticLabel: 'Profile',
          ),
        ),
      ),
    );
  }
}

class _KiwiIntroCard extends StatelessWidget {
  const _KiwiIntroCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 18, 16),
        child: Row(
          children: [
            const Kiwi(size: 92),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("I'm Kiwi.", style: textTheme.titleMedium),
                  const SizedBox(height: 6),
                  Text(
                    "I'm here so you don't feel alone. We'll get to know each other a little later.",
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckInCard extends StatelessWidget {
  const _CheckInCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        key: const Key('check-in-card'),
        borderRadius: BorderRadius.circular(24),
        onTap: () => DestinationPage.open(
          context,
          title: 'Check-in',
          message: 'Your daily check-in will live here.',
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.line),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How am I feeling today?',
                        style: textTheme.titleMedium,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Hard days and really good ones.',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.kiwi,
                  ),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelfCareRow extends StatelessWidget {
  const _SelfCareRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: ListView.separated(
        key: const Key('self-care-list'),
        scrollDirection: Axis.horizontal,
        itemCount: SelfCareTopic.catalog.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final topic = SelfCareTopic.catalog[index];
          return _SelfCareCard(topic: topic);
        },
      ),
    );
  }
}

class _SelfCareCard extends StatelessWidget {
  const _SelfCareCard({required this.topic});

  final SelfCareTopic topic;

  static const _wells = <Color>[
    Color(0xFFE5F6F3),
    Color(0xFFEEEAFA),
    Color(0xFFFDECEF),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final well = _wells[topic.title.hashCode.abs() % _wells.length];

    return SizedBox(
      width: 176,
      child: Material(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () {
            if (topic.locked) {
              DestinationPage.open(
                context,
                title: 'Anchor PRO',
                message: 'Premium self-care will open here.',
              );
              return;
            }
            DestinationPage.open(
              context,
              title: topic.title,
              message: 'Notes on ${topic.title} will live here.',
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.line),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: well,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            topic.icon,
                            color: const Color(0xFF1F7A72),
                            size: 22,
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (topic.locked) const _LockMark(),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    topic.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelLarge?.copyWith(
                      fontSize: 13,
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LockMark extends StatelessWidget {
  const _LockMark();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFF3F0EA),
        borderRadius: BorderRadius.all(Radius.circular(999)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lock_rounded, size: 12, color: AppColors.inkSoft),
            SizedBox(width: 4),
            Text(
              'PRO',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.inkSoft,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
