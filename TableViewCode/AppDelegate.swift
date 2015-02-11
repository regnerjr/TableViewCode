import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //Set the ViewController to your custom class
        let vc = ViewController(style: UITableViewStyle.Plain) //this is the designated initializer for UITableViewController
        window?.rootViewController = vc
        window?.backgroundColor = UIColor.whiteColor()
        window?.makeKeyAndVisible()
        return true
    }
}

