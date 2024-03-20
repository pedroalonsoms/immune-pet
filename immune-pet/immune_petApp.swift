//
//  immune_petApp.swift
//  immune-pet
//
//  Created by Pedro Alonso Moreno Salcedo on 19/03/24.
//

import FirebaseCore
import SwiftUI

@main
struct immune_petApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            AllVaccinesView()
        }
    }
}
