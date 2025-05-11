import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'local_network_method_channel.dart';

abstract class LocalNetworkPlatform extends PlatformInterface {
  /// Constructs a LocalNetworkPlatform.
  LocalNetworkPlatform() : super(token: _token);

  static final Object _token = Object();

  static LocalNetworkPlatform _instance = MethodChannelLocalNetwork();

  /// The default instance of [LocalNetworkPlatform] to use.
  ///
  /// Defaults to [MethodChannelLocalNetwork].
  static LocalNetworkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocalNetworkPlatform] when
  /// they register themselves.
  static set instance(LocalNetworkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }


  Future<bool> checkLocalNetworkAccess({double timeout = 2.0}) {
    throw UnimplementedError('checkLocalNetworkAccess() has not been implemented.');
  }
}
