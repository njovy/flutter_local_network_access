
import Network

@available(iOS 14.0, *)
class LocalNetworkPrivacy : NSObject {
    private var browser: NWBrowser?
    private var netService: NetService?
    private var completion: ((Bool) -> Void)?
    
    
    
    
    @objc
    func checkAccessState(completion: @escaping (Bool) -> Void) {
        self.completion = completion
        
        let parameters = NWParameters()
        parameters.includePeerToPeer = true
        
        // Browse for a custom service type.
        let browser = NWBrowser(for: .bonjour(type: "_bonjour._tcp", domain: nil), using: parameters)
        self.browser = browser
        browser.stateUpdateHandler = { newState in
            switch newState {
            case .failed(let error):
                self.netService?.publish()
            case .ready, .cancelled:
                break
            case let .waiting(error):
                print("Local network permission has been denied: \(error)")
                self.reset()
                self.completion?(false)
            default:
                break
            }
        }
        
        
        self.netService = NetService(domain: "local.", type:"_lnp._tcp.", name: "LocalNetworkPrivacy", port: 1100)
        self.netService?.delegate = self
        
        self.browser?.start(queue: .main)
        self.netService?.publish()
        
        
        //        timer = .scheduledTimer(withTimeInterval: 0.001, repeats: false, block: { timer in
        //            guard UIApplication.shared.applicationState == .active else {
        //                return
        //            }
        //
        //            if self.publishing {
        //                self.timer?.invalidate()
        //                self.completion?(false)
        //            }
        //            else {
        //                self.publishing = true
        //                self.service.delegate = self
        //                self.service.publish()
        //                NSLog("\(Thread.current.name) publish")
        //
        //            }
        //        })
    }
    
    
    
    private func reset() {
        self.browser?.cancel()
        self.browser = nil
        self.netService?.stop()
        self.netService = nil
    }
}

@available(iOS 14.0, *)
extension LocalNetworkPrivacy : NetServiceDelegate {
    
    func netServiceDidPublish(_ sender: NetService) {
        self.reset()
          print("Local network permission has been granted")
          completion?(true)
        
    }
}
