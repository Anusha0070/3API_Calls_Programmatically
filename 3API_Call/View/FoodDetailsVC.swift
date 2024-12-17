//
//  FoodDetailsVC.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//


import UIKit

class FoodDetailsVC: UIViewController {
    
    var foodVM = FoodVM()
    var foodItemDetails : [FoodItem]?
    var foodDetailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSubviews()
        setupTableView()
        setupConstraints()
    }

    func layoutSubviews(){
        view.addSubview(foodDetailsTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            foodDetailsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            foodDetailsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodDetailsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodDetailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTableView() {
        foodDetailsTableView.register(FoodDetailsTableViewCell.self, forCellReuseIdentifier: "FoodDetailsCell") // Register a cell
        foodDetailsTableView.dataSource = self // Set data source
    }
}


extension FoodDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(foodItemDetails?.count ?? 0)
        return foodItemDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodDetailsCell") as? FoodDetailsTableViewCell,
              let foodData = foodItemDetails?[indexPath.row] else {
            return UITableViewCell()
        }

        let imageURL = foodData.image_url
        ImageDownloader.shared.getImage(url: imageURL) { image in
            DispatchQueue.main.async{
                cell.foodItemImage.image = image
            }
        }
        cell.foodItemLabel.text = foodData.name
        return cell
    }
}

