import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: [UIButton]!
    
    override func viewDidLoad() {
        button.forEach { (button) in
            button.layer.cornerRadius = button.frame.size.height / 2
        }
    }
    
    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var dotAdded = false
    
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            
            if  valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
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
        dotAdded = false
    }
    
    func resultOfOperation(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        switch operationSign {
        case "+":
            resultOfOperation{$0 + $1}
        case "-":
            resultOfOperation{$0 - $1}
        case "×":
            resultOfOperation{$0 * $1}
        case "÷":
            resultOfOperation{$0 / $1}
        default:
            displayResultLabel.text = "ERROR"
        }
        stillTyping = false
        dotAdded = false
    }
    
    @IBAction func deleteValue(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        operationSign = ""
        dotAdded = false
    }
    
    @IBAction func plusOrMinus(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percent(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
        stillTyping = false
        dotAdded = false
    }
    
    @IBAction func addDot(_ sender: UIButton) {
        if !dotAdded && stillTyping {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotAdded = true
        } else if !dotAdded && !stillTyping {
            displayResultLabel.text = "0."
            dotAdded = true
        }
    }
    
    @IBAction func square(_ sender: UIButton) {
        currentInput = currentInput.squareRoot()
        
    }
    
}

