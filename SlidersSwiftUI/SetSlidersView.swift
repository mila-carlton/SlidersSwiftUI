//
//  SetSlidersView.swift
//  SlidersSwiftUI
//
//  Created by PASGON TEXTILE on 16.12.23.
//

import SwiftUI

struct SetSlidersView: View {
    @Binding var tfValue: String
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(Int(value))")
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: value) {
                    newValue in
                    tfValue = "\(Int(newValue))"
                }
                  
            TextField("", text: $tfValue, onCommit: {
                if let newValue = Double(tfValue) {
                    value = newValue
                }
            })
            .textFieldStyle(.roundedBorder)
            .frame(width: 70)
            .onAppear(perform: {
                tfValue = "\(Int(value))"
            })
            
        }
    }
}

#Preview {
    SetSlidersView(tfValue: .constant("30"), value: .constant(30), color: .red)
}
