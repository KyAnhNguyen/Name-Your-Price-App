
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:name_your_price/pages/home_page.dart';

void main() {
  group('Home page test', (){
    testWidgets('Change product name after each click', (WidgetTester tester) async{
      await tester.pumpWidget(const MaterialApp(home: HomePage(),));
      expect(find.text(products[0].name), findsOneWidget);
      for(var i = 1; i < 5; i++){
        await tester.tap(find.text('check'));
        await tester.pump();
        expect(find.text(products[i].name), findsOneWidget);
      }
      await tester.tap(find.text('check'));
      await tester.pump();
      expect(find.text(products[4].name), findsOneWidget);
    });
    testWidgets('Show result after each click', (WidgetTester tester) async{
      await tester.pumpWidget(const MaterialApp(home: HomePage(),));

      await tester.enterText(find.byKey(Key('priceInput')), '5');
      await tester.tap(find.text('check'));
      await tester.pump();
      expect(find.text('pass'), findsOneWidget);

      await tester.tap(find.text('next'));
      await tester.pump();

      await tester.enterText(find.byKey(Key('priceInput')), '55');
      await tester.tap(find.text('check'));
      await tester.pump();
      expect(find.text('fail'), findsOneWidget);

      await tester.enterText(find.byKey(Key('priceInput')), '5');
      await tester.tap(find.text('check'));
      await tester.pump();
      expect(find.text('pass'), findsOneWidget);
    });
});
}