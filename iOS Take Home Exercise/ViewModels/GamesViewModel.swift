import Foundation
import Combine

final class GamesViewModel {
    
    // MARK: - Properties
    
    var gamesDate: String = String()
    var games: [Games] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Methods
    
    func getGames(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://statsapi.mlb.com/api/v1/schedule?hydrate=team(league),venue(location,timezone),linescore&date=2018-09-19&sportId=1,51&language=en") else {
            debugPrint("\(URLError.badURL)")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(SessionManager.configureData)
            .decode(type: GamesResponse.self, decoder: JSONDecoder())
            .sink {
                switch $0 {
                case .failure(let error):
                    debugPrint(error)
                    completion()
                case .finished:
                    completion()
                    break
                }
            } receiveValue: { [weak self] in
                guard let self = self else { return }
                $0.dates.forEach {
                    self.gamesDate = $0.date.formatToGameDate()
                    self.games = $0.games.sorted()
                }
            }
            .store(in: &cancellables)
    }
    
}
