//
//  GFUserInfoView.swift
//  GitHubFollowers
//
//  Created by Oleg Kirsanov on 04.03.2022.
//

import UIKit

enum UserInfoViewType {
    case repos, gists, followers, following
}

class GFUserInfoView: UIView {
    let infoImage = UIImageView()
    let infoTitle = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let infoCount = GFTitleLabel(textAlignment: .left, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        let imageSize: CGFloat = 20
        let infoTitleTrailing: CGFloat  = 12
        let infoTitleHeight: CGFloat = 18
        let infoCountPadding: CGFloat = 4
        
        addSubview(infoImage)
        addSubview(infoTitle)
        addSubview(infoCount)
        
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        infoImage.tintColor = .label
        infoImage.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            infoImage.topAnchor.constraint(equalTo: self.topAnchor),
            infoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            infoImage.widthAnchor.constraint(equalToConstant: imageSize),
            infoImage.heightAnchor.constraint(equalToConstant: imageSize),
            
            infoTitle.centerYAnchor.constraint(equalTo: infoImage.centerYAnchor),
            infoTitle.leadingAnchor.constraint(equalTo: infoImage.trailingAnchor, constant: infoTitleTrailing),
            infoTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            infoTitle.heightAnchor.constraint(equalToConstant: infoTitleHeight),
            
            infoCount.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: infoCountPadding),
            infoCount.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            infoCount.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            infoCount.heightAnchor.constraint(equalToConstant: infoTitleHeight)
        ])
        
        func set(for type: UserInfoViewType, with count: Int) {
           
            switch type {
            case .repos:
                infoImage.image = UIImage(named: SFSymbols.repos)
                infoTitle.text = "Public Repos"

            case .gists:
                infoImage.image = UIImage(named: SFSymbols.gists)
                infoTitle.text = "Public Gists"
            case .followers:
                infoImage.image = UIImage(named: SFSymbols.followers)
                infoTitle.text = "Followers"
            case .following:
                infoImage.image = UIImage(named: SFSymbols.following)
                infoTitle.text = "Following"
            }
            
            infoCount.text = String(count)
        }
    }
}
