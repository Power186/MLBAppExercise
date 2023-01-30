import Foundation

struct VenueCoordinates: Codable {
    
    var latitude: Double
    var longitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case latitude, longitude
    }
    
}
