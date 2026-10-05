import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RealityBottomBar extends StatelessWidget {
  const RealityBottomBar({
    super.key,
    required this.currentIndex,
    required this.onSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return SizedBox(
      height: 92 + bottomInset,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.card,
              border: Border(top: BorderSide(color: AppColors.line)),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomInset),
              child: SizedBox(
                height: 64,
                child: Row(
                  children: [
                    _NavItem(
                      label: 'Home',
                      icon: Icons.home_rounded,
                      selected: currentIndex == 0,
                      onTap: () => onSelected(0),
                    ),
                    _NavItem(
                      label: 'Journal',
                      icon: Icons.menu_book_rounded,
                      selected: currentIndex == 1,
                      onTap: () => onSelected(1),
                    ),
                    const SizedBox(width: 76),
                    _NavItem(
                      label: 'Grounding',
                      icon: Icons.spa_rounded,
                      selected: currentIndex == 3,
                      onTap: () => onSelected(3),
                    ),
                    _NavItem(
                      label: 'Stats',
                      icon: Icons.bar_chart_rounded,
                      selected: currentIndex == 4,
                      onTap: () => onSelected(4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: _HelpButton(
              selected: currentIndex == 2,
              onTap: () => onSelected(2),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.teal : AppColors.inkSoft;

    return Expanded(
      child: Semantics(
        button: true,
        selected: selected ? true : null,
        label: label,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(height: 4),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HelpButton extends StatelessWidget {
  const _HelpButton({required this.selected, required this.onTap});

  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Help',
      selected: selected ? true : null,
      child: Material(
        color: AppColors.help,
        shape: const CircleBorder(),
        elevation: 6,
        shadowColor: const Color(0x66E24B4B),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Ink(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.help,
              border: Border.all(
                color: selected ? Colors.white : const Color(0x33FFFFFF),
                width: 3,
              ),
            ),
            child: const Icon(Icons.anchor, color: Colors.white, size: 28),
          ),
        ),
      ),
    );
  }
}
