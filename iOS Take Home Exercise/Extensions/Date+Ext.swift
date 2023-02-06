import Foundation

extension Date {
    
    func mutate(by days: Int) -> Date {
        return Calendar.current.date(byAdding: .day,
                                     value: days,
                                     to: self) ?? Date()
    }
    
}
