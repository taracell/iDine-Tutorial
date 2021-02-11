//
//  OrderView.swift
//  iDine
//
//  Created by Tara on 2/10/21.
//  This screen shows the order placed by the user
//  This has a list with two sections almost like a column with a list in Dart.  Transferring from Dart or javaFX The Navigation View shows 

import Foundation
import SwiftUI

struct OrderView : View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text (item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                Section {
                    NavigationLink(
                        destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
        }
    }
}
    
struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
