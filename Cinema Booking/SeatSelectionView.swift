import SwiftUI

struct SeatSelectionView: View {
    @State private var selectedSeat: Int?
    @State private var isSeatSelected = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Seat Selection")
                    .font(.title)
                    .padding()

                VStack {
                    ForEach(0..<5) { row in
                        HStack {
                            ForEach(0..<8) { column in
                                Button(action: {
                                    selectedSeat = row * 8 + column + 1
                                    isSeatSelected = true
                                }) {
                                    Text("\(row * 8 + column + 1)")
                                        .padding(5)
                                        .background(isSeatSelected && selectedSeat == (row * 8 + column + 1) ? Color.green : (Int.random(in: 0...3) == 2 ? Color.red : Color.blue))
                                        .foregroundColor(.white)
                                        .cornerRadius(5)
                                }
                                .padding(5)
                                .sheet(isPresented: $isSeatSelected) {
                                    PaymentView(selectedSeat: selectedSeat ?? 0)
                                }
                            }
                        }
                    }
                }

                Spacer()
            }
            .navigationBarTitle("Seat Selection", displayMode: .inline)
        }
    }
}
