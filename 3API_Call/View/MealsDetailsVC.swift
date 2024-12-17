//
//  MealsDetailsVC.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//


import UIKit

class MealsDetailsVC: UIViewController {

    var mealDetails: Meal?
    
    var mealTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 22) // Use bold font
        label.numberOfLines = 0
        label.textAlignment = .center // Center align text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var mealImg: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 12
        img.layer.borderWidth = 2 // Set border width
        img.layer.borderColor = UIColor.gray.cgColor // Border color
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var mealInstructionsTitle: UILabel = {
        let label = UILabel()
        label.text = "Instructions"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20) // Use bold font
        label.textAlignment = .center // Center align text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var instructions: UITextView = {
        let label = UITextView()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSubviews()
        setupDetails()
        setupConstraints()
    }
    
    func layoutSubviews(){
        view.addSubview(mealTitle)
        view.addSubview(mealImg)
        view.addSubview(instructions)
        view.addSubview(mealInstructionsTitle)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            mealTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mealTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            mealTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mealTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mealTitle.bottomAnchor.constraint(equalTo: mealImg.topAnchor, constant: -20),
            
            mealImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mealImg.widthAnchor.constraint(equalToConstant: 300), // Example width
            mealImg.heightAnchor.constraint(equalToConstant: 200), // Example height
            
            mealInstructionsTitle.topAnchor.constraint(equalTo: mealImg.bottomAnchor, constant: 20),
            mealInstructionsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mealInstructionsTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            instructions.topAnchor.constraint(equalTo: mealInstructionsTitle.bottomAnchor, constant: 20),
            instructions.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            instructions.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            instructions.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func setupDetails(){
        mealTitle.text = mealDetails?.strMeal
        instructions.text = mealDetails?.strInstructions ?? "N/A"
        let imageURL = mealDetails?.strMealThumb
        ImageDownloader.shared.getImage(url:imageURL ) { [] image in
            DispatchQueue.main.async {
                self.mealImg.image = image
            }
        }
    }
}
