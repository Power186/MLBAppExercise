import UIKit

class GamesTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let awayTeamLabel = UILabel()
    private let awayRecordLabel = UILabel()
    private let homeTeamLabel = UILabel()
    private let homeRecordLabel = UILabel()
    private let awayScoreLabel = UILabel()
    private let homeScoreLabel = UILabel()
    private let gameStatusLabel = UILabel()
    private let disclosureIndicatorView = UIImageView()
    
    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder not implemented")
    }
    
    // MARK: - Public Methods
    
    func set(_ games: Games) {
        awayTeamLabel.text = games.teams?.away?.team?.teamName
        awayRecordLabel.text = "\(games.teams?.away?.leagueRecord?.wins ?? 0)-\(games.teams?.away?.leagueRecord?.losses ?? 0)"
        
        homeTeamLabel.text = games.teams?.home?.team?.teamName
        homeRecordLabel.text = "\(games.teams?.home?.leagueRecord?.wins ?? 0)-\(games.teams?.home?.leagueRecord?.losses ?? 0)"
        
        awayScoreLabel.text = "\(games.teams?.away?.score ?? 0)"
        homeScoreLabel.text = "\(games.teams?.home?.score ?? 0)"
        
        gameStatusLabel.text = games.setGameStatus()
    }
    
    // MARK: - Private Methods
    
    // Style
    private func setStyle() {
        addSubview(awayTeamLabel)
        addSubview(awayRecordLabel)
        addSubview(homeTeamLabel)
        addSubview(homeRecordLabel)
        addSubview(awayScoreLabel)
        addSubview(homeScoreLabel)
        addSubview(gameStatusLabel)
        addSubview(disclosureIndicatorView)
        
        awayTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        awayTeamLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        awayTeamLabel.adjustsFontForContentSizeCategory = true
        
        awayRecordLabel.translatesAutoresizingMaskIntoConstraints = false
        awayRecordLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        awayRecordLabel.textColor = .systemGray
        awayRecordLabel.adjustsFontForContentSizeCategory = true
        
        homeTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        homeTeamLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        homeTeamLabel.adjustsFontForContentSizeCategory = true
        
        homeRecordLabel.translatesAutoresizingMaskIntoConstraints = false
        homeRecordLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        homeRecordLabel.textColor = .systemGray
        homeRecordLabel.adjustsFontForContentSizeCategory = true
        
        awayScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        awayScoreLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        awayScoreLabel.adjustsFontForContentSizeCategory = true
        
        homeScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        homeScoreLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        homeScoreLabel.adjustsFontForContentSizeCategory = true
        
        gameStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        gameStatusLabel.font = UIFont.preferredFont(forTextStyle: .body)
        gameStatusLabel.textColor = .systemBlue
        gameStatusLabel.adjustsFontForContentSizeCategory = true
        
        disclosureIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        disclosureIndicatorView.image = UIImage(systemName: "chevron.right")
        disclosureIndicatorView.tintColor = .systemGray2
    }
    
    // Constraints
    private func setConstrainsts() {
        NSLayoutConstraint.activate([
            awayTeamLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            awayTeamLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            awayRecordLabel.topAnchor.constraint(equalToSystemSpacingBelow: awayTeamLabel.bottomAnchor, multiplier: 0),
            awayRecordLabel.leadingAnchor.constraint(equalTo: awayTeamLabel.leadingAnchor),
            
            homeTeamLabel.topAnchor.constraint(equalToSystemSpacingBelow: awayRecordLabel.bottomAnchor, multiplier: 1),
            homeTeamLabel.leadingAnchor.constraint(equalTo: awayTeamLabel.leadingAnchor),
            
            homeRecordLabel.topAnchor.constraint(equalToSystemSpacingBelow: homeTeamLabel.bottomAnchor, multiplier: 0),
            homeRecordLabel.leadingAnchor.constraint(equalTo: homeTeamLabel.leadingAnchor),
            homeRecordLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            awayScoreLabel.topAnchor.constraint(equalTo: awayTeamLabel.topAnchor, constant: 4),
            awayScoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            homeScoreLabel.topAnchor.constraint(equalTo: homeTeamLabel.topAnchor, constant: 4),
            homeScoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            gameStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            gameStatusLabel.trailingAnchor.constraint(equalTo: disclosureIndicatorView.leadingAnchor, constant: -8),
            
            disclosureIndicatorView.topAnchor.constraint(equalTo: gameStatusLabel.topAnchor, constant: 8),
            disclosureIndicatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            disclosureIndicatorView.heightAnchor.constraint(equalToConstant: 14),
            disclosureIndicatorView.widthAnchor.constraint(equalToConstant: 12),
            disclosureIndicatorView.bottomAnchor.constraint(equalTo: gameStatusLabel.bottomAnchor, constant: -8)
        ])
    }

}
