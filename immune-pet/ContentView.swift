//
//  ContentView.swift
//  immune-pet
//
//  Created by Pedro Alonso Moreno Salcedo on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Welcome to")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top,150)
                    .padding(.leading, -60)
                Text("ImmunePet")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.leading, -60)
                Spacer()
                
                VStack(alignment: .center){
                    Button(action: start){
                        Text("START")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .bold()
                            .padding(.horizontal, 60)
                            .padding(.vertical, 5)                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(Color.orange))
                    }
                }
                .padding(.bottom, 140)
                .padding(.leading, 10)
                
                
                
                
            }
            .padding()
        }
    }
    func start() {
        print("Start button tapped")
    }
}



#Preview {
    ContentView()
}
