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
                Text("ImmunePet")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                
                Button(action: start){
                    Text("Start")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom,140)
                    
                }
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
