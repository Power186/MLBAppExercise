import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .systemBlue
        setUpViewControllers()
    }
    
    // MARK: - Private Methods
    
    private func setUpViewControllers() {
        viewControllers = [
            createTabBar(for: UINavigationController(rootViewController: GamesTableViewController()),
                         title: "Scores",
                         systemImage: "squareshape.split.2x2")
        ]
    }
    
    private func createTabBar(for viewController: UIViewController,
                                      title: String,
                                      systemImage: String) -> UIViewController {
        let iconSymbol = UIImage(systemName: systemImage)
        
        let selectedSymbol = UIImage(systemName: systemImage,
                                     withConfiguration: UIImage.SymbolConfiguration(weight: .semibold))
        
        let tabBarItem = UITabBarItem(title: title,
                                      image: iconSymbol,
                                      selectedImage: selectedSymbol)
        viewController.tabBarItem = tabBarItem
        return viewController
    }

}
