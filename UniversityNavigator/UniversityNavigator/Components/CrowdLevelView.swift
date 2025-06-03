//
//  CrowdLevelView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-03.
//

// Components/CrowdLevelView.swift
import UIKit

class CrowdLevelView: UIView {
    private let titleLabel = UILabel()
    private let levelLabel = UILabel()
    private let progressView = UIProgressView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .secondaryBackground
        layer.cornerRadius = 8
        
        titleLabel.text = "Crowd Level"
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        titleLabel.textColor = .secondaryText
        
        levelLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        levelLabel.textColor = .primaryText
        
        progressView.progressTintColor = .accentColor
        progressView.trackTintColor = .systemGray5
        
        [titleLabel, levelLabel, progressView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            levelLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            levelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            progressView.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 8),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with crowdLevel: CrowdLevel) {
        levelLabel.text = crowdLevel.rawValue
        levelLabel.textColor = crowdLevel.color
        progressView.progress = crowdLevel.progress
        progressView.progressTintColor = crowdLevel.color
    }
}
