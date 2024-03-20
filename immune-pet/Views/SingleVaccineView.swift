//
//  SingleVaccineView.swift
//  immune-pet
//
//  Created by Paulina Covarrubias on 20/03/24.
//

import SwiftUI

struct SingleVaccineView: View {
    var item: Vaccine
    var body: some View {
        
        Text(item.name)
        Text(item.description)
        //para convertir el tiempo: https://medium.com/@edabdallamo/swift-tips-convert-unix-time-epoch-to-date-670987ed29a6
        let new_date = Date(timeIntervalSince1970: item.date)
        Text("\(new_date)")
        
    }
}
