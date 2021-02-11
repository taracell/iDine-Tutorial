//
//  iDineApp.swift
//  iDine
//
//  Created by Tara on 2/9/21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(order)
        }
    }
}
