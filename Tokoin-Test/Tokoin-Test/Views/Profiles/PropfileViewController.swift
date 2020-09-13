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
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private func
    private func setupUI() {
        btnRegister.layer.cornerRadius = 8
        btnRegister.addTarget(self, action: #selector(didRegister(_:)), for: .touchUpInside)
    }
    
    @objc func didRegister(_ sender: UIButton) {
        print("asdadas", txtName.text)
    }
    
    // MARK: - Public func
    
    
}

 // MARK: - Public func
extension PropfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
