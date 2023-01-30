import UIKit
import SwiftUI

class GamesTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let gamesVM: GamesViewModel = GamesViewModel()
    
    private let logoImage: UIImage? = UIImage(named: "mlbLogo")
    private let cellIdentifier: String = "gamesCell"
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
 
        setNavigationBar()
        setTableView()
        getGames()
    }

    // MARK: - TableView Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gamesVM.games.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? GamesTableViewCell else {
            fatalError("Cell identifier failed.")
        }
        
        let games = gamesVM.games[indexPath.row]
        cell.set(games)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dateView = GameDateHeaderView(date: gamesVM.gamesDate)
        return dateView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let games = gamesVM.games[indexPath.row]
        let hostingController = UIHostingController(rootView: GameDetailView(display: games))
        navigationController?.pushViewController(hostingController, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setNavigationBar() {
        let imageView = UIImageView(image: logoImage)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    private func setTableView() {
        tableView.register(GamesTableViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
        tableView.separatorInset = .zero
    }
    
    private func getGames() {
        gamesVM.getGames { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }

}
