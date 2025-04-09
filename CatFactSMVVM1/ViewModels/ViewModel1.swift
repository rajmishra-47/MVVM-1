//
//  ViewModel1.swift
//  CatFactSMVVM1
//
//  Created by Rajnandan Mishra on 09/04/25.
//

import Foundation

import Combine

class ViewModel1:ObservableObject{
    
    @Published var md:CatFacts?=CatFacts(fact:"", length:0)
    
    func getData() async{
        
        guard let url=URL(string:"https://catfact.ninja/fact")else{
            
            print("Incorrect URL")
            return
        }

        do{
            
            let(data,_)=try await URLSession.shared.data(from:url)
            self.md = try JSONDecoder().decode(CatFacts.self, from: data)
                    
        }
        catch{
            print("Error Occured \(error.localizedDescription)")
            return
        }
        
    }
    
}
