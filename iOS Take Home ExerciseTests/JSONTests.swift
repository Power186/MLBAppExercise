import XCTest
@testable import iOS_Take_Home_Exercise

final class JSONTests: XCTestCase {
    
    var jsonResponse: JSONResponse!
    
    var awayTeamNames: [String]!
    var homeTeamsNames: [String]!
    var homeTeamScores: [Int]!
    var awayTeamScores: [Int]!
    var awayTeamLeagueRecWins: [Int]!
    var awayTeamLeagueRecLosses: [Int]!
    var venueNames: [String]!
    var locationCities: [String]!
    var awayTeamRuns: [Int]!

    override func setUpWithError() throws {
        try super.setUpWithError()
        jsonResponse = JSONResponse()
        awayTeamNames = [String]()
        homeTeamsNames = [String]()
        homeTeamScores = [Int]()
        awayTeamScores = [Int]()
        awayTeamLeagueRecWins = [Int]()
        awayTeamLeagueRecLosses = [Int]()
        venueNames = [String]()
        locationCities = [String]()
        awayTeamRuns = [Int]()
    }

    override func tearDownWithError() throws {
        jsonResponse = nil
        awayTeamNames = nil
        homeTeamsNames = nil
        homeTeamScores = nil
        awayTeamScores = nil
        awayTeamLeagueRecWins = nil
        awayTeamLeagueRecLosses = nil
        venueNames = nil
        locationCities = nil
        awayTeamRuns = nil
        try super.tearDownWithError()
    }
    
    func testGamesJSONDecoding() throws {
        let decoded = try JSONDecoder().decode(GamesResponse.self,
                                               from: jsonResponse.gamesModels)
        XCTAssertNoThrow(decoded, "Games json models should not throw decoding errors")
        
        decoded.dates.forEach {
            XCTAssertEqual($0.date, "2018-09-19")
            $0.games.forEach {
                XCTAssertEqual($0.status.detailedState, "Final")
                XCTAssertEqual($0.linescore.currentInning, 9)
                XCTAssertEqual($0.linescore.scheduledInnings, 9)
                
                awayTeamNames.append($0.teams.away.team.teamName)
                homeTeamsNames.append($0.teams.home.team.teamName)
                homeTeamScores.append($0.teams.home.score)
                awayTeamScores.append($0.teams.away.score)
                awayTeamLeagueRecWins.append($0.teams.away.leagueRecord.wins)
                awayTeamLeagueRecLosses.append($0.teams.away.leagueRecord.losses)
                venueNames.append($0.venue.name)
                locationCities.append( $0.venue.location.city)
                awayTeamRuns.append($0.linescore.teams.away.runs)
            }
        }
        
        let firstAwayTeam = awayTeamNames[0]
        XCTAssert(!firstAwayTeam.isEmpty)
        XCTAssertEqual(firstAwayTeam, "Cardinals")
        
        let firstHomeTeam = homeTeamsNames[0]
        XCTAssert(!firstHomeTeam.isEmpty)
        XCTAssertEqual(firstHomeTeam, "Braves")
        
        let firstAwayLeagueRecordWins = awayTeamLeagueRecWins[0]
        XCTAssertFalse(firstAwayLeagueRecordWins == 0)
        XCTAssertEqual(firstAwayLeagueRecordWins, 84)
        
        let firstAwayLeagueRecordLoss = awayTeamLeagueRecLosses[0]
        XCTAssertFalse(firstAwayLeagueRecordLoss == 0)
        XCTAssertEqual(firstAwayLeagueRecordLoss, 69)
        
        let firstVenue = venueNames[0]
        XCTAssert(!firstVenue.isEmpty)
        XCTAssertEqual(firstVenue, "SunTrust Park")
        
        let firstLocCity = locationCities[0]
        XCTAssert(!firstLocCity.isEmpty)
        XCTAssertEqual(firstLocCity, "Atlanta")
        
        let firstAwayTeamRun = awayTeamRuns[0]
        XCTAssertFalse(firstAwayTeamRun == 0)
        XCTAssertEqual(firstAwayTeamRun, 3)
    }

}
