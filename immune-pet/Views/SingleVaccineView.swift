import SwiftUI

struct SingleVaccineView: View {
    var item: Vaccine
    @State var newDate: Date = Date()
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    @StateObject var viewModel = NewVaccineViewModel()
    
    func formatDate(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
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
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.headline)
                
                
                
                ForEach(item.date, id: \.self) { date in
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(30)
                        .frame(height: 40)
                        .overlay(
                            Text("\(formatDate(Date(timeIntervalSince1970: date)))")
                                .foregroundColor(.black)
                        )
                }
                
                Spacer().frame(height: 50)
                DatePicker("   Next Shot", selection: $newDate, displayedComponents: .date)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.white)
                                        .cornerRadius(30)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hex: "F6A850"))
                
                
                Button(action: {
                    viewModel.addDate(documentID: item.id, newDate: newDate.timeIntervalSince1970)
                }) {
                    Circle()
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 10, x: 3, y: 3)
                        .frame(width: 35, height: 35)
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        )
                }
            }
            .padding(33)
            .background(Color(hex: "F6A850"))
            .background(Image("bg-02"))
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

