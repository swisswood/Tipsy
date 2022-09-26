
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
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
       
        if zeroPctButton.isSelected == true {
            print(bill! * 1.0 / Float(splitNumberLabel.text!)!)
        } else if tenPctButton.isSelected == true {
            print(bill! * 1.1 / Float(splitNumberLabel.text!)!)
        } else {
            print(bill! * 1.2 / Float(splitNumberLabel.text!)!)
        }
        
        
    }
    

}

