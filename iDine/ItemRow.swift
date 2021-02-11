//
//  ItemRow.swift
//  iDine
//
//  Created by Tara on 2/9/21.
//  View for each item row.  Row is used because it shows  information across and VStack is used to show contents vertically.  HStack display Horozontally...Very similar to JavaFX

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle()) 
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$\(item.price)")
            }
            //vstack
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
            //end ForEach
            NavigationLink(destination: ItemRow(item: item)) {
                // existing contents…
            }
        }
        //hstack
    }
    //view
}
//view

#if DEBUG
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
#endif
