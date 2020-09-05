import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mechat/pages/ConversationPage.dart';
import 'package:mechat/widgets/ConversationPageSlide.dart';
import 'package:mechat/widgets/InputWidget.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: Scaffold(
      body: ConversationPageSlide(),
    ),
  );
  testWidgets("ConversationPageSlide UI test", (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byType(ConversationPage), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(InputWidget), findsOneWidget);
  });
}
