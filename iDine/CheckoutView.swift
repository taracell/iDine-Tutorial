//
//  CheckoutView.swift
//  iDine
//
//  Created by Tara on 2/10/21.
/*
 We have a vertical stack containing one section.
 That section contains a picker, which uses $paymentType for its selection.
 Inside the picker we loop over all the payment types and add them as an option.
 The screen has the title “Payment” in small text rather than a large title.
 */

import Foundation
import SwiftUI

struct CheckoutView : View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    var body: some View{
        VStack {
            Section {
                Picker("How do you want to pay?", selection: $paymentType ) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }


}

#if DEBUG
struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
#endif
