// © 2019 Ralf Ebert — iOS Example Project: CO2Rechner
// License: https://opensource.org/licenses/MIT

import Foundation

enum Fahrzeugtyp: String, CaseIterable, CustomStringConvertible {

    case benzin
    case diesel

    var multiplier: Decimal {
        let mapping : [Fahrzeugtyp:Decimal] = [
            .benzin: 23.8,
            .diesel: 26.5
        ]
        return mapping[self]!
    }

    var description: String {
        self.rawValue.capitalized
    }
}

struct CO2Rechner {

    var km: Decimal = 100
    var verbrauch: Decimal = 8

    var co2Kg: Decimal {
        self.km * (self.verbrauch * self.fahrzeugTyp.multiplier) / 1000
    }

    var fahrzeugTyp = Fahrzeugtyp.benzin

}
