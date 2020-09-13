//
//  DetailViewController.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblLink: UILabel!
    
    // MARK: - Properties
    private let detailPresenter = DetailPresenter()
    var dataNews: Articles?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI(artice: dataNews)
    }
    
    // MARK: - Private funcion
    private func setupUI() {
        title = "Detail News"
        lblLink.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didOpenOriginNews(_:))))
    }
    
    @objc func didOpenOriginNews(_ sender: UITapGestureRecognizer) {
        detailPresenter.openUrl(urlString: lblLink.text ?? "")
    }
    
    // MARK: - Public funcion
    func updateUI(artice: Articles?) {
        lblTitle.text = artice?.title ?? ""
        lblDescription.text = artice?.description ?? ""
        lblLink.text = artice?.url ?? ""
        lblContent.text = artice?.content ?? ""
        if let url = URL(string: artice?.urlToImage ?? "") {
            imgAvatar.load(url: url)
        }
    }
    
}
