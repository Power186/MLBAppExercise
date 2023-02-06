import Foundation

struct Games: Codable {
    
    var gameDate: String?
    var status: GameStatus?
    var teams: Teams?
    var linescore: LineScore?
    var venue: Venue?
    
    private enum CodingKeys: String, CodingKey {
        case gameDate, status, teams, linescore, venue
    }
    
}

// MARK: - Helper Methods

extension Games {
    
    /// Updates the status for games not yet started, games in progress, and games completed
    /// - Returns: Either games start time, in progress, or final status
    func setGameStatus() -> String {
        if status?.startTimeTBD == true ||
           status?.detailedState == "Postponed" {
            return gameDate?.formatDateToStartTime() ?? ""
        } else if status?.detailedState == "InProgress" {
            return "\(linescore?.currentInning ?? 0)"
        } else if status?.detailedState == "Completed Early: Rain" {
            return "Final" + "/" + "\(linescore?.currentInning ?? 0)"
        } else if status?.detailedState == "Final" &&
                    linescore?.currentInning ?? 0 < 9 ||
                    status?.detailedState == "Final" &&
                    linescore?.currentInning ?? 0 > 9 {
            return "\(status?.detailedState ?? "")/\(linescore?.currentInning ?? 0)"
        }
        return status?.detailedState ?? ""
    }
    
}

// MARK: - Protocol Conformance

extension Games: Comparable {
    
    static func < (lhs: Games, rhs: Games) -> Bool {
        lhs.gameDate ?? "" < rhs.gameDate ?? ""
    }
    
}

extension Games: Equatable {
    
    static func == (lhs: Games, rhs: Games) -> Bool {
        lhs.gameDate == rhs.gameDate
    }
    
}
