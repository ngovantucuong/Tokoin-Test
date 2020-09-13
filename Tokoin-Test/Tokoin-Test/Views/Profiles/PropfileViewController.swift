//
//  PropfileViewController.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import UIKit

class PropfileViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var tblProfile: UITableView!
    
    // MARK: - Properties
    private let profilePresenter = ProfilePresenter()
    var arrData: [UserRealm] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getDataLocal()
    }
    
    // MARK: - Private func
    private func setupUI() {
        btnRegister.layer.cornerRadius = 8
        btnRegister.addTarget(self, action: #selector(didRegister(_:)), for: .touchUpInside)
        profilePresenter.setDelegate(delegate: self)
        tblProfile.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
    }
    
    private func getDataLocal() {
        DBManager.shared.getDataUser(complete: { [weak self] arrData in
            guard let sSelf = self else { return }
            sSelf.arrData = arrData
            sSelf.tblProfile.reloadData()
        })
    }
    
    @objc func didRegister(_ sender: UIButton) {
        let name = txtName.text ?? ""
        let address = txtAddress.text ?? ""
        let phone = txtPhone.text ?? ""
        profilePresenter.didSaveDataLocal(name: name, address: address, phone: phone)
    }
    
}

 // MARK: - Public func
extension PropfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        cell.lblName.text = arrData[indexPath.item].name
        cell.lblAddress.text = arrData[indexPath.item].address
        cell.lblPhone.text = arrData[indexPath.item].phone
        cell.seperatorView.isHidden = indexPath.item == arrData.count - 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}

// MARK: - rofilePresenterDelegate
extension PropfileViewController: ProfilePresenterDelegate {
    func didGetDataLocal() {
        DBManager.shared.getDataUser(complete: { [weak self] arrData in
            guard let sSelf = self else { return }
            sSelf.arrData = arrData
            sSelf.tblProfile.reloadData()
        })
    }
}
