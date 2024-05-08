//
//  ContentView.swift
//  Caoculadora
//
//  Created by Aurian Moura de Lira on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int?
    @State var months: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos:")
            TextField(
                "Quantos anos completos tem o seu cão?",
                value: $years,
                format: .number
            )
//            .textFieldStyle(.roundedBorder)
//            .keyboardType(.numberPad)
            Text("Meses:")
            TextField(
                "E quanto meses além disso ele tem?",
                value: $months,
                format: .number
            )
//            .textFieldStyle(.roundedBorder)
//            .keyboardType(.numberPad)
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
