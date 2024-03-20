//
//  Vaccine.swift
//  immune-pet
//
//  Created by Paulina Covarrubias on 20/03/24.
//


import Foundation

struct Vaccine:Codable, Identifiable{
    let id: String
    let name: String
    let description: String
    let date: TimeInterval
}
