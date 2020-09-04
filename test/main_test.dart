import 'package:flutter_test/flutter_test.dart';

import 'package:mechat/main.dart';
import 'package:mechat/pages/ConversationPageList.dart';

void main() {
  testWidgets('Main UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MeChat());
    expect(find.byType(ConversationPageList), findsOneWidget);
  });
}
