import Foundation

struct LineScore: Codable {
    
    var currentInning: Int?
    var scheduledInnings: Int?
    var teams: LineScoreTeams?
    
    private enum CodingKeys: String, CodingKey {
        case currentInning, scheduledInnings, teams
    }
    
}
