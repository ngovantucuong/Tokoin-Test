//
//  HeadkinesCell.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import UIKit

class HeadLinesCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var img: UIImageView!
    
    
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Func
    func updataUI(urlImage: String) {
        if let url = URL(string: urlImage) {
            img.load(url: url)
        }
    }
}
