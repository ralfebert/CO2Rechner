// © 2019 Ralf Ebert — CO2Rechner

import UIKit

class CO2RechnerViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var kmTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func calculate() {
        if let text = kmTextField.text, let km = Double(text), km > 0 {
            let co2Kg = km * 0.1904
            self.resultLabel.text = "CO₂-Emission: \(co2Kg)kg"
        } else {
            self.resultLabel.text = "-"
        }
    }

}
