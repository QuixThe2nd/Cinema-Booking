import SwiftUI

struct MovieSelectionView: View {
    @State private var selectedMovie: String = "Interstellar"
    @State private var selectedDate: Date = Date()
    @State private var selectedTime: String = "7:00 PM"

    let movies = ["Interstellar", "Inception", "The Dark Knight", "Tenet", "Dunkirk"]
    let times = ["1:00 PM", "4:00 PM", "7:00 PM", "10:00 PM"]

    @State private var isShowingSeatSelectionView = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select a Movie")) {
                    Picker("Movie", selection: $selectedMovie) {
                        ForEach(movies, id: \.self) {
                            Text($0)
                        }
                    }

                    Image(selectedMovie)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }

                Section(header: Text("Select Date")) {
                    DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }

                Section(header: Text("Select Time")) {
                    Picker("Time", selection: $selectedTime) {
                        ForEach(times, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Button(action: {
                    isShowingSeatSelectionView = true
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .sheet(isPresented: $isShowingSeatSelectionView) {
                    SeatSelectionView()
                }
            }
            .navigationBarTitle("Book Your Movie", displayMode: .inline)
        }
    }
}
