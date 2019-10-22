// © 2019 Ralf Ebert — CO2Rechner

import UIKit

class CO2RechnerViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var fahrzeugTypSegmentedControl: UISegmentedControl!
    @IBOutlet var verbrauchTextField: UITextField!
    @IBOutlet var kmTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func calculate() {

        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        
        let multiplier: Decimal
        switch self.fahrzeugTypSegmentedControl.selectedSegmentIndex {
            case 0: // Benzin
                multiplier = 23.8
            case 1: // Diesel
                multiplier = 26.5
            default:
                fatalError("Invalid fahrzeugTypSegmentedControl.selectedSegmentIndex")
        }

        if let km = formatter.number(from: kmTextField.text ?? "")?.decimalValue, let verbrauch = formatter.number(from: verbrauchTextField.text ?? "")?.decimalValue {
            let co2Kg = km * (verbrauch * multiplier) / 1000
            self.resultLabel.text = "CO₂-Emission: \(formatter.string(for: co2Kg)!)kg"
        } else {
            self.resultLabel.text = "-"
        }
    }

}
