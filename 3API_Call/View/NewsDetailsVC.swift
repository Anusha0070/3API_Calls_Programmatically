//
//  NewsDetailsVC.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//


import UIKit

class NewsDetailsVC: UIViewController {

    var newsDetails: Articles?
    
    var newsTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 22) // Use bold font
        label.numberOfLines = 0
        label.textAlignment = .center // Center align text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var newsImg: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 12
        img.layer.borderWidth = 2 // Set border width
        img.layer.borderColor = UIColor.gray.cgColor // Border color
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var newsDescription: UITextView = {
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
        view.addSubview(newsTitle)
        view.addSubview(newsImg)
        view.addSubview(newsDescription)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            newsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            newsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newsTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newsTitle.bottomAnchor.constraint(equalTo: newsImg.topAnchor, constant: -20),
            
            newsImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsImg.widthAnchor.constraint(equalToConstant: 300), // Example width
            newsImg.heightAnchor.constraint(equalToConstant: 200), // Example height
            
            newsDescription.topAnchor.constraint(equalTo: newsImg.bottomAnchor, constant: 20),
            newsDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newsDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newsDescription.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func setupDetails(){
        newsTitle.text = newsDetails?.title
        newsDescription.text = newsDetails?.description
        let imageURL = newsDetails?.urlToImage ?? ""
        ImageDownloader.shared.getImage(url:imageURL ) { [] image in
            DispatchQueue.main.async {
                self.newsImg.image = image
            }
        }
    }
}

