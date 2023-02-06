import UIKit

class GameDateHeaderView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: GameDateHeaderDelegate?
    private var selectedDate: String = ""
    private var dateValue: Int = 0
    
    private let dateLabel = UILabel()
    private let nextIndicatorImageView = UIImageView()
    private let backIndicatorImageView = UIImageView()
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder has not been implemented")
    }
    
    init(date: String) {
        super.init(frame: .zero)
        selectedDate = date
        configureView()
    }
    
    // MARK: - Private Methods
    
    private func configureView() {
        setStyle()
        setConstraints()
    }
    
    // Style
    private func setStyle() {
        addSubview(dateLabel)
        addSubview(nextIndicatorImageView)
        addSubview(backIndicatorImageView)
        
        backgroundColor = .systemGray6
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.adjustsFontForContentSizeCategory = true
        dateLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        dateLabel.text = selectedDate
        
        nextIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        nextIndicatorImageView.image = UIImage(systemName: "chevron.right")
        nextIndicatorImageView.tintColor = .systemGray
        nextIndicatorImageView.isUserInteractionEnabled = true
        let next = UITapGestureRecognizer(target: self,
                                       action: #selector(nextTapped))
        nextIndicatorImageView.addGestureRecognizer(next)
        
        backIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        backIndicatorImageView.image = UIImage(systemName: "chevron.left")
        backIndicatorImageView.tintColor = .systemGray
        backIndicatorImageView.isUserInteractionEnabled = true
        let back = UITapGestureRecognizer(target: self,
                                          action: #selector(backTapped))
        backIndicatorImageView.addGestureRecognizer(back)
    }
    
    // Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backIndicatorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backIndicatorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            nextIndicatorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nextIndicatorImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }

}

// MARK: - Helper Methods

extension GameDateHeaderView {
    
    @objc private func nextTapped() {
        dateValue += 1
        setSelectedDate()
    }
    
    @objc private  func backTapped() {
        dateValue -= 1
        setSelectedDate()
    }
    
    private func setSelectedDate() {
        // convert this to a date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: selectedDate.formatToGameServerDate()) ?? Date()

        // pass in updated dateValue
        let newDate = date.mutate(by: dateValue)
        
        // convert newDate to string
        let secondFormatter = DateFormatter()
        secondFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let string = secondFormatter.string(from: newDate)
        
        // send selected date
        delegate?.updatedDate(string.formatMutatedGameDate())
    }
    
}
