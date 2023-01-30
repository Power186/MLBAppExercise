import Foundation

struct GameStatus: Codable {
    
    var abstractGameState: String
    var detailedState: String
    var startTimeTBD: Bool
    
    private enum CodingKeys: String, CodingKey {
        case abstractGameState, detailedState, startTimeTBD
    }
    
}
