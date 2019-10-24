// © 2019 Ralf Ebert — iOS Example Project: CO2Rechner
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CO2RechnerView: View {

    @State var rechner = CO2Rechner()

    var body: some View {

        VStack {

            HStack {
                Text("Fahrzeugtyp:")

                Picker("Fahrzeugtyp", selection: $rechner.fahrzeugTyp) {
                    ForEach(Fahrzeugtyp.allCases, id: \.self) { typ in
                        Text(typ.description)
                            .tag(typ)
                    }

                }.pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top, 20)

            HStack {
                Text("Strecke:")
                TextField("", value: $rechner.km, formatter: self.numberFormatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("km")
            }

            HStack {
                Text("Verbrauch:")
                TextField("", value: $rechner.verbrauch, formatter: self.numberFormatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("l/100km")
            }

            Text("CO₂-Emission: \(numberFormatter.string(for: rechner.co2Kg)!)kg")
                .padding(.top, 40)

            Spacer()
        }
        .padding(15)

    }

    var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        return formatter
    }()

}

struct CO2RechnerView_Previews: PreviewProvider {
    static var previews: some View {
        CO2RechnerView()
    }
}
