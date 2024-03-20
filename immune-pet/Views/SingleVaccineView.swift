import SwiftUI

struct SingleVaccineView: View {
    var item: Vaccine
    @State var dates: [Date] = [Date()]
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    
    func formatDate(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy, hh:mm"
        return formatter.string(from: date)
    }
    
    var body: some View {
        ZStack{
            Color(hex:"F6A850")
                .ignoresSafeArea()
            VStack(spacing: 10) {
                Text(item.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(item.description)
                    .foregroundColor(.white)
                
                Text("NEXT SHOT")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.white)
                    .font(.headline)
                
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(30)
                    .frame(height: 40) // Adjust the height of the Rectangle as needed
                    .overlay(
                        Text("\(formatDate(selectedDate))") // Call to the function to format the date
                            .foregroundColor(.black)
                        
                    )
                
                ForEach(dates.indices, id: \.self) { index in
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(30)
                }
                
                Button(action: {
                    // Adds a new date every time the plus button is pressed
                    dates.append(Date())
                }) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 35, height: 35)
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        )
                }
            }
            .padding()
            .background(Color(hex: "F6A850"))
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#", into: nil)
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xF6A850) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
