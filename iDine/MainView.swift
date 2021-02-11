//
//  MainView.swift
//  iDine
//
//  Created by Tara on 2/10/21.
//this screen shows the BottomNavBar in  dart.  Swift calls it the TabView...Now for upper tabs, maybe use the same function?

import Foundation
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem { Label("Order", systemImage: "square.and.pencil") }
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
#endif
