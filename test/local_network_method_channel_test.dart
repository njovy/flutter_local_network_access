import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_network/local_network_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelLocalNetwork platform = MethodChannelLocalNetwork();
  const MethodChannel channel = MethodChannel('com.njovy.libs/local_network');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return true;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.checkLocalNetworkAccess(), true);
  });
}
