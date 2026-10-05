import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reality_anchor/app.dart';
import 'package:reality_anchor/ui/features/home/home_greeting.dart';

void main() {
  test('greeting follows the time of day', () {
    expect(homeGreeting(DateTime(2026, 10, 5, 8)), 'Good morning');
    expect(homeGreeting(DateTime(2026, 10, 5, 14)), 'Good afternoon');
    expect(homeGreeting(DateTime(2026, 10, 5, 20)), 'Good evening');
  });

  testWidgets('home destinations and bottom navigation open their pages', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(430, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const RealityAnchorApp());

    expect(find.text('How am I feeling today?'), findsOneWidget);
    expect(find.text("I'm Kiwi."), findsOneWidget);
    expect(find.text('Daily Self-Care'), findsOneWidget);
    expect(find.text('Understanding Derealization'), findsOneWidget);

    await tester.tap(find.byKey(const Key('profile-button')));
    await tester.pumpAndSettle();
    expect(find.text('Your profile will live here.'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('check-in-card')));
    await tester.pumpAndSettle();
    expect(find.text('Your daily check-in will live here.'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Understanding Derealization'));
    await tester.pumpAndSettle();
    expect(
      find.text('Notes on Understanding Derealization will live here.'),
      findsOneWidget,
    );
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('Sleep'),
      200,
      scrollable: find.descendant(
        of: find.byKey(const Key('self-care-list')),
        matching: find.byType(Scrollable),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sleep'));
    await tester.pumpAndSettle();
    expect(find.text('Premium self-care will open here.'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Journal'));
    await tester.pumpAndSettle();
    expect(
      find.text('Your days and help sessions will be kept here.'),
      findsOneWidget,
    );

    await tester.tap(find.bySemanticsLabel('Help'));
    await tester.pumpAndSettle();
    expect(
      find.text('This is where a help session will start.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Grounding'));
    await tester.pumpAndSettle();
    expect(find.text('Grounding exercises will live here.'), findsOneWidget);

    await tester.tap(find.text('Stats'));
    await tester.pumpAndSettle();
    expect(
      find.text('Your progress and calendar will be shown here.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('How am I feeling today?'), findsOneWidget);
  });
}
