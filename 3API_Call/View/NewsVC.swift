
//
//  NewsTableView.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//

import UIKit

class NewsVC: UIViewController {
    
    var newsVM = NewsVM()
    
    var newsTableView: UITableView = {
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
        self.title = "NEWS FEED"
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
        view.addSubview(newsTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTableView() {
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsCell") // Register a cell
        newsTableView.dataSource = self // Set data source
        newsTableView.delegate = self
    }
    
    func getData(){
        newsVM.onDataChange = { [weak self] in
            DispatchQueue.main.async {
                self?.newsTableView.reloadData()
            }
        }
        newsVM.getNewsData()
    }

}




extension NewsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(newsVM.getNewsCount())
        return newsVM.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let newsData = newsVM.news?[indexPath.row]
        let imageURL = newsData?.urlToImage
        ImageDownloader.shared.getImage(url: imageURL) { image in
            DispatchQueue.main.async{
                cell.articleImage.image = image
            }
        }
        cell.articleLabel.text = newsData?.title
        return cell
    }
}


extension NewsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsData = newsVM.news?[indexPath.row]
        let newScreen = NewsDetailsVC()
        newScreen.newsDetails = newsData
        navigationController?.pushViewController(newScreen, animated: false)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
