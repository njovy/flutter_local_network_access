// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction


import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:local_network/local_network.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('checkLocalNetworkAccess test', (WidgetTester tester) async {
    final LocalNetwork plugin = LocalNetwork();
    final bool localNetworkAccessGranted = await plugin.checkLocalNetworkAccess();
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(localNetworkAccessGranted, true);
  });
}
