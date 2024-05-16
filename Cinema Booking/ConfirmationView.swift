import SwiftUI

struct ConfirmationView: View {
    let selectedSeat: Int
    let ticketNumber: String
    @State private var qrCodeImage: Image?

    init(selectedSeat: Int) {
        self.selectedSeat = selectedSeat
        self.ticketNumber = "TKT-\(Int.random(in: 100000...999999))"
        self._qrCodeImage = State(initialValue: ConfirmationView.generateQRCode(from: "\(ticketNumber)"))
    }

    var body: some View {
        VStack {
            Text("Thank You!")
                .font(.largeTitle)
                .padding()

            Text("Your payment has been successfully processed.")
                .padding()

            Text("Seat Number: \(selectedSeat)")
                .padding()

            Text("Ticket Number: \(ticketNumber)")
                .padding()

            qrCodeImage?
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()

            Spacer()
        }
    }

    private static func generateQRCode(from string: String) -> Image {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        let transform = CGAffineTransform(scaleX: 10, y: 10)

        if let outputImage = filter.outputImage?.transformed(by: transform),
           let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return Image(uiImage: UIImage(cgImage: cgimg))
        }

        return Image(systemName: "xmark.circle")
    }
}
