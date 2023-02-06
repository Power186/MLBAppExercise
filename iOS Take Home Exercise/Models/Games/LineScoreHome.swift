import Foundation

struct LineScoreHome: Codable {
    
    var runs: Int?
    var hits: Int?
    var errors: Int?
    var leftOnBase: Int?
    
    private enum CodingKeys: String, CodingKey {
        case runs, hits, errors, leftOnBase
    }
    
}
