import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/app/app.dart';

void main() {
  testWidgets('renders the Phase 0 application baseline', (tester) async {
    await tester.pumpWidget(const MessManagerApp());

    expect(find.textContaining('Mess Manager BD'), findsOneWidget);
  });
}
