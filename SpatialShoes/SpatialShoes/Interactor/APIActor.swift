//
//  APIActor.swift
//  EmpleadosSwiftTesting
//
//  Created by Julio César Fernández Muñoz on 13/12/24.
//

import Foundation

@globalActor
actor APIActor: DataInteractor {
    static let shared = APIActor()
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}
