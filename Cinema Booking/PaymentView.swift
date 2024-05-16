import SwiftUI

struct PaymentView: View {
    let selectedSeat: Int
    @State private var cardNumber: String = ""
    @State private var expirationDate: String = ""
    @State private var cvv: String = ""
    @State private var showingConfirmation = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Payment Page")
                    .font(.title)
                    .padding()

                Text("Selected Seat: \(selectedSeat)")
                    .padding()

                TextField("Card Number", text: $cardNumber)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Expiration Date (MM/YY)", text: $expirationDate)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("CVV", text: $cvv)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Submit Payment") {
                    submitPayment()
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingConfirmation) {
                ConfirmationView(selectedSeat: selectedSeat)
            }
        }
    }

    private func submitPayment() {
        // Here you would integrate with a payment processing API
        // For now, we'll simulate a successful payment
        self.showingConfirmation = true
    }
}
