
import 'local_network_platform_interface.dart';

class LocalNetwork {

  Future<bool> checkLocalNetworkAccess({double timeout = 2.0}) {
    return LocalNetworkPlatform.instance.checkLocalNetworkAccess(timeout: timeout);
  }
}
