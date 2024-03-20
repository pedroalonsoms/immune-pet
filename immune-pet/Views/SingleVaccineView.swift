//
//  SingleVaccineView.swift
//  immune-pet
//
//  Created by Paulina Covarrubias on 20/03/24.
//

import SwiftUI

struct SingleVaccineView: View {
    var item: Vaccine
    @State var showingBottomSheet = false
    @State var dates: [String] = ["March 13, 2024", "April 16, 2024", "August 21, 2024"]
    
    var body: some View {
        
        VStack {
            Button("Mas") {
                showingBottomSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .sheet(isPresented: $showingBottomSheet) {
            BottomSheetView(dates: $dates)
                .presentationDetents([.medium, .large])
                .presentationBackground(Color(hex: "F6A850"))
        }
    }
}

struct BottomSheetView: View {
    @Binding var dates: [String]
    
    var body: some View {
        VStack(spacing: 10) {
            Text("RABIES VACCINE")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                
            Text("Rabies is a deadly viral disease that affects the cnetral nervous system of mammals, including humans. It is typically transmitted through the bite of an infected animal, most commonly through the saliva of a rabid animal. Once symptoms appear, rabies is almost fatal.")
                .foregroundColor(.white)
            
            Text("NEXT SHOT")
                .fontWeight(.bold)
                .multilineTextAlignment(.trailing)
                .foregroundColor(.white)
                .font(.headline)
            
            ForEach(dates.indices, id: \.self) { index in
                HStack {
                    TextField("Enter date", text: $dates[index])
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                        .cornerRadius(30)
                    Button(action: {
                        // Elimina la fecha correspondiente cuando se presiona el botón de eliminar
                        dates.remove(at: index)
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    }
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
        .padding()
        .background(Color(hex: "F6A850"))
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
