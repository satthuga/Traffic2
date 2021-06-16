//
//  FirstViewController.swift
//  TrafficLights
//
//  Created by Apple on 16/06/2021.
//

import UIKit

class FirstViewController: ViewController {

    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var yellowTextField: UITextField!
    
    @IBOutlet weak var greenTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.keyboardType = .numberPad
        greenTextField.keyboardType = .numberPad
        yellowTextField.keyboardType = .numberPad

    }
    
    @IBAction func goToSecondPress(_ sender: Any) {
        let secondVC = SecondViewController()

        guard let redTime = redTextField.text, let yellowTime = yellowTextField.text, let greenTime = greenTextField.text else { return }
        
        secondVC.data2.greenTime = Int(greenTime) ?? 0
        secondVC.data2.yellowTime = Int(yellowTime) ?? 0
        secondVC.data2.redTime = Int(redTime) ?? 0
            
        secondVC.modalPresentationStyle = .fullScreen
        
        self.present(secondVC, animated: true, completion: nil)
        
    }
    
    
}
