//
//  Porte.swift
//  Caoculadora
//
//  Created by Aurian Moura de Lira on 13/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case pequeno = "Pequeno"
    case medio = "Médio"
    case grande = "Grande"
    
    func calcularIdade(deAnos anosCaninos: Int,
                       eMeses mesesCaninos: Int) -> Int {
        var multiplicador: Int = 0
        switch self {
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        let result = anosCaninos * multiplicador + mesesCaninos * multiplicador/12
        return result
    }
}

