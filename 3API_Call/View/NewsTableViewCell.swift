//
//  NewsTableViewCell.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let articleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let articleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellSubviews()
        setupConstraints()
    }
    
    func setupCellSubviews() {
        contentView.addSubview(articleImage)
        contentView.addSubview(articleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            articleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            articleImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            articleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            articleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            articleLabel.topAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: 10),
            articleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            articleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            articleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            articleLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
