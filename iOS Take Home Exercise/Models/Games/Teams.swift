import Foundation

struct Teams: Codable {
    
    var away: AwayTeam?
    var home: HomeTeam?
    
    private enum CodingKeys: String, CodingKey {
        case away, home
    }
    
}
