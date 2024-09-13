//
//  ShoesViewModel.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 07/08/2024.
//

import SwiftData
import SwiftUI

@Observable
final class ShoesViewModel {
    
    let interactor: DataInteractor

    var shoes: [ShoeModel]
    var showAlert = false
    var selectedShoe: ShoeModel?

    @ObservationIgnored var errorMsg = ""

    init(interactor: DataInteractor = Interactor()) {
        self.interactor = interactor
        do {
            self.shoes = try interactor.getShoes()
        } catch {
            self.shoes = []
            self.errorMsg = "Error en la carga del JSON \(error.localizedDescription)"
            showAlert.toggle()
        }
    }
}
