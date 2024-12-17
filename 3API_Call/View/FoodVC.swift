//
//  FoodVC.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//


import UIKit

class FoodVC: UIViewController {

    var foodVM = FoodVM()
    
    var foodTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        layoutSubviews()
        setupConstraints()
        setupTableView()
        getData()
    }
    
    func setupTitle(){
        self.title = "FOOD MENU"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 26)
        ]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func layoutSubviews(){
        view.addSubview(foodTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            foodTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            foodTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTableView() {
        foodTableView.register(FoodTableViewCell.self, forCellReuseIdentifier: "Cell") // Register a cell
        foodTableView.dataSource = self // Set data source
        foodTableView.delegate = self // Set delegate
    }
    
    func getData(){
        foodVM.onDataChange = { [weak self] in
            DispatchQueue.main.async {
                self?.foodTableView.reloadData()
            }
        }
        foodVM.getFoodData()
    }
}

extension FoodVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(foodVM.getFoodGroupCount())
        return foodVM.getFoodGroupCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? FoodTableViewCell else {
            return UITableViewCell()
        }
        let foodGroupData = foodVM.food?[indexPath.row]
        let imageURL = foodGroupData?.image_url
        ImageDownloader.shared.getImage(url: imageURL) { image in
            DispatchQueue.main.async{
                cell.foodGroupImage.image = image
            }
        }
        cell.foodGroupLabel.text = foodGroupData?.name
        return cell
    }
}


extension FoodVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodDetails = foodVM.getFoodGroupItems(index: indexPath.row)
        let newScreen = FoodDetailsVC()
        newScreen.foodItemDetails = foodDetails
        navigationController?.pushViewController(newScreen, animated: false)
    }
}

