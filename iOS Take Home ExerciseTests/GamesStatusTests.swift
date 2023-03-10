import XCTest
@testable import iOS_Take_Home_Exercise

final class GamesStatusTests: XCTestCase {
    
    var gamesNotStarting: Games!
    var gamesInProgress: Games!
    var gamesInningsMoreThan9: Games!
    var gamesInningsLessThan9: Games!
    var gamesPostponed: Games!

    override func setUpWithError() throws {
        try super.setUpWithError()
        gamesNotStarting = Games(gameDate: "2018-09-19T16:10:00Z",
                      status: GameStatus(abstractGameState: "TBD",
                                         detailedState: "TBD",
                                         startTimeTBD: true),
                      teams: Teams(away: AwayTeam(leagueRecord: LeagueRecord(wins: 8,
                                                                             losses: 12),
                                                  score: 5,
                                                  team: Team(id: 0,
                                                             name: "Cardinals",
                                                             teamName: "St. Louis Cardinals")),
                                   home: HomeTeam(leagueRecord: LeagueRecord(wins: 0,
                                                                             losses: 12),
                                                  score: 6,
                                                  team: Team(id: 1,
                                                             name: "Dodgers",
                                                             teamName: "Los Angeles Dodgers"))),
                      linescore: LineScore(currentInning: 5,
                                           scheduledInnings: 9,
                                           teams: LineScoreTeams(home: LineScoreHome(runs: 0,
                                                                                     hits: 0,
                                                                                     errors: 0,
                                                                                     leftOnBase: 0),
                                                                 away: LineScoreAway(runs: 0,
                                                                                     hits: 0,
                                                                                     errors: 0,
                                                                                     leftOnBase: 0))),
                      venue: Venue(id: 0, name: "location", location: VenueLocation(city: "Atlanta",
                                                                                    stateAbbrev: "GA",
                                                                                    defaultCoordinates: VenueCoordinates(latitude: 10.000,
                                                                                                                         longitude: 11.000))))
        gamesInProgress = Games(gameDate: "2018-09-19T16:10:00Z",
                                status: GameStatus(abstractGameState: "InProgress",
                                                   detailedState: "InProgress",
                                                   startTimeTBD: false),
                                teams: Teams(away: AwayTeam(leagueRecord: LeagueRecord(wins: 8,
                                                                                       losses: 12),
                                                            score: 5,
                                                            team: Team(id: 0,
                                                                       name: "Cardinals",
                                                                       teamName: "St. Louis Cardinals")),
                                             home: HomeTeam(leagueRecord: LeagueRecord(wins: 0,
                                                                                       losses: 12),
                                                            score: 6,
                                                            team: Team(id: 1,
                                                                       name: "Dodgers",
                                                                       teamName: "Los Angeles Dodgers"))),
                                linescore: LineScore(currentInning: 5,
                                                     scheduledInnings: 9,
                                                     teams: LineScoreTeams(home: LineScoreHome(runs: 0,
                                                                                               hits: 0,
                                                                                               errors: 0,
                                                                                               leftOnBase: 0),
                                                                           away: LineScoreAway(runs: 0,
                                                                                               hits: 0,
                                                                                               errors: 0,
                                                                                               leftOnBase: 0))),
                                venue: Venue(id: 0, name: "location", location: VenueLocation(city: "Atlanta",
                                                                                              stateAbbrev: "GA",
                                                                                              defaultCoordinates: VenueCoordinates(latitude: 10.000,
                                                                                                                                   longitude: 11.000))))
        gamesInningsMoreThan9 = Games(gameDate: "2018-09-19T16:10:00Z",
                                            status: GameStatus(abstractGameState: "Final",
                                                               detailedState: "Final",
                                                               startTimeTBD: false),
                                            teams: Teams(away: AwayTeam(leagueRecord: LeagueRecord(wins: 8,
                                                                                                   losses: 12),
                                                                        score: 5,
                                                                        team: Team(id: 0,
                                                                                   name: "Cardinals",
                                                                                   teamName: "St. Louis Cardinals")),
                                                         home: HomeTeam(leagueRecord: LeagueRecord(wins: 0,
                                                                                                   losses: 12),
                                                                        score: 6,
                                                                        team: Team(id: 1,
                                                                                   name: "Dodgers",
                                                                                   teamName: "Los Angeles Dodgers"))),
                                            linescore: LineScore(currentInning: 10,
                                                                 scheduledInnings: 9,
                                                                 teams: LineScoreTeams(home: LineScoreHome(runs: 0,
                                                                                                           hits: 0,
                                                                                                           errors: 0,
                                                                                                           leftOnBase: 0),
                                                                                       away: LineScoreAway(runs: 0,
                                                                                                           hits: 0,
                                                                                                           errors: 0,
                                                                                                           leftOnBase: 0))),
                                            venue: Venue(id: 0, name: "location", location: VenueLocation(city: "Atlanta",
                                                                                                          stateAbbrev: "GA",
                                                                                                          defaultCoordinates: VenueCoordinates(latitude: 10.000,
                                                                                                                                               longitude: 11.000))))
        gamesInningsLessThan9 = Games(gameDate: "2018-09-19T16:10:00Z",
                                      status: GameStatus(abstractGameState: "Completed Early: Rain",
                                                         detailedState: "Completed Early: Rain",
                                                         startTimeTBD: false),
                                      teams: Teams(away: AwayTeam(leagueRecord: LeagueRecord(wins: 8,
                                                                                             losses: 12),
                                                                  score: 5,
                                                                  team: Team(id: 0,
                                                                             name: "Cardinals",
                                                                             teamName: "St. Louis Cardinals")),
                                                   home: HomeTeam(leagueRecord: LeagueRecord(wins: 0,
                                                                                             losses: 12),
                                                                  score: 6,
                                                                  team: Team(id: 1,
                                                                             name: "Dodgers",
                                                                             teamName: "Los Angeles Dodgers"))),
                                      linescore: LineScore(currentInning: 7,
                                                           scheduledInnings: 9,
                                                           teams: LineScoreTeams(home: LineScoreHome(runs: 0,
                                                                                                     hits: 0,
                                                                                                     errors: 0,
                                                                                                     leftOnBase: 0),
                                                                                 away: LineScoreAway(runs: 0,
                                                                                                     hits: 0,
                                                                                                     errors: 0,
                                                                                                     leftOnBase: 0))),
                                      venue: Venue(id: 0, name: "location", location: VenueLocation(city: "Atlanta",
                                                                                                    stateAbbrev: "GA",
                                                                                                    defaultCoordinates: VenueCoordinates(latitude: 10.000,
                                                                                                                                         longitude: 11.000))))
        gamesPostponed = Games(gameDate: "2018-09-19T19:10:00Z",
                               status: GameStatus(abstractGameState: "Postponed",
                                                  detailedState: "Postponed",
                                                  startTimeTBD: false),
                               teams: Teams(away: AwayTeam(leagueRecord: LeagueRecord(wins: 8,
                                                                                      losses: 12),
                                                           score: 5,
                                                           team: Team(id: 0,
                                                                      name: "Cardinals",
                                                                      teamName: "St. Louis Cardinals")),
                                            home: HomeTeam(leagueRecord: LeagueRecord(wins: 0,
                                                                                      losses: 12),
                                                           score: 6,
                                                           team: Team(id: 1,
                                                                      name: "Dodgers",
                                                                      teamName: "Los Angeles Dodgers"))),
                               linescore: LineScore(currentInning: 7,
                                                    scheduledInnings: 9,
                                                    teams: LineScoreTeams(home: LineScoreHome(runs: 0,
                                                                                              hits: 0,
                                                                                              errors: 0,
                                                                                              leftOnBase: 0),
                                                                          away: LineScoreAway(runs: 0,
                                                                                              hits: 0,
                                                                                              errors: 0,
                                                                                              leftOnBase: 0))),
                               venue: Venue(id: 0, name: "location", location: VenueLocation(city: "Atlanta",
                                                                                             stateAbbrev: "GA",
                                                                                             defaultCoordinates: VenueCoordinates(latitude: 10.000,
                                                                                                                                  longitude: 11.000))))
    }

    override func tearDownWithError() throws {
        gamesNotStarting = nil
        gamesInProgress = nil
        gamesInningsMoreThan9 = nil
        gamesInningsLessThan9 = nil
        gamesPostponed = nil
        try super.tearDownWithError()
    }
    
    func testGamesNotStarted() throws {
        XCTAssertEqual(gamesNotStarting.setGameStatus(), "10:10 AM")
    }
    
    func testGamesInProgress() throws {
        XCTAssertEqual(gamesInProgress.setGameStatus(), "\(5)")
    }
    
    func testGamesInningsMoreThan9() throws {
        XCTAssertEqual(gamesInningsMoreThan9.setGameStatus(), "Final/10")
    }
    
    func testGamesInningsMoreLessThan9() throws {
        XCTAssertEqual(gamesInningsLessThan9.setGameStatus(), "Final/7")
    }
    
    func testGamesPostponed() throws {
        XCTAssertEqual(gamesPostponed.setGameStatus(), "1:10 PM")
    }

}
