//
//  CheckoutView.swift
//  iDine
//
//  Created by Tara on 2/10/21.
/*
 We have a vertical stack containing one section.
 That section contains a picker, which uses $paymentType for its selection.
 $ is used because it connects to the state somehow...So maybe it has something to do with setting state for that widget?...YES IT DOES: 
 When it comes to referring to some state – for example, telling a state property to change when a toggle switch changes – we can’t refer to the property directly. This is because Swift would think we just want to read the value right now rather than saying “please also update this value as things change.” Fortunately, SwiftUI’s solution is to place a dollar sign before the property name, which lets us refer to the underlying data binding rather than its current value.
 REFERENCE: https://www.hackingwithswift.com/quick-start/swiftui/working-with-state
 Inside the picker we loop over all the payment types and add them as an option.
 The screen has the title “Payment” in small text rather than a large title.
 */

import Foundation
import SwiftUI

struct CheckoutView : View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    let tipAmounts = [10, 15, 20, 25, 0]
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    var body: some View{
        Form {
            Section {
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section {
                Picker("How do you want to pay?", selection: $paymentType.animation() ) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header:
                        Text("TOTAL: $100")
            ) {
                Button(action: {
                    print("Confirm Order tapped!")
                }) {
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .font(.title)
                        Text("Confirm Order")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.blue)
                    .cornerRadius(40)
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
