import SwiftUI

struct NewVaccineView: View {
    @StateObject var viewModel = NewVaccineViewModel()
    @Binding var newVaccineDone: Bool
    
    var body: some View {
        VStack(alignment: .center){
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
            .padding(10)
            .background(Color(hex: "#F6A850"))
            .cornerRadius(30)
            .padding(.top, 10) // Adjust top padding
            
            Form{
                // Name
                Section(header: Text("Vaccine Name")) {
                    TextField("", text: $viewModel.title)
                }
                .font(.system(size: 20))
                .foregroundColor(.black)
                .bold()
                .padding(.horizontal, -20)
                
                // Description
                Section(header: Text("Description")) {
                    TextField("", text: $viewModel.description)
                }
                .font(.system(size: 20))
                .foregroundColor(.black)
                .bold()
                .padding(.horizontal, -20)
                
                // Calendar
                Section {
                    DatePicker("Date to be administered", selection: $viewModel.date, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(.orange)
                }
                // Button to save changes
                .padding(.top,0)
            }
            .background(Color(hex: "#F6A850"))
            .cornerRadius(20)
            .scrollContentBackground(.hidden)
            .padding()
            
            
            Button(action:{
                viewModel.save()
                newVaccineDone = false
            }) {
                Text("ADD")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.horizontal, 50)
                    .padding(.vertical, 2)
                    .background(RoundedRectangle(cornerRadius: 40)
                                    .fill(Color.orange))
            }
            .background(Color(hex: "#F6A850"))
            .cornerRadius(20)
            .font(.title)
        }
        .background(
            Image("fondo")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all) // Make the image cover the entire screen
        )
    }
}

struct NewVaccineView_Previews: PreviewProvider {
    static var previews: some View {
        NewVaccineView(newVaccineDone: .constant(false))
    }
}
