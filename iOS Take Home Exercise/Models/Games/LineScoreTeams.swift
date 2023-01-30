import Foundation

struct LineScoreTeams: Codable {
    
    var home: LineScoreHome
    var away: LineScoreAway
    
    private enum CodingKeys: String, CodingKey {
        case home, away
    }
    
}
