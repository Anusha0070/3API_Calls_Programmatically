//
//  FoodDetailsTableViewCell.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//

import UIKit

class FoodDetailsTableViewCell: UITableViewCell {
    
    let foodItemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    let foodItemLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        contentView.addSubview(foodItemImage)
        contentView.addSubview(foodItemLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            foodItemImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            foodItemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            foodItemImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            foodItemImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            foodItemImage.heightAnchor.constraint(equalToConstant: 80), // Set image size
            foodItemImage.widthAnchor.constraint(equalToConstant: 80),

            foodItemLabel.leadingAnchor.constraint(equalTo: foodItemImage.trailingAnchor, constant: 12),
            foodItemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            foodItemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
