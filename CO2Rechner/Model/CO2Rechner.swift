// © 2019 Ralf Ebert — CO2Rechner

import Foundation

enum Fahrzeugtyp: String, CaseIterable, CustomStringConvertible {

    case benzin
    case diesel

    var multiplier: Decimal {
        switch self {
            case .benzin:
                return 23.8
            case .diesel:
                return 26.5
        }
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
