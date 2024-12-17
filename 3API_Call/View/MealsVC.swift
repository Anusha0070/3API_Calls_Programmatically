//
//  MealsVC.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//


import UIKit

class MealsVC: UIViewController {
    
    var mealsVM = MealsVM()
    
    var mealsTableView: UITableView = {
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
        self.title = "MEALS"
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
        view.addSubview(mealsTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mealsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mealsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mealsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mealsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTableView() {
        mealsTableView.register(MealsTableViewCell.self, forCellReuseIdentifier: "MealsCell") // Register a cell
        mealsTableView.dataSource = self // Set data source
        mealsTableView.delegate = self
    }
    
    func getData(){
        mealsVM.onDataChange = { [weak self] in
            DispatchQueue.main.async {
                self?.mealsTableView.reloadData()
            }
        }
        mealsVM.getMealData()
    }
}


extension MealsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsVM.getMealsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealsCell") as? MealsTableViewCell else {
            return UITableViewCell()
        }
        let mealsData = mealsVM.meal?[indexPath.row]
        let imageURL = mealsData?.strMealThumb
        ImageDownloader.shared.getImage(url: imageURL) { image in
            DispatchQueue.main.async{
                cell.mealItemImage.image = image
            }
        }
        cell.mealItemLabel.text = mealsData?.strMeal
        return cell
    }
}


extension MealsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealsData = mealsVM.meal?[indexPath.row]
        let newScreen = MealsDetailsVC()
        newScreen.mealDetails = mealsData
        navigationController?.pushViewController(newScreen, animated: false)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


