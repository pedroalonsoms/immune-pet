//
//  NewVaccineViewModel.swift
//  immune-pet
//
//  Created by Paulina Covarrubias on 20/03/24.
//

import FirebaseFirestore
import Foundation

class NewVaccineViewModel: ObservableObject{
    @Published var title = ""
    @Published var description = ""
    @Published var date = Date()
    
    init(){
    }
    
    func save(){
        let newId = UUID().uuidString
        let newVaccine = Vaccine(id: newId, name: title, description: description, date: [date.timeIntervalSince1970])
        
        let db = Firestore.firestore()
        db.collection("vaccines")
            .document(newId)
            .setData(["id": newVaccine.id,
                      "name": newVaccine.name,
                      "description":newVaccine.description,
                      "date":newVaccine.date])
    }
    
    func addDate(documentID: String, newDate: TimeInterval){
        let db = Firestore.firestore()
        db.collection("vaccines")
            .document(documentID)
            .updateData(["date":FieldValue.arrayUnion([newDate])])
    }
}
