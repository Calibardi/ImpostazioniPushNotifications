//
//  DataModel.swift
//  ImpostazioniPushNotifications
//
//  Created by Lorenzo Ilardi on 12/10/2020.
//

import Foundation

struct generalModelStruct {
    var name: String? = "nil"
    var id: Int
    var onNotifications: Bool = false
    var treshold: Int = 1
}

//Singleton pattern
public class dataModel {
    var stores = [generalModelStruct]()
    var reparti = [generalModelStruct]()
    
    static var sharedData = dataModel()
    
    private init(){
        self.stores = [generalModelStruct(name: "Sephora", id: 00),
                  generalModelStruct(name: "Gamestop", id: 01),
                  generalModelStruct(name: "Zara", id: 02),
                  generalModelStruct(name: "Apple", id: 03)]
        
        self.reparti = [generalModelStruct(name: "Reparto Surgelati", id: 1010),
                   generalModelStruct(name: "Reparto Frutta", id: 94902),
                   generalModelStruct(name: "Reparto Bio", id: 3455),
                   generalModelStruct(name: "Reparto Igiene", id: 2145)]
    }
}

