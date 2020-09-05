import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mechat/pages/ConversationPage.dart';
import 'package:mechat/widgets/ChatAppBar.dart';
import 'package:mechat/widgets/ChatListWidget.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: Scaffold(
      body: ConversationPage(),
    ),
  );
  testWidgets('ConversationPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);
    expect(find.byType(ChatAppBar), findsOneWidget);
    expect(find.byType(ChatListWidget), findsOneWidget);
  });
}
