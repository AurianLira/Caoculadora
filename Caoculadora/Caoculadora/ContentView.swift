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
    
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porteSelecionado = "Pequeno"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
//            Spacer()
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
//            Spacer()
            Text("Porte:")
            
            Picker("Portes", selection: $porteSelecionado) {
                ForEach(portes, id:\.self) { porte
                    in Text(porte)
                }
            }.pickerStyle(.segmented)
            
            Divider()
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 150)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .shadow(radius: 20)
            }
            
            Spacer()
            
            Button("Cãocular", action: processYears)
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
    
    func processYears() {
        print("Cãocular")
        guard let years, let months else {
            print("Campos não preenchidos")
            return
        }
        guard months > 0 || years > 0 else {
            print("Ao menos um campo deve ser maior que zero")
            return
        }
    
        var multiplicador: Int = 0
        switch porteSelecionado {
        case "Pequeno":
            multiplicador = 6
        case "Médio":
            multiplicador = 7
        case "Grande":
            multiplicador = 8
        default:
            multiplicador = 0
        }
        result = years * multiplicador + months * multiplicador/12
    }
}

#Preview {
    ContentView()
}
