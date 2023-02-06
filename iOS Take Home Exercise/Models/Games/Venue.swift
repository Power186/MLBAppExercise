import Foundation

struct Venue: Codable {
    
    var id: Int?
    var name: String?
    var location: VenueLocation?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, location
    }
    
}
