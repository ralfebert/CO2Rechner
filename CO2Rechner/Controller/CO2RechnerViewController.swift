import UIKit

class CO2RechnerViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var kmTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func calculate() {
        let km = Double(kmTextField.text!)!
        let co2Kg = km * 0.1904
        resultLabel.text = "CO2-Emission: \(co2Kg)kg"
    }
    
}
