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
    @State var result: Int?
    
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
            Text("Porte:")
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            Button("Cãocular") {
                print("Cãocular")
                result = 23
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: 50)
            .background(.indigo)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .bold()
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
