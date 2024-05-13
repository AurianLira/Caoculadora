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
    @State var porteSelected = Porte.pequeno
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
//            Spacer()
            Text("Qual a idade do seu cão?")
                .font(.header5)
            Text("Anos:")
                .font(.body1)
            TextField(
                "Quantos anos completos tem o seu cão?",
                value: $years,
                format: .number
            )

            Text("Meses:")
                .font(.body1)
            TextField(
                "E quanto meses além disso ele tem?",
                value: $months,
                format: .number
            )

            Text("Porte:")
                .font(.body1)
            
            Picker("Portes", selection: $porteSelected) {
                ForEach(Porte.allCases, id:\.self) { porte
                    in Text(porte.rawValue)
                }
            }.pickerStyle(.segmented)
            
            Divider()
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .font(.body1)
                Text("\(result) anos")
                    .font(.display)
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
            .font(.body1)
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
        switch porteSelected {
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        result = years * multiplicador + months * multiplicador/12
    }
}

#Preview {
    ContentView()
}
