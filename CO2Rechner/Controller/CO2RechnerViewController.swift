// © 2019 Ralf Ebert — CO2Rechner

import UIKit

class CO2RechnerViewController: UIViewController {

    // MARK: - State

    var rechner = CO2Rechner() {
        didSet {
            self.updateView()
        }
    }

    // MARK: - Outlets

    @IBOutlet var fahrzeugTypSegmentedControl: UISegmentedControl!
    @IBOutlet var verbrauchTextField: UITextField!
    @IBOutlet var kmTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateView()
    }

    func updateView() {
        self.fahrzeugTypSegmentedControl.segmentTitles = Fahrzeugtyp.allCases.map { $0.description }
        self.fahrzeugTypSegmentedControl.selectedSegmentIndex = Fahrzeugtyp.allCases.firstIndex(of: self.rechner.fahrzeugTyp)!
        self.kmTextField.text = self.numberFormatter.string(for: self.rechner.km)!
        self.verbrauchTextField.text = self.numberFormatter.string(for: self.rechner.verbrauch)!
        self.resultLabel.text = "CO₂-Emission: \(self.numberFormatter.string(for: self.rechner.co2Kg)!)kg"
    }

    // MARK: - Actions

    @IBAction func fahrzeugTypChanged(_: Any) {
        self.rechner.fahrzeugTyp = Fahrzeugtyp.allCases[self.fahrzeugTypSegmentedControl.selectedSegmentIndex]
    }

    @IBAction func verbrauchChanged() {
        if let value = parseDecimalText(verbrauchTextField.text) {
            self.rechner.verbrauch = value
        }
    }

    @IBAction func kmChanged() {
        if let value = parseDecimalText(kmTextField.text) {
            self.rechner.km = value
        }
    }

    // MARK: - Formatting

    private var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        return formatter
    }()

    func parseDecimalText(_ value: String?) -> Decimal? {
        self.numberFormatter.number(from: value ?? "")?.decimalValue
    }

}
