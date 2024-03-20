//
//  SingleVaccineView.swift
//  immune-pet
//
//  Created by Paulina Covarrubias on 20/03/24.
//

import SwiftUI

struct SingleVaccineView: View {
    var item: Vaccine
    @State var dates: [String] = [""]
    
    
    func formatDate(_ date: Double) -> String{
        let new_date = Date(timeIntervalSince1970: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy, hh:mm"
        return formatter.string(from: new_date)
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
                    .frame(height: 40) // Ajusta la altura del Rectangle según sea necesario
                    .overlay(
                        Text("\(formatDate(item.date))") // Llamada a la función para formatear la fecha
                            .foregroundColor(.black)
                        
                    )
                
                ForEach(dates.indices, id: \.self) { index in
                    HStack {
                        TextField("Enter next shot date", text: $dates[index])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.black)
                            .cornerRadius(30)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }
                }
                
                Button(action: {
                    // Agrega una nueva fecha cada vez que se presiona el botón de más
                    dates.append("New Date")
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                }
            }
            .padding(40)
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



