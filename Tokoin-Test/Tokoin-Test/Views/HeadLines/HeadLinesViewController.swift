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
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        didGetApi()
    }

    // MARK: - Private func
    private func setupUI() {
        tblHeadLines.register(UINib(nibName: "HeadLinesCell", bundle: nil), forCellReuseIdentifier: "HeadLinesCell")
    }
    
    private func didGetApi() {
        NetworkManager.shared.getData(completion: { [weak self] data in
            guard let sSelf = self else { return }
            sSelf.dataArr = data
            DispatchQueue.main.async {
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
    
}
