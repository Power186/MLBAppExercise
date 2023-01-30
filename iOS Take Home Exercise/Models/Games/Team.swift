import Foundation

struct Team: Codable {
    
    var id: Int
    var name: String
    var teamName: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, teamName
    }
    
}
