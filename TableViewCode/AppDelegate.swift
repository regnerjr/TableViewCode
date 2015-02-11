import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //Set the ViewController to your custom class
        let vc = UIViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = UIColor.greenColor()
        window?.rootViewController = vc
        window?.backgroundColor = UIColor.whiteColor()
        window?.makeKeyAndVisible()
        return true
    }
}

