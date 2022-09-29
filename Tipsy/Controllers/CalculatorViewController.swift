
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var totalBrain = TotalBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            billTextField.endEditing(true)
        } else if sender.currentTitle == "10%" {
            tenPctButton.isSelected = true
            billTextField.endEditing(true)
        } else if sender.currentTitle == "20%" {
            twentyPctButton.isSelected = true
            billTextField.endEditing(true)
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text!)
        let splitNumber = Float(splitNumberLabel.text!)
        
        if zeroPctButton.isSelected == true {
            totalBrain.calculateTip(bill: bill ?? 123.56, pct: 0, splitNumber: splitNumber!)
        } else if tenPctButton.isSelected == true {
            totalBrain.calculateTip(bill: bill ?? 123.56, pct: 10, splitNumber: splitNumber!)
        } else if twentyPctButton.isSelected == true {
            totalBrain.calculateTip(bill: bill ?? 123.56, pct: 20, splitNumber: splitNumber!)
        }
        
        performSegue(withIdentifier: "PresentModally", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentModally" {
            let destination = segue.destination as! ResultsViewController
            destination.total = totalBrain.getTotal()
            destination.numberOfPeople = totalBrain.getNumberOfPeople()
            destination.tipPercentage = totalBrain.getTipPercentage()
        }
    }
}

