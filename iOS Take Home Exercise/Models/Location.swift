import Foundation
import MapKit

struct Location: Identifiable {
    
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    
}

extension CLLocationCoordinate2D: Identifiable {
    
    public var id: String {
        "\(latitude)-\(longitude)"
    }
    
}
