//
//  ItemDetail.swift
//  iDine
//
//  Created by Tara on 2/10/21.
//

import Foundation
import SwiftUI



struct ItemDetail: View {
    @EnvironmentObject var order: Order
    let  item: MenuItem
    var  body: some  View {
        VStack{
            ZStack (alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text("Photo:\(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            //ZStack
            Text(item.description).padding()
            Button("Order This") {
                order.add(item: item)
            }
            .font(.headline)
            Spacer()
        }
        //VStack
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    //View
}
//View

#if DEBUG
struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
#endif
