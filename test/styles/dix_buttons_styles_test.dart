import 'package:dix/dix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ThemeData testTheme;

  testWidgets('ElevatedButton con estilo primario', (widgetTester) async {
    await widgetTester.pumpWidget(
      Builder(
        builder: (context) {
          testTheme = ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurpleAccent,
              brightness: Brightness.dark,
            ),
          );
          return DixMaterialApp(
            theme: testTheme,
            home: Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: DixButtonStyles.instance.elevatedButton(
                    DixButtonType.primary,
                  ),
                  child: Text('Primary Button'),
                ),
              ),
            ),
          );
        },
      ),
    );

    final buttonWidget = widgetTester.widget<ElevatedButton>(
      find.byType(ElevatedButton),
    );
    final buttonStyle = buttonWidget.style!;

    final expectedColorScheme = testTheme.colorScheme;

    expect(
      buttonStyle.backgroundColor!.resolve({}),
      equals(expectedColorScheme.primaryContainer),
    );
    expect(
      buttonStyle.foregroundColor!.resolve({}),
      equals(expectedColorScheme.onPrimaryContainer),
    );
  });
}
