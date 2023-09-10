import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'local_network_platform_interface.dart';

/// An implementation of [LocalNetworkPlatform] that uses method channels.
class MethodChannelLocalNetwork extends LocalNetworkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.njovy.libs/local_network');

  @override
  Future<bool> checkLocalNetworkAccess() {
    return methodChannel.invokeMethod<bool>('checkLocalNetworkAccess').then((value) => value ?? false);
  }
}
