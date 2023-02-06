import Foundation

struct GamesResponse: Codable {
    
    var dates: [GameDates]?
    
    private enum CodingKeys: String, CodingKey {
        case dates
    }
    
}
