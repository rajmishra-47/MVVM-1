//
//  ContentView.swift
//  CatFactSMVVM1
//
//  Created by Rajnandan Mishra on 09/04/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var VM=ViewModel1()
    
    var body: some View {
        VStack {
            
            if let mData=VM.md{
                
                Text("\(mData.fact)")
                Text("\(mData.length)")
            }
            
            
            Text("Hello from Apple to Raj").font(.largeTitle)
            
            Button("Next"){
                Task{
                    await VM.getData()
                }
            }.buttonStyle(.borderedProminent)
            
            
        }
        .padding().task{
            await  VM.getData()
        }
    }
}

//#Preview {
//    ContentView()
//}
    
