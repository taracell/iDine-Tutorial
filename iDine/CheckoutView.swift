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
    @State private var pickUpTime = Date()
    @State private var showingPaymentAlert = false

    let tipAmounts = [10, 15, 20, 25, 0]
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
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
            ///Challenge #2 from the Tutorial (modified)
            Section(header: Text("Pick up Time")) {
                    HStack{
                        Image(systemName: "calendar").font(.title)
                    DatePicker("", selection: $pickUpTime,
                        displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                        .font(.title)
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                        .accentColor(.purple)
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
                        Text("TOTAL: \(totalPrice)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            ) {
                ///Challenge # 1 from the Tutorial (modified)
                Button(action: {
                    showingPaymentAlert.toggle()
                    print("Confirm Order tapped!")
                }) {
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .font(.title)
                            .animation(.linear)

                        Text("Confirm Order")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.purple)
                }
            }
        }
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) \n Please pick up your order on \(pickUpTime)\n– thank you!"), dismissButton: .default(Text("OK")))
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
