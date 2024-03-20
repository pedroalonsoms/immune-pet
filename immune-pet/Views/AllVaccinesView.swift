//
//  AllVaccinesView.swift
//  immune-pet
//
//  Created by Paulina Covarrubias on 20/03/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct AllVaccinesView: View {
    @StateObject var viewModel = AllVaccinesViewModel()
    
    // para hacer las funciones de la base de datos. Fuente: https://youtu.be/t_mypMqSXNw?si=6Kp5JbXVfv2aOboa
    @FirestoreQuery var items: [Vaccine]
    init() {
        self._items = FirestoreQuery(collectionPath: "vaccines")
    }
    
    //---------------------------------------------------------------
    var body: some View {
        NavigationStack {
            VStack() {
                HStack() {
                    Image("dog-paw")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                    Spacer()
                    Image("dog-face")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                }
                .padding(12)
                .background(Color(hex: "#F6A850"))
                .cornerRadius(40)
                Spacer()
                    .frame(height: 30)
                
                ForEach(items) { item in
                    NavigationLink(destination: SingleVaccineView(item: item)) {
                        HStack {
                            Image("row-decorator")
                                .resizable()
                                .scaledToFit()
                                .frame(height:40)
                            Text(item.name)
                                .tint(Color.black)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.title)
                                .foregroundColor(Color(hex: "#F6A850"))
                                .padding(.trailing, 10)
                        }
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 10, x: 3, y: 3)
                    }
                    Spacer()
                        .frame(height: 30)
                }
                
                Spacer()
                Button("ADD NEW"){
                    viewModel.newVaccineView = true
                }
                .padding(10)
                .background(Color(hex: "#F6A850"))
                .tint(Color.white)
                .fontWeight(.bold)
                .cornerRadius(18)
                .font(.system(size: 22))
                .sheet(isPresented: $viewModel.newVaccineView) {
                    NewVaccineView(newVaccineDone: $viewModel.newVaccineView)
                }
            }
            .background(Image("white-bg-pets"))
            .padding(28)
        }
    }
}

#Preview {
    AllVaccinesView()
}
