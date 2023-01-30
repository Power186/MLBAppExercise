import UIKit

class GameDateHeaderView: UIView {
    
    // MARK: - Properties
    
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
        dateLabel.text = date
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
        
        nextIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        nextIndicatorImageView.image = UIImage(systemName: "chevron.right")
        nextIndicatorImageView.tintColor = .systemGray
        
        backIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        backIndicatorImageView.image = UIImage(systemName: "chevron.left")
        backIndicatorImageView.tintColor = .systemGray
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
