//
//  FavoriteViewController.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var bitcoinBtn: UIButton!
    @IBOutlet weak var appleBtn: UIButton!
    @IBOutlet weak var earthquakeBtn: UIButton!
    @IBOutlet weak var animalBtn: UIButton!
    @IBOutlet weak var tblCategory: UITableView!
    
    // MARK: - Properties
    var dataArr: [Articles] = []
    private let activityIndicator: UIActivityIndicatorView = {
           var actInd = UIActivityIndicatorView()
           actInd.translatesAutoresizingMaskIntoConstraints = false
           actInd.hidesWhenStopped = true
           actInd.style = .large
           return actInd
       }()
    private let categoryPresenter = CategoryPresenter()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        didGetApi()
    }
    
    // MARK: - Life cycle
    @IBAction func didGetBitCoinNews(_ sender: Any) {
        categoryPresenter.didGetDataBitCoinNews(news: dataArr)
    }
    
    @IBAction func didGetEarthquakeNews(_ sender: Any) {
        categoryPresenter.didGetDataEarthquakeNews(news: dataArr)
    }
    
    @IBAction func didGetAppleNews(_ sender: Any) {
        categoryPresenter.didGetDataAppleNews(news: dataArr)
    }
    
    @IBAction func didGetAnimalNews(_ sender: Any) {
        categoryPresenter.didGetDataAnimalNews(news: dataArr)
    }
    
    // MARK: - Private func
    private func setupUI() {
        title = "Categories Selected"
        bitcoinBtn.layer.cornerRadius = 5
        bitcoinBtn.clipsToBounds = true
        appleBtn.layer.cornerRadius = 5
        appleBtn.clipsToBounds = true
        earthquakeBtn.layer.cornerRadius = 5
        earthquakeBtn.clipsToBounds = true
        animalBtn.layer.cornerRadius = 5
        animalBtn.clipsToBounds = true
        
        view.addSubview(activityIndicator)
        activityIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        activityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tblCategory.register(UINib(nibName: "HeadLinesCell", bundle: nil), forCellReuseIdentifier: "HeadLinesCell")
        categoryPresenter.setViewDelegate(categoryPresenterDelegate: self)
    }
    
    private func didGetApi() {
        activityIndicator.startAnimating()
        NetworkManager.shared.getData(completion: { [weak self] data in
            guard let sSelf = self else { return }
            sSelf.dataArr = data
            DispatchQueue.main.async {
                sSelf.activityIndicator.stopAnimating()
                sSelf.tblCategory.reloadData()
            }
        })
    }
}

 // MARK: - UITableViewDelegate, UITableViewDataSource
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "HeadLinesCell", for: indexPath) as! HeadLinesCell
       cell.updataUI(urlImage: dataArr[indexPath.item].urlToImage ?? "")
       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}

// MARK: - CategoryPresenterDelegate
extension CategoriesViewController: CategoryPresenterDelegate {
    func didReturnDataSearch(news: [Articles]) {
        dataArr.removeAll()
        dataArr = news
        tblCategory.reloadData()
    }
}
