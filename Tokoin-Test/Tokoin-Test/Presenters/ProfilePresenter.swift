//
//  ProfilePresenter.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import Foundation

// MARK: - Protocol
protocol ProfilePresenterDelegate: class {
    func didGetDataLocal()
}

class ProfilePresenter {
    // MARK: - Properties
    weak private var delegate: ProfilePresenterDelegate!
    
    // MARK: - Func
    func setDelegate(delegate: ProfilePresenterDelegate) {
        self.delegate = delegate
    }
    
    func didSaveDataLocal(name: String, address: String, phone:String) {
        let modelObj = UserRealm(name: name, address: address, phone: phone)
        DBManager.shared.addUser(with: modelObj, complete: { [weak self] isSaveSucess in
            guard let sSelf = self else { return }
            if isSaveSucess {
                sSelf.delegate.didGetDataLocal()
            }
        })
    }
}
