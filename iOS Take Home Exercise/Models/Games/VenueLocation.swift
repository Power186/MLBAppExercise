import Foundation

struct VenueLocation: Codable {
    
    var city: String
    var stateAbbrev: String
    var defaultCoordinates: VenueCoordinates
    
    private enum CodingKeys: String, CodingKey {
        case city, stateAbbrev, defaultCoordinates
    }
    
}
