import Foundation

struct LeagueRecord: Codable {
    
    var wins: Int?
    var losses: Int?
    
    private enum CodingKeys: String, CodingKey {
        case wins, losses
    }
    
}
