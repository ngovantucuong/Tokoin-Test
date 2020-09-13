//
//  DetailPresenter.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import UIKit

class DetailPresenter {
    
    // MARK: - Public funcion
    func openUrl(urlString: String!) {
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
