//
//  CryptoOrdersScreen.swift
//  SecondApp
//
//  Created by Artsiom Sazonau on 28.02.21.
//

import SwiftUI
import Crypto
import UIComponents

extension Order: Identifiable {
    public var id: String {
        createdOn!.description
    }
}

struct CryptoOrdersScreen: View {
    
    @ObservedObject var cryptoViewModel: CryptoViewModel
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            List {
                Section(header: Text("Hi")) {
                    ForEach(cryptoViewModel.cryptoOrders.flatMap({$0.results!})) { order in
                        NavPushButton(destination: LazyView(CryptoOrdersScreenDetail(depositAddress: order.depositAddress!))) {
                            
                            CryptoOrdersScreenCell()
                                .onAppear {
                                    if cryptoViewModel.cryptoOrders.flatMap({$0.results!}).isLast(order) {
                                        cryptoViewModel.getOrders()
                                    }
                                }
                        }
                    }
                }
            }
            .navigationTitle("Crypto")
            .onAppear {
                cryptoViewModel.getOrders()
            }
        }
    }
}

struct CryptoOrdersScreenDetail: View {
    
    var depositAddress: Address
    
    var body: some View {
        VStack {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .font(.largeTitle)
            }
            Text("type:")
            Text(depositAddress.type!)
            Text("name:")
            Text(depositAddress.name!)
            Text("address:")
            Text(depositAddress.address!)
            Text("currencyCode:")
            Text(depositAddress.currencyCode!)
        }
    }

}

struct CryptoOrdersScreenCell: View {
    
    var body: some View {
        Image(systemName: "envelope.fill")
    }
    
}


struct CryptoOrdersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CryptoOrdersScreen(cryptoViewModel: CryptoViewModel())
    }
}
