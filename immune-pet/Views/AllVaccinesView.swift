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
        // para la lista de las vaccines: https://www.hackingwithswift.com/articles/216/complete-guide-to-navigationview-in-swiftui
        NavigationStack{
                List(items){
                    item in NavigationLink(destination: SingleVaccineView(item: item)){
                        Text(item.name)}
                }
            .navigationTitle("My pet's vaccines")
        }
        Button("New Vaccine"){
            viewModel.newVaccineView = true
        }
        
        // info de esto aquí: https://developer.apple.com/documentation/swiftui/view/sheet(ispresented:ondismiss:content:) (video)
        .sheet(isPresented: $viewModel.newVaccineView) {
            NewVaccineView(newVaccineDone: $viewModel.newVaccineView)
        }
    }
}
