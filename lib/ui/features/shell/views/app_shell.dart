import 'package:flutter/material.dart';

import '../../../core/navigation/destinations.dart';
import '../../../core/widgets/reality_bottom_bar.dart';
import '../../home/views/home_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  static const _tabs = <({String title, String message})>[
    (title: 'Home', message: ''),
    (
      title: 'Journal',
      message: 'Your days and help sessions will be kept here.',
    ),
    (title: 'Help', message: 'This is where a help session will start.'),
    (title: 'Grounding', message: 'Grounding exercises will live here.'),
    (title: 'Stats', message: 'Your progress and calendar will be shown here.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          const HomeScreen(),
          for (final tab in _tabs.skip(1))
            DestinationBody(title: tab.title, message: tab.message),
        ],
      ),
      bottomNavigationBar: RealityBottomBar(
        currentIndex: _index,
        onSelected: (index) => setState(() => _index = index),
      ),
    );
  }
}
