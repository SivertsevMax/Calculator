import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    var currentInput: Double {
        get {
            Double(displayResultLabel.text!)!
        }
        set {
            displayResultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    @IBAction func numberPresed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if stillTyping {
            if (displayResultLabel.text?.count)! < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
            }
        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        switch operationSign {
        case "+":
            displayResultLabel.text = String(firstOperand + secondOperand)
        case "-":
            displayResultLabel.text = String(firstOperand - secondOperand)
        case "×":
            displayResultLabel.text = String(firstOperand * secondOperand)
        case "÷":
            displayResultLabel.text = String(firstOperand / secondOperand)
        default:
            displayResultLabel.text = "ERROR"
        }
        stillTyping = false
    }
    
    @IBAction func deleteValue(_ sender: UIButton) {
        firstOperand = 0
        displayResultLabel.text = "0"
        stillTyping = false
    }
    
    @IBAction func percent(_ sender: Any) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        switch operationSign {
        case "+":
            displayResultLabel.text = String(firstOperand + (firstOperand / 100 * secondOperand))
        case "-":
            displayResultLabel.text = String(firstOperand - (firstOperand / 100 * secondOperand))
        case "×":
            displayResultLabel.text = String(firstOperand)
        case "÷":
            displayResultLabel.text = String(firstOperand)
        default:
            displayResultLabel.text = "ERROR"
        }
        stillTyping = false
    }
    
    
    
    
}

