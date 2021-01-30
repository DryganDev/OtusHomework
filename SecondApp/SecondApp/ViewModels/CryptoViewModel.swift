//
//  CryptoViewModel.swift
//  SecondApp
//
//  Created by Artsiom Sazonau on 3.03.21.
//

import Foundation
import Crypto

class CryptoViewModel: ObservableObject {
    
    var page: Int = 0
    @Published var cryptoOrders: [OrderList] = []
    @Published private(set) var isPageLoading: Bool = false
    
    func getOrders() {
        guard !isPageLoading else {
            return
        }
        isPageLoading = true
        page += 1
        
        Crypto.OrdersAPI.getOrders(page: page, pageSize: 2, pair: "BTCETH", status: 11) { [weak self] list, error in
            if error == nil {
                self?.cryptoOrders.append(list!)
            }
            self?.isPageLoading = false
        }
    }
    
    func clear() {
        page = 0
        isPageLoading = false
        cryptoOrders = []
    }
    
}
