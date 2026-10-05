import 'package:flutter/material.dart';

/// A Daily Self-Care category shown on Home.
///
/// Open topics lead to their own placeholder. Locked topics share the
/// Anchor PRO placeholder. Nothing behind these cards is built yet.
class SelfCareTopic {
  const SelfCareTopic({
    required this.title,
    required this.icon,
    required this.locked,
  });

  final String title;
  final IconData icon;
  final bool locked;

  static const catalog = <SelfCareTopic>[
    SelfCareTopic(
      title: 'Understanding Derealization',
      icon: Icons.blur_on_rounded,
      locked: false,
    ),
    SelfCareTopic(
      title: 'Understanding Depersonalization',
      icon: Icons.person_outline_rounded,
      locked: false,
    ),
    SelfCareTopic(
      title: 'Exercise',
      icon: Icons.directions_walk_rounded,
      locked: false,
    ),
    SelfCareTopic(title: 'Diet', icon: Icons.restaurant_rounded, locked: false),
    SelfCareTopic(
      title: 'Hormonal Health',
      icon: Icons.water_drop_outlined,
      locked: true,
    ),
    SelfCareTopic(
      title: 'Romantic Relationships',
      icon: Icons.favorite_outline_rounded,
      locked: true,
    ),
    SelfCareTopic(
      title: 'Friendships',
      icon: Icons.groups_outlined,
      locked: true,
    ),
    SelfCareTopic(title: 'Family', icon: Icons.home_outlined, locked: true),
    SelfCareTopic(title: 'Self-Care', icon: Icons.spa_outlined, locked: true),
    SelfCareTopic(title: 'Breathing', icon: Icons.air_rounded, locked: true),
    SelfCareTopic(
      title: 'Taking Care of My Appearance',
      icon: Icons.face_retouching_natural_outlined,
      locked: true,
    ),
    SelfCareTopic(
      title: 'Internet / Social Media',
      icon: Icons.phone_iphone_rounded,
      locked: true,
    ),
    SelfCareTopic(title: 'Sleep', icon: Icons.bedtime_outlined, locked: true),
    SelfCareTopic(
      title: 'My Own Image',
      icon: Icons.portrait_outlined,
      locked: true,
    ),
    SelfCareTopic(
      title: 'Meditations',
      icon: Icons.self_improvement_rounded,
      locked: true,
    ),
    SelfCareTopic(
      title: 'My Dreams',
      icon: Icons.nightlight_outlined,
      locked: true,
    ),
    SelfCareTopic(
      title: 'My Projects',
      icon: Icons.lightbulb_outline_rounded,
      locked: true,
    ),
    SelfCareTopic(
      title: 'What Scares Me',
      icon: Icons.shield_outlined,
      locked: true,
    ),
    SelfCareTopic(
      title: 'Challenges I Want to Face',
      icon: Icons.flag_outlined,
      locked: true,
    ),
  ];
}
