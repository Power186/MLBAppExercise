import Foundation

struct AwayTeam: Codable {
    
    var leagueRecord: LeagueRecord?
    var score: Int?
    var team: Team?
    
    private enum CodingKeys: String, CodingKey {
        case leagueRecord, score, team
    }
    
}
