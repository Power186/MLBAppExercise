import Foundation

struct GameDates: Codable {
    
    var date: String?
    var games: [Games]?
    
    private enum CodingKeys: String, CodingKey {
        case date, games
    }
    
}
