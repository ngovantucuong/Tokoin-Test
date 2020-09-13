//
//  ViewController.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import UIKit

class HeadLinesViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tblHeadLines: UITableView!
    
    // MARK: - Properties
    var dataArr: [Articles] = []
    private let activityIndicator: UIActivityIndicatorView = {
        var actInd = UIActivityIndicatorView()
        actInd.translatesAutoresizingMaskIntoConstraints = false
        actInd.hidesWhenStopped = true
        actInd.style = .large
        return actInd
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        didGetApi()
    }

    // MARK: - Private func
    private func setupUI() {
        title = "HeadLines News"
        tblHeadLines.register(UINib(nibName: "HeadLinesCell", bundle: nil), forCellReuseIdentifier: "HeadLinesCell")
        view.addSubview(activityIndicator)
        activityIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        activityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    private func didGetApi() {
        activityIndicator.startAnimating()
        NetworkManager.shared.getData(completion: { [weak self] data in
            guard let sSelf = self else { return }
            sSelf.dataArr = data
            DispatchQueue.main.async {
                sSelf.activityIndicator.stopAnimating()
                sSelf.tblHeadLines.reloadData()
            }
        })
    }
    
    // MARK: - Public func

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HeadLinesViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        detailViewController.dataNews = dataArr[indexPath.item]
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
}
