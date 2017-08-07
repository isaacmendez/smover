//
//  AppDelegate.swift
//  Smover
//
//  Created by Laurie Gray on 18/07/2017.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //Temporary User for workign just now
    func addTemporaryUser() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let userList = try context.fetch(fetchRequest) as? [User]
            if let result = userList {
                if result.count > 0 {
                    return
                } else {
                    let user = User(entity: User.entity(), insertInto: context) as User
                    user.userName = "Morpheus"
                    user.age = 800
                    user.lifeSavedInTimeInMinutes = 0
                    try context.save()
                }
            }
        
        } catch let error {
            print(error.localizedDescription)
        }
        
    }

    // Checks if the user has logged in before and returns a boolean
    func userHasPreviouslyLoggedIn() -> Bool {
        if let path = Bundle.main.path(forResource: "UserData", ofType: "plist") {
            if let dictionary = NSDictionary(contentsOfFile: path) as? [String:Any],
                let userHasLoggedIn = dictionary["userHasPreviouslyLoggedIn"] as? Bool {
                    return userHasLoggedIn
            }
        }
        return false
    }
    
    func loadOptions() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<AppMode> = AppMode.fetchRequest()
        
        do {
         let result = try context.fetch(fetchRequest)
            if result.count == 0 {
                // This is the app's first launch so let's place defaults in the data model
                let appModeDescription = NSEntityDescription.insertNewObject(forEntityName: AppMode.description(), into: context) as! AppMode
                appModeDescription.isColdTurkeyModeActive = false
                try context.save()
            } 
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func setupNavigationStyle() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 255/255, green: 58/255, blue: 30/255, alpha: 1)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        let navigationBackgroundBar: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 255/255, green: 58/255, blue: 50/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        window?.addSubview(navigationBackgroundBar)
        window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|",
                                                              options: NSLayoutFormatOptions(),
                                                              metrics: nil,
                                                              views: ["v0":navigationBackgroundBar]))
        
        window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(20)]",
                                                              options: NSLayoutFormatOptions(),
                                                              metrics: nil,
                                                              views: ["v0":navigationBackgroundBar]))
    }
    
    func setupTabBarController(with views:[UIViewController]) -> UITabBarController {
        let tabBarController: UITabBarController = {
            let tabBar = UITabBarController()
            tabBar.viewControllers = views
            tabBar.tabBar.barTintColor = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1.0)
            tabBar.tabBar.tintColor = UIColor.white
            return tabBar
        }()
        return tabBarController
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        loadOptions()
        // Temporary User Setup
        addTemporaryUser()
    
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem.image = UIImage(named: "Smover-40")
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let optionsViewController = OptionsViewController(collectionViewLayout: collectionViewFlowLayout)
        optionsViewController.tabBarItem.image = UIImage(named: "options-30")
        
        let cvflowlayout = UICollectionViewFlowLayout()
        let diaryViewController = DiaryViewController(collectionViewLayout: cvflowlayout)
        diaryViewController.tabBarItem.image = UIImage(named: "smover-30")
        
        if !userHasPreviouslyLoggedIn() {
//            let welcomeViewController = WelcomeViewController()
        }
    
        let tabController = setupTabBarController(with: [homeViewController, diaryViewController, optionsViewController])
        
        // window?.rootViewController = tabController
        window?.rootViewController = UINavigationController(rootViewController: tabController)
        // Setup NavigationBar
    
        
        setupNavigationStyle()
        
        application.statusBarStyle = .lightContent
       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Smover")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

