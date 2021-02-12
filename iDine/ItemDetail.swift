//
//  ItemDetail.swift
//  iDine
//
//  Created by Tara on 2/10/21.
//  Detialed item screen that allows for ordering of the food items and then reverts back to main menu once the order this is pressed or the back button is pressed

import Foundation
import SwiftUI



struct ItemDetail: View {
    ///get the global variable Order
    @EnvironmentObject var order: Order
    ///make the navigagion pop this screen
    @Environment(\.presentationMode) var presentationMode

    
    let  item: MenuItem
    var  body: some  View {
        VStack{
            ///stacks items and allows for layering
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
            }///ZStack
            Text(item.description).padding()
            
                Button(action: {
                    order.add(item: item)
                    ///Make Order This button go to MainView...essentially navigation.pop() from Dart
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Order This!")
                        .font(.largeTitle)
                        .fontWeight(.regular)
                        .foregroundColor(.blue)
                }
            
            
            
            .navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        //View
    }
    //View
}

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
