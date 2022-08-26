//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Yuri Gerasimchuk on 07.06.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = SharedOrder()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(SharedOrder.types.indices, id: \.self) {
                            Text(SharedOrder.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20 )
                        .accessibilityElement()
                        .accessibilityLabel("Number of cakes")
                        .accessibilityValue(String(order.quantity))
                        .accessibilityAdjustableAction { direction in
                            switch direction {
                            case .increment:
                                order.quantity += 1
                            case .decrement:
                                order.quantity -= 1
                            default:
                                print("Not handled")
                            }
                        }
                }
                
                Section {
                    Toggle("Any special request?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
