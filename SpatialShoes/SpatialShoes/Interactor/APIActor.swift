//
//  APIActor.swift
//  EmpleadosSwiftTesting
//
//  Created by Silvina Roldan on 14/12/24.
//

import Foundation


@globalActor
actor APIActor: Interactor {
    static let shared = APIActor()
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}
