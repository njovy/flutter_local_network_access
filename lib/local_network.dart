
import 'local_network_platform_interface.dart';

class LocalNetwork {

  Future<bool> checkLocalNetworkAccess() {
    return LocalNetworkPlatform.instance.checkLocalNetworkAccess();
  }
}
