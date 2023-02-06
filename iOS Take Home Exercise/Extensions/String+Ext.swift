import Foundation

extension String {
    
    func formatToGameDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = "EEEE MMMM d"
        
        return dateFormatter.string(from: date)
    }
    
    func formatToGameServerDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE MMMM d"
        
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = "2018-MM-dd"
        
        return dateFormatter.string(from: date)
    }
    
    func formatMutatedGameDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: date)
    }
    
    func formatDateToStartTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = "h:mm a"
        
        return dateFormatter.string(from: date)
    }
    
}
