
import SwiftUI

struct SlidersView: View {
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    @State private var alertPresented = false
    @State private var redTF = ""
    @State private var greenTF = ""
    @State private var blueTF = ""
    
    var body: some View {
        VStack(spacing: 25) {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 300, height: 200)
                .foregroundStyle(Color(red: redValue/255, green: greenValue/255, blue: blueValue/255))
                .padding(35)
            SetSlidersView(tfValue: $redTF, value: $redValue, color: .red)
            SetSlidersView(tfValue: $greenTF, value: $greenValue, color: .green)
            SetSlidersView(tfValue: $blueTF, value: $blueValue, color: .blue)
            Spacer()
            Button("Done") {
                updateSliders()
            }
            .padding(70)
            .alert("Enter number between 0 and 255", isPresented: $alertPresented) {
                Text("OK")
            }
        }
    }
    
    private func updateSliders() {
        if
            validateTF(redTF) &&
                validateTF(greenTF) &&
                validateTF(blueTF) {
            if let redDouble = Double(redTF),
               let greenDouble = Double(greenTF),
               let blueDouble = Double(blueTF) {
                redValue = redDouble
                greenValue = greenDouble
                blueValue = blueDouble
            } else {
                alertPresented = true
            }
        } else {
            alertPresented = true
        }
    }
    private func validateTF(_ value: String) -> Bool {
        if let intValue = Int(value),
           (0...255).contains(intValue) {
            return true
        } else {
            return false
        }
    }
}

#Preview {
    SlidersView()
}


