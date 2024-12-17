//
//  MyTableViewCell.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    let foodGroupImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8 // Optional: Rounded corners
        return imageView
    }()
    
    let foodGroupLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellSubviews()
        setupConstraints()
    }
    
    func setupCellSubviews() {
        contentView.addSubview(foodGroupImage)
        contentView.addSubview(foodGroupLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            foodGroupImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            foodGroupImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            foodGroupImage.widthAnchor.constraint(equalToConstant: 200), // Set the image width
            foodGroupImage.heightAnchor.constraint(equalToConstant: 200), // Set the image height
            
            foodGroupLabel.topAnchor.constraint(equalTo: foodGroupImage.bottomAnchor, constant: 10),
            foodGroupLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            foodGroupLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
