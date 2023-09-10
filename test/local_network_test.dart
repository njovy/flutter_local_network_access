import 'package:flutter_test/flutter_test.dart';
import 'package:local_network/local_network.dart';
import 'package:local_network/local_network_platform_interface.dart';
import 'package:local_network/local_network_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLocalNetworkPlatform
    with MockPlatformInterfaceMixin
    implements LocalNetworkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LocalNetworkPlatform initialPlatform = LocalNetworkPlatform.instance;

  test('$MethodChannelLocalNetwork is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLocalNetwork>());
  });

  test('getPlatformVersion', () async {
    LocalNetwork localNetworkPlugin = LocalNetwork();
    MockLocalNetworkPlatform fakePlatform = MockLocalNetworkPlatform();
    LocalNetworkPlatform.instance = fakePlatform;

    expect(await localNetworkPlugin.getPlatformVersion(), '42');
  });
}
