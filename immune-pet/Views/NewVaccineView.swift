//
//  NewVaccineView.swift
//  immune-pet
//
//  Created by Paulina Covarrubias on 20/03/24.
//

import SwiftUI
struct NewVaccineView: View {
    @StateObject var viewModel = NewVaccineViewModel()
    @Binding var newVaccineDone: Bool
    
    var body: some View {
        VStack(alignment: .center){
            Form{
                TextField("Name", text: $viewModel.title)
                TextField("Description", text: $viewModel.description)
                DatePicker("Date to be administered", selection: $viewModel.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .accentColor(.orange)
                // botón para guardar cambios
                Button(action:{
                    viewModel.save() // llamamos a la función de save (ver NewVaccineViewModel)
                    newVaccineDone = false
                })
                {
                    VStack(alignment: .center){
                        Text("ADD")
                            .foregroundColor(.white)
                            .padding(5) // para darle espacio al texto
                    }
                    .background(Color.orange)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/) // default redondear esquinas
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/) // para centrarlo y que ocupe todo el espacio ... https://sarunw.com/posts/how-to-make-swiftui-view-fill-container-width-and-height/
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
            .scrollContentBackground(.hidden) //para que el fondo se aplicara: https://stackoverflow.com/questions/57254461/how-to-change-the-background-color-for-a-form-in-swiftui#:~:text=You%20can%20use%20UITableView.,s%20background%20color%20to%20red.
            .padding()
            .background(Image("fondo")
                .resizable()) //para la imagen usé esto: https://stackoverflow.com/questions/59102889/how-to-add-background-image-to-complete-view-in-swiftui
        }
    }
}
