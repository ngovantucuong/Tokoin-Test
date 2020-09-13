//
//  CategoryPresenter.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import Foundation

// MARK: - Protocol
protocol CategoryPresenterDelegate: class {
    func didReturnDataSearch(news: [Articles])
}

class CategoryPresenter {
    
    // MARK: - Properties
    weak private var categoryPresenterDelegate : CategoryPresenterDelegate!
    
    // MARK: - Func
    func didGetDataBitCoinNews(news: [Articles]) {
        didFilterData(news: news, keywordFilter: "bitcoin")
    }
    
    func didGetDataEarthquakeNews(news: [Articles]) {
        didFilterData(news: news, keywordFilter: "earthquake")
    }
    
    func didGetDataAppleNews(news: [Articles]) {
        didFilterData(news: news, keywordFilter: "apple")
    }
    
    func didGetDataAnimalNews(news: [Articles]) {
        didFilterData(news: news, keywordFilter: "animal")
    }
    
    func setViewDelegate(categoryPresenterDelegate: CategoryPresenterDelegate) {
        self.categoryPresenterDelegate = categoryPresenterDelegate
    }
    
    func didFilterData(news: [Articles], keywordFilter: String) {
        let arrData = news.filter { (artice) -> Bool in
            let content = artice.content ?? ""
            if content.lowercased().contains(keywordFilter) {
                return true
            }
            return false
        }
        categoryPresenterDelegate.didReturnDataSearch(news: arrData)
    }
}
