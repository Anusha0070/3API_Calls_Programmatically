//
//  MealsTableViewCell.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//

import UIKit

class MealsTableViewCell: UITableViewCell {
    
    let mealItemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    let mealItemLabel: UILabel = {
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
        contentView.addSubview(mealItemImage)
        contentView.addSubview(mealItemLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mealItemImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            mealItemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mealItemImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            mealItemImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mealItemImage.heightAnchor.constraint(equalToConstant: 80), // Set image size
            mealItemImage.widthAnchor.constraint(equalToConstant: 80),

            // FoodGroupLabel constraints (Right Side)
            mealItemLabel.leadingAnchor.constraint(equalTo: mealItemImage.trailingAnchor, constant: 12),
            mealItemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mealItemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
